package etracs2.rpt.groovy;

import com.rameses.rcp.annotations.*
import com.rameses.rcp.common.* 
import com.rameses.osiris2.client.* 
import java.text.DecimalFormat;


public abstract class AbstractFAASController 
{
    @Binding
    def binding
    
    def faas = [:]
    def mode
            
    public abstract def getSvc()
    public abstract def getVar()
    public abstract def initFaasForTransaction()
    
    /*======================================================
    **
    ** OVERRIDABLES
    **
    ======================================================*/
    public void onsave(){}
    public def getTxnType() { return 'DC' }
    public def getTxnTitle() { return 'Data Capture' }
    
    public def getCommonInitTxnParams() {
        return [txntype:txntype, prevtdno:prevtdno, autonumber:autonumber, claimno:claimno, newrysetting:newrysetting]
    }
        
    def initTransaction() {
        faas = initFaasForTransaction()
        initFormFields( faas )
        return 'default'
    }
    
    
    //@FormId
    @FormTitle
    public def getTitle() {
        if( mode == 'create' ) 
            return 'FAAS (New)'
        return 'FAAS : ' + faas.info.tdno 
    }
    
    @Close
    public boolean closeForm() {
        if( mode == 'create' && !MsgBox.confirm('Discard changes?')) {
            return false
        }
        return true
    }
        
    def invokerparam = [
        getParams :  { return [faasid:faas?.objid] }
    ] as InvokerParameter
    
    def getFormActions() {
        return InvokerUtil.lookupActions('faasmgmt.action', invokerparam )
    }
    
    
    
    /*-----------------------------------------------------------------------------
    *
    * MainPage Support 
    *
    -----------------------------------------------------------------------------*/
    public def initCapture() {
        mode = 'create' 
        faas = svc.createFaas( )
        if( isProvinceLgu() ) {
            return 'newprov'
        }
        else {
            lgu = [objid:faas.lguid, lguname:faas.lguname]
        }
        return 'new'
    }
    
    public def initTxn() { 
        this.mode = 'create' 
        this.txntype = getTxnType() 
        this.txntitle = getTxnTitle()
        return 'txninit' 
    } 
    
    
    void open() {
        mode = 'view' 
        faas = svc.open( faas.objid )
        initFormFields( faas )
    }
    
    void save() {
        onsave()
        if( mode == 'create' )
            faas = svc.create( faas )
        else
            faas = svc.update( faas )
        mode = 'view'
    }
    
    def remove() {
        if( MsgBox.confirm('Delete FAAS?') ) {
            svc.delete( faas.objid )
            return '_close' 
        }
    }
    
    void submit() {
        if( MsgBox.confirm('Submit FAAS?') ) {
            save()
            faas = svc.submit( faas.objid )
        }
    }
    
    void submitRemote() {
        if( MsgBox.confirm('Submit FAAS?') ) {
            faas = svc.submitRemoteApproval( faas.objid )
        }
    }
    
    void approve() {
        if( MsgBox.confirm('Approve FAAS?') ) {
            save()
            faas = svc.approve( faas.objid )
        }
    }
    
    void approveRemote() {
        if( MsgBox.confirm('Approve FAAS?') ) {
            faas = svc.approveRemote( faas.objid )
        }
    }
    
    void disapprove() {
        if( MsgBox.confirm('Disapprove FAAS?') ) {
            save()
            faas = svc.disapprove( faas.objid )
        }
    }
    
    void submitToProvince() {
        if( MsgBox.confirm('Submit to Province?') ) {
            save()
            faas = svc.submitToProvince( faas.objid )
        }
    }
    
    void approveByProvince() {
        if( MsgBox.confirm('Approve FAAS?') ) {
            faas = svc.approveByProvince( faas.objid )
        }
    }    
    
    void disapproveByProvince() {
        if( MsgBox.confirm('Disapprove FAAS?') ) {
            save()
            faas = svc.disapproveByProvince( faas.objid )
        }
    }
    
    def caption 
    def remarks 
    public def disapproveRemote() {
        if( MsgBox.confirm('Disapprove FAAS record?') ) {
            remarks = null 
            caption = 'Disapprove Reason'
            return 'message' 
        }
        return null
    }
    
    
    def doDisapproveRemote() {
        faas = svc.disapproveRemote( faas.objid, remarks )
        return '_close' 
    }
    
    def doCancelDisapproveRemote() {
        return 'default' 
    }
    
    def onupdateRpu = { rpu ->
        binding.refresh('faas.rpu.*|totalmv|totalav')
    }
    
    def viewAssessment() {
        def openerType =  'rpu.' + faas.rpu.rputype 
        return InvokerUtil.lookupOpener(openerType, [onupdate:onupdateRpu, faas:faas, rpu:faas.rpu])
    }
    
    void initFormFields( faas ) {
        appraiser       = [ name : faas.info.appraisedby ]
        recommender     = [ name : faas.info.recommendedby ]
        approver        = [ name : faas.info.approvedby ]
        taxpayer        = [ entityname : faas.info.taxpayername ]
        administrator   = [ entityname : faas.info.administratorname ]
    }
    
    
    /*-----------------------------------------------------------------------------
    *
    * MainPage:Lookup Support 
    *
    -----------------------------------------------------------------------------*/
    def appraiser
    def recommender
    def approver
    def taxpayer
    def administrator
    
    def getLookupAppraiser() { 
        return InvokerUtil.lookupOpener('rptofficers.lookup', [officerType:'APPRAISER'])
    }

    void setAppraiser( appraiser ){
        this.appraiser              = appraiser 
        faas.info.appraisedbyid     = appraiser?.objid
        faas.info.appraisedby       = appraiser?.name
        faas.info.appraisedbytitle  = appraiser?.title 
    }
    
    def getLookupRecommender() {
        return InvokerUtil.lookupOpener('rptofficers.lookup',[officerType:'MUNICIPAL_ASSESSOR'])
    }
    
    void setRecommender( officer ) {
        this.recommender             = officer 
        faas.info.recommendedbyid    = officer?.objid
        faas.info.recommendedby      = officer?.name
        faas.info.recommendedbytitle = officer?.title 
    }
    
    def getLookupApprover() {
        return InvokerUtil.lookupOpener('rptofficers.lookup',[officerType:'APPROVER'])
    }
    
    void setApprover( officer ) {
        this.approver             = officer
        faas.info.approvedbyid    = officer?.objid
        faas.info.approvedby      = officer?.name
        faas.info.approvedbytitle = officer?.title 
    }
    
    def getLookupTaxpayer() {
        return InvokerUtil.lookupOpener('entity.lookup',[:])
    }
    
    void setTaxpayer( entity ) {
        this.taxpayer               = entity
        faas.info.taxpayerid        = entity?.objid
        faas.info.taxpayerno        = entity?.entityno
        faas.info.taxpayername      = entity?.entityname
        faas.info.taxpayeraddress   = entity?.entityaddress
        faas.info.ownername         = entity?.entityname
        faas.info.owneraddress      = entity?.entityaddress
        binding.refresh('faas.info.taxpayer.*|faas.info.owner.*')
    }
    
    def getLookupAdministrator() {
        return InvokerUtil.lookupOpener('entity.lookup',[:])
    }
    
    void setAdministrator( entity ) {
        this.administrator              = entity
        faas.info.administratorid       = entity?.objid 
        faas.info.administratorno       = entity?.entityno
        faas.info.administratorname     = entity?.entityname
        faas.info.administratoraddress  = entity?.entityaddress
        binding.refresh('faas.info.administrator.*')
    }
    
    
    
    
    List getTitleTypes()   { return svc.getTitleTypeList() }
    List getRestrictions() { return ['CARP','UNDER_LITIGATION','OTHER'] }
    
    
    /*-----------------------------------------------------------------------------
    *
    * NewPage Support (Initial Screen)
    *
    -----------------------------------------------------------------------------*/
    boolean iscondo = false 
    def barangay
    def municipality
    def section = 0
    def parcel = 0
    def lgu
    
    def create() {
        faas.info.txntype = faas.info.txn.txntype
        faas.lguid = lgu.objid
        faas.lguname = lgu.lguname 
        faas.rp.barangayid = barangay.objid
        faas.rp.barangay = barangay.lguname
        if( faas.rp.pintype == 'old' && barangay.oldindexno  ) {
            faas.rp.barangayindex = barangay.oldindexno 
        }
        else {
            faas.rp.barangayindex = barangay.indexno 
        }
        faas.rp.munidistrictid = barangay.parentid 
        setSectionInfo()
        setParcelInfo()
        faas = svc.validateCreate( faas )
        return 'default'
    } 
    
    void setSectionInfo() {
        String ssection = section+''
        if( ! ssection ) throw new Exception('Section is required.')
        def sectionlength = ( faas.rp.pintype == 'new' ? 3 : 2 )
        if( ssection.length() > sectionlength ) throw new Exception('Section must be ' +  sectionlength +' digits long.')
        faas.rp.section = ssection.padLeft( sectionlength, '0' )
    }
    
    void setParcelInfo() {
        String sparcel = parcel+''
        if( ! sparcel ) throw new Exception('Parcel is required.')
        def parcellength = ( faas.rp.pintype == 'new' ? 2 : 3 )
        if( sparcel.length() > parcellength ) throw new Exception('Parcel must be ' +  parcellength +' digits long.')
        faas.rp.parcel = sparcel.padLeft( parcellength, '0' )
    }
    
    String getTotalmv() {
        return moneyFormat( faas.rpu.totalmv )
    }
    
    String getTotalav() {
        return moneyFormat( faas.rpu.totalav )
    }
    
    String moneyFormat( value ) {
        return new DecimalFormat('#,##0.00').format( value )
    }
    
    List getTxnTypes() { return svc.getTxnTypes() }
    List getPinTypes() { return ['new', 'old'] }
    List getMunicipalities() { return svc.getMunicipalities() }
    
    def getLguList() {
        return svc.getCityMunicipalityList()
    }   
    
    List getBarangays(){ 
        return svc.getBarangays()
    }
    
    List getLguBarangays() {
        return svc.getBarangaysByLguType( lgu.objid, lgu.lgutype )
    }
    
    List getQuarters() { return [1,2,3,4] }
    
    
    boolean getShowSaveAction() {
        if( faas.remote == true ) return false 
        if( faas.docstate == 'INTERIM' ) return true
        if( faas.docstate == 'FORAPPROVAL' ) return true
        return false 
    }
    
    boolean getShowApproveAction() {
        if( faas.lgutype?.toLowerCase() == 'municipality'  ) return false
        if( faas.lgutype?.toLowerCase() == 'province'  ) return false
        if( faas.docstate != 'FORAPPROVAL' ) return false
        return true
    }
    
    boolean getShowApproveRemoteAction() {
        if( faas.docstate != 'FORAPPROVAL' ) return false
        return faas.remote == true 
    }
    
    boolean getShowDisapproveAction() {
        if( faas.lgutype?.toLowerCase() != 'city'  ) return false
        if( faas.docstate != 'FORAPPROVAL' ) return false
        return true
    }
    
    boolean getShowSubmitToProvinceAction() {
        if( faas.remote != null && faas.remote == true ) return false 
        if( faas.lgutype?.toLowerCase() != 'municipality'  ) return false
        if( faas.docstate != 'FORAPPROVAL' ) return false
        return true 
    }
    
    boolean getShowApprovedByProvinceAction() {
        def lgutype = faas.lgutype?.toLowerCase()
        if( lgutype == 'city'  ) return false
        if( lgutype == 'municipality' && faas.docstate == 'FORPROVAPPROVAL' ) return true
        if( lgutype == 'province' && faas.docstate == 'FORAPPROVAL' ) return true
        return false
    }
    
    boolean getShowDisapproveByProvinceAction() {
        def lgutype = faas.lgutype?.toLowerCase()
        if( lgutype == 'city'  ) return false
        if( lgutype == 'municipality' && faas.docstate == 'FORPROVAPPROVAL' ) return true
        if( lgutype == 'province' && faas.docstate == 'FORAPPROVAL' ) return true
        return false
    }
    
    boolean getShowDisapproveRemoteAction() {
        if( faas.docstate == 'CURRENT' || faas.docstate == 'CANCELLED' ) return false 
        if( faas.remote == null ) return false
        return faas.remote == true 
    }
    
    /*-----------------------------------------------------------------------------
    *
    * Transaction Support 
    *
    -----------------------------------------------------------------------------*/
    def prevtdno
    def prevtd
    boolean autonumber = false
    def txntitle
    def txntype
    def claimno = '-'
    
    def newrysetting
    
    List getRylist() {
        return grSvc.getRyList( prevtd?.rputype )
    }
    
    def getLookupCurrentFaas() {
        return InvokerUtil.lookupOpener( 'faas.lookup', [:] )
    }
    
    void setPrevtd( prevtd ) {
        if( prevtd ) {
            if( prevtd.docstate != 'CURRENT' ) {
                def msg = 'FAAS state is ' + prevtd.docstate + '.\nOnly current record is allowed.'
                MsgBox.alert( msg ) 
                throw new Exception(msg)
            }
            prevtdno = prevtd.tdno 
        }
        this.prevtd = prevtd 
    }
    
    boolean getAllowAutoNumber() {
        println 'TODO: faas.xml:getAllowAutoNumber -> check domain code and value'
        if( OsirisContext.env.DOMAIN == 'city' ) return true
        return false 
    }
    
    boolean getAllowEdit() {
        if( faas.docstate == 'FORREVIEW' ) return false
        if( faas.remote == true ) return false 
        if( faas.docstate == 'FORPROVAPPROVAL' ) return false
        if( faas.docstate == 'CURRENT' ) return false
        if( faas.docstate == 'CANCELLED' ) return false
        return true
    }
    
    public boolean getAllowEditOwner() {
        return false
    }
    
    public boolean getAllowEditPin() {
        return false
    }
    
    final boolean getAllowEditPinInfo() {
        if( faas.rpu.rputype != 'land' ) return false
        if( faas.info.datacapture == true ) return true 
        return getAllowEditPin()
    }
    
    boolean getAllowEditPrevInfo() {
        if( faas.docstate == 'FORPROVAPPROVAL' ) return false
        if( faas.docstate == 'CURRENT' ) return false
        if( faas.docstate == 'CANCELLED' ) return false
        if( faas.info.datacapture == false ) return false 
        return true 
    }
    
    boolean getShowDelete(){
        if( faas.docstate == 'FORREVIEW') return false 
        if( mode == 'create' ) return false
        if( faas.docstate == 'CURRENT' ) return false
        if( faas.docstate == 'CANCELLED' ) return false
        if( faas.docstate == 'FORPROVAPPROVAL' ) return false
        return true
    }
    
    boolean getEnableTdno() {
        if( faas.info.datacapture == true ) return true
        if( faas.info.datacapture == 1 ) return true 
        else if( faas.info.autonumber == false) return true
        else if( faas.info.autonumber == 0 ) return true
        return false
    }
    
    /*-----------------------------------------------------------------------------
    *
    * FaasActions Support 
    *
    -----------------------------------------------------------------------------*/
    boolean getShowViewPrevious() {
        if( faas.previousfaases?.size() > 0 ) return true
        return false
    }
    
    def viewPrevious() {
        if( faas.previousfaases.size() == 1 ) {
            def prevfaas = [ objid:faas.previousfaases[0].faasid ]
            return InvokerUtil.lookupOpener('faas_viewprevious.' + faas.info.txntype, [faas:prevfaas])
        }
        else {
            return InvokerUtil.lookupOpener('faaspreviouslist.open', [previousfaaslist:faas.previousfaases] )
        }
    }
    
    def openPrevious() {
        mode = 'view' 
        faas = svc.open( faas.objid )
        initFormFields( faas )
        return 'default'
    }
    
    
    
    def showAttachments() {
        return InvokerUtil.lookupOpener('faasattachment.open', [faas:faas] )
    }
    
        
    boolean getShowActions() {
        if( ! faas || faas.objid == null ) return false
        if( mode == 'create' ) return false
        return true
    }
    
    boolean isProvinceLgu() {
        return var.lgu_type?.toLowerCase() == 'province'
    }
    
    
}