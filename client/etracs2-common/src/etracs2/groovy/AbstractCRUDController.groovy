package etracs2.groovy

import com.rameses.rcp.common.*
import com.rameses.rcp.annotations.*
import com.rameses.osiris2.client.*

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.client.*;
import java.rmi.server.UID

abstract class AbstractCRUDController 
{
    @Binding
    def binding 
    
    def MODE_CREATE = 'create'
    def MODE_EDIT   = 'edit'
    def MODE_VIEW   = 'view'
            
    def service 
    def mode 
    def entity 
    def oldentity 


    /*==============================================================================
    ** Handlers
    ==============================================================================*/
    def oncreate
    def onadd 
    def onupdate 
    def ondelete 
    def oncancel

    
    /*==============================================================================
    ** Abstract Methods
    ==============================================================================*/
    def getService() { return service }


    /*=======================================================
    ** Support Methods
    =======================================================*/
    def getAllowEdit() {
        return true
    }


    def getCreateFocusComponent() {
        return 'entity.objid'
    }


    def getEditFocusComponent() {
        return 'entity.objid'
    }


    void focus( component ) {
        binding.focus( component )
    }


    /*================================================================================
    **
    ** Standard formActions
    **
    ================================================================================*/
    void initCreate() {
        cloneEntity()
        entity = createEntity()
        mode = MODE_CREATE
        invokeOnCreate()
        focus( createFocusComponent )
    }

    
    void open() {   
        if( entity ) {
            entity = service.open( entity.objid )
        }
        else {
           entity = createEntity()
        }
        mode = MODE_VIEW
    }
    

    void create(){
        if( ! entity.objid ) entity.objid = 'MS' + (new java.rmi.server.UID())
        entity = service.create( entity )
    }


    void update() {
        entity = service.update( entity )
    }


    final void save() {
        if( mode == MODE_CREATE ) {
            create()
            invokeOnAdd()
        }
        else {
            update()
            invokeOnUpdate()
        }
        mode = MODE_VIEW
    }
    

    void edit() {
        cloneEntity()
        mode = MODE_EDIT
        focus( editFocusComponent )
    }
    

    void cancel(){
        mode = MODE_VIEW
        invokeOnCancel()
        if( oldentity ) {
            entity.putAll( oldentity )
            oldentity = null 
        }
        open()
    }


    void delete(){
        if( MsgBox.confirm('Delete selected item?') ) {
            service.delete( entity  )
            invokeOnDelete()
        }
    }


    void approve(){
        if( MsgBox.confirm('Approve record?') ) {
            entity = service.approve( entity.objid )
            invokeOnUpdate()
        }
    }


    def createEntity() {
        return [:]
    }


    void cloneEntity() {
        if( entity ) {
            oldentity = [:]
            oldentity.putAll( entity )
        }
    }


    void invokeOnDelete() {
        if( ondelete ) ondelete( entity )
    }


    void invokeOnCancel(){
        if( oncancel ) oncancel( oldentity )
    }


    void invokeOnUpdate(){
        if( onupdate ) onupdate( entity )
    }
    

    void invokeOnAdd(){
        if( onadd ) onadd( entity )
    }


    void invokeOnCreate(){
        if( oncreate ) oncreate( entity )
    }
    
}
