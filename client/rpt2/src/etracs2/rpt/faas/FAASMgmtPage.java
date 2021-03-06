/*
 * AccountPage.java
 *
 * Created on February 27, 2011, 12:48 PM
 */

package etracs2.rpt.faas;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  jzamss
 */
@StyleSheet("etracs2/tc/stylesheet/Listing.style")
public class FAASMgmtPage extends javax.swing.JPanel {
    
    /** Creates new form AccountPage */
    public FAASMgmtPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel3 = new javax.swing.JPanel();
        xActionTextField1 = new com.rameses.rcp.control.XActionTextField();
        jPanel5 = new javax.swing.JPanel();
        xActionBar2 = new com.rameses.rcp.control.XActionBar();
        jPanel4 = new javax.swing.JPanel();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xButton1 = new com.rameses.rcp.control.XButton();
        jSplitPane1 = new javax.swing.JSplitPane();
        xDataTable1 = new com.rameses.rcp.control.XDataTable();
        jScrollPane1 = new javax.swing.JScrollPane();
        xEditorPane1 = new com.rameses.rcp.control.XEditorPane();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(748, 396));
        jPanel3.setLayout(new java.awt.BorderLayout());

        jPanel3.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 1, 3, 5));
        xActionTextField1.setActionName("search");
        xActionTextField1.setName("searchText");
        xActionTextField1.setPreferredSize(new java.awt.Dimension(200, 19));
        jPanel3.add(xActionTextField1, java.awt.BorderLayout.WEST);

        jPanel5.setLayout(new java.awt.BorderLayout());

        jPanel5.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 5, 0, 0));
        xActionBar2.setBorder(new com.rameses.rcp.control.border.XUnderlineBorder());
        xActionBar2.setDepends(new String[] {"selectedItem"});
        xActionBar2.setName("formActions");
        xActionBar2.setPadding(new java.awt.Insets(0, 5, 0, 0));
        jPanel5.add(xActionBar2, java.awt.BorderLayout.CENTER);

        jPanel4.setLayout(new java.awt.BorderLayout());

        xComboBox1.setCaption("Filter");
        xComboBox1.setCaptionWidth(50);
        xComboBox1.setDynamic(true);
        xComboBox1.setEmptyText("- Select Filter -");
        xComboBox1.setExpression("#{name}");
        xComboBox1.setImmediate(true);
        xComboBox1.setItems("filterlist");
        xComboBox1.setName("filter");
        jPanel4.add(xComboBox1, java.awt.BorderLayout.CENTER);

        xButton1.setText("...");
        xButton1.setName("createFilter");
        jPanel4.add(xButton1, java.awt.BorderLayout.EAST);

        jPanel5.add(jPanel4, java.awt.BorderLayout.WEST);

        jPanel3.add(jPanel5, java.awt.BorderLayout.CENTER);

        add(jPanel3, java.awt.BorderLayout.NORTH);

        jSplitPane1.setDividerLocation(200);
        jSplitPane1.setOrientation(javax.swing.JSplitPane.VERTICAL_SPLIT);
        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Listing");
        xDataTable1.setBorder(xTitledBorder1);
        xDataTable1.setHandler("listHandler");
        xDataTable1.setImmediate(true);
        xDataTable1.setName("selectedItem");
        jSplitPane1.setLeftComponent(xDataTable1);

        xEditorPane1.setDepends(new String[] {"selectedItem"});
        xEditorPane1.setName("html");
        jScrollPane1.setViewportView(xEditorPane1);

        jSplitPane1.setRightComponent(jScrollPane1);

        add(jSplitPane1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSplitPane jSplitPane1;
    private com.rameses.rcp.control.XActionBar xActionBar2;
    private com.rameses.rcp.control.XActionTextField xActionTextField1;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XDataTable xDataTable1;
    private com.rameses.rcp.control.XEditorPane xEditorPane1;
    // End of variables declaration//GEN-END:variables
    
}
