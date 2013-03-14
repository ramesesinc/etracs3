package etracs2.groovy;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.client.*;

abstract class CRUDController {
    @Binding
    def binding;
    
    def MODE_CREATE = 'create';
    def MODE_EDIT = 'edit';
    def MODE_VIEW = 'view';
    
    def selectedItem;
    def list;
    def mode = MODE_VIEW;
    def entity;
    def searchText;
    
    abstract def getService();
    def getCreateFocusComponent() { return "entity.objid"; }
    def getEditFocusComponent() { return "entity.objid"; }
    abstract def getListHandler();
    def createEntity() { return [:]; }
    
    void init() {
        entity = createEntity();
        list = getList( searchText, null );
    }
    
    void create() {
        entity = createEntity();
        mode = MODE_CREATE;
        focus( createFocusComponent );
    }
    
    void edit() {
        mode = MODE_EDIT;
        focus( editFocusComponent );
    }
    
    void cancel() {
        open( selectedItem?.objid );
        mode = MODE_VIEW;
        binding.refresh("entity.*");
        listHandler.load();
        focus( 'selectedItem' )
    }
    
    void save() {
        if( mode == MODE_CREATE) {
            entity = service.create( entity );
            insertItem( entity );
        } else {
            entity = service.update( entity );
            updateItem( entity );
        }
        mode = MODE_VIEW;
        binding.focus( "selectedItem" );
    }
    
    void delete() {
        if( MsgBox.confirm("Delete record?") ) {
            service.delete( entity );
            removeItem( entity )
            mode = MODE_VIEW;
        }
    }
    
    void removeItem( entity ) {
        def item = findEntityFromList( entity )
        list.remove( item );
        listHandler.load()
    }
    
    void approve(){
        if( MsgBox.confirm( "Are you sure you want to approve?" ) ){
            def result = svc.approve( selectedItem?.objid );
            if( entity ) entity.putAll( result );
            selectedItem.putAll( result );
            mode = MODE_VIEW;
        }
        listHandler.refresh();
        binding.refresh("entity.*");
        binding.focus( "selectedItem" );
    }
    
    void focus( name ) {
        binding.refresh("entity.*");
        binding.focus( name );
    }
    
    void setSelectedItem( item ) {
        selectedItem = item;
        if( mode == MODE_CREATE ) return;
        entity = selectedItem
        if( ! entity ) {
            entity = createEntity();
        }else{
            open( entity.objid )
        }
    }
    
    void search() {
        list = getList( searchText, null );
        listHandler.load();
    }
    
    def getList( searchValue, params ) {
        return svc.getList( searchValue, params );
    }
    
    void open( objid ) {
        if( objid ){
            entity = service.open( objid );
            if( ! entity) {
                entity = createEntity();
            }
        }else{
            entity = createEntity();
        }
    }
    
    void insertItem( item ) {
        if( selectedItem ) {
            def entity = findEntityFromList( selectedItem );
            if( entity )
                list.add( list.indexOf( entity ), item );
            else
                list.add( item );
        } else {
            list.add( item );
        }
    }
    void updateItem( item ) {
        def entity = findEntityFromList( item );
        if( entity ) {
            list.set( list.indexOf(entity), item );
        }
    }
    
    def findEntityFromList( item ) {
        return list.find{ a -> a.objid == item.objid };
    }
}
