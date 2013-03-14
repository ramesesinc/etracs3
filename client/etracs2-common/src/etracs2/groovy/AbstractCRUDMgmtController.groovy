package etracs2.groovy

import com.rameses.rcp.common.*
import com.rameses.rcp.annotations.*
import com.rameses.osiris2.client.*

abstract class AbstractCRUDMgmtController 
{
    @Binding
    def binding

    @Invoker
    def invoker 
            
    
    def MODE_CREATE = 'create'
    def MODE_EDIT   = 'edit'
    def MODE_VIEW   = 'view'            
	    
    def mode 
    def selectedItem
    def searchText
    def list = []
    def doctype 
    boolean requery = true 
    def opener 


    /*=======================================================
    ** Abstract Methods 
    =======================================================*/
    abstract def getService()
    abstract def getListColumns()

	
    def getTitle() {
        return invoker.caption
    }


    void init() {
        mode = MODE_VIEW
        doctype = invoker.properties.doctype 
        lookupOpener()
    }

    
    /*=======================================================
    ** Handlers
    =======================================================*/
    def oncreate = {
        mode = MODE_CREATE
    }


    def onadd = { entity ->
        insertItem( entity )
        mode = MODE_VIEW
        binding.focus('selectedItem')
        refreshList()
    }


    def onupdate = {  entity ->
        mode = MODE_VIEW
        updateItem( entity )
        refreshList()
    }


    def ondelete = {  entity ->
        try {
            list.remove( findItemFromList(entity) )
            refreshList()
        }
        catch(e ) {
            e.printStackTrace()
        }
    }


    def oncancel = { oldentity ->
        mode = MODE_VIEW
        refreshList()
    }


    void refreshList() {
        requery = false
        listHandler.refresh()
    }


    /*=======================================================
    ** Opener Support 
    =======================================================*/
    void setSelectedItem( item ) {
        this.selectedItem = item 
        lookupOpener()
    }


    void lookupOpener() {
        opener = InvokerUtil.lookupOpener( doctype + '_' + mode, [
                    service     : service, 
                    entity      : selectedItem, 
                    mode        : mode, 
                    binding     : binding,
                    oncreate    : oncreate,
                    onadd       : onadd,
                    onupdate    : onupdate,
                    ondelete    : ondelete,
                    oncancel    : oncancel,
                ])
    }


    /*=======================================================
    ** List Management
    =======================================================*/
    void search() {
        requery = true 
        listHandler.load()
    }
    

    def getList( searchValue, params ) {
        if( ! params ) params = [_start:0, _limit:25]
        return service.getList( searchValue, params )
    }


    def listHandler = [
        getRows    : { return 50 },
        getColumns : { return getListColumns() },
        fetchList  : { 
            if( requery ) {
                list = getList(searchText, it) 
                requery = false 
            }
            return list 
        }
    ] as PageListModel


    void insertItem( item ) {
        if( selectedItem ) {
            def entity = findItemFromList( selectedItem );
            if( entity )
                list.add( list.indexOf( entity ), item );
            else
                list.add( item );
        } else {
            list.add( item );
        }
    }


    void updateItem( item ) {
        def entity = findItemFromList( item );
        if( entity ) {
            list.set( list.indexOf(entity), item );
        }
    }

    
    def findItemFromList( item ) {
        return list.find{ a -> a.objid == item.objid }
    }
}
