/*
 * FAASList.java
 *
 * Created on November 3, 2010, 4:35 PM
 */

package etracs2.prov.taxpayer;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  jzamss
 */
@StyleSheet("etracs2/prov/taxpayer/ProvinceTaxpayerListPage.style")
public class ProvinceTaxpayerListPage extends javax.swing.JPanel {
    
    /** Creates new form FAASList */
    public ProvinceTaxpayerListPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel7 = new javax.swing.JPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        jSplitPane1 = new javax.swing.JSplitPane();
        jPanel1 = new javax.swing.JPanel();
        xSubFormPanel1 = new com.rameses.rcp.control.XSubFormPanel();
        jPanel6 = new javax.swing.JPanel();
        jPanel9 = new javax.swing.JPanel();
        xTable2 = new com.rameses.rcp.control.XTable();
        jPanel8 = new javax.swing.JPanel();
        xActionTextField2 = new com.rameses.rcp.control.XActionTextField();

        setLayout(new java.awt.BorderLayout());

        jPanel7.setLayout(new java.awt.BorderLayout());

        xLabel1.setBackground(new java.awt.Color(0, 51, 153));
        xLabel1.setBorder(javax.swing.BorderFactory.createEmptyBorder(3, 3, 3, 3));
        xLabel1.setForeground(new java.awt.Color(255, 255, 255));
        xLabel1.setFont(new java.awt.Font("Tahoma", 1, 18));
        xLabel1.setName("title");
        xLabel1.setOpaque(true);
        jPanel7.add(xLabel1, java.awt.BorderLayout.CENTER);

        add(jPanel7, java.awt.BorderLayout.NORTH);

        jSplitPane1.setBorder(javax.swing.BorderFactory.createMatteBorder(1, 1, 1, 1, new java.awt.Color(153, 153, 153)));
        jSplitPane1.setDividerLocation(450);
        jPanel1.setLayout(new java.awt.BorderLayout());

        xSubFormPanel1.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 1, 1, 1));
        xSubFormPanel1.setDepends(new String[] {"selectedItem"});
        xSubFormPanel1.setDynamic(true);
        xSubFormPanel1.setHandler("subformHandler");
        org.jdesktop.layout.GroupLayout xSubFormPanel1Layout = new org.jdesktop.layout.GroupLayout(xSubFormPanel1);
        xSubFormPanel1.setLayout(xSubFormPanel1Layout);
        xSubFormPanel1Layout.setHorizontalGroup(
            xSubFormPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 543, Short.MAX_VALUE)
        );
        xSubFormPanel1Layout.setVerticalGroup(
            xSubFormPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 513, Short.MAX_VALUE)
        );
        jPanel1.add(xSubFormPanel1, java.awt.BorderLayout.CENTER);

        jSplitPane1.setRightComponent(jPanel1);

        jPanel6.setLayout(new java.awt.BorderLayout());

        jPanel6.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 5, 1, 5));
        jPanel6.setPreferredSize(new java.awt.Dimension(450, 100));
        jPanel9.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Listing");
        jPanel9.setBorder(xTitledBorder1);
        xTable2.setAutoResize(false);
        xTable2.setDepends(new String[] {"selectedItem"});
        xTable2.setHandler("listHandler");
        xTable2.setName("selectedItem");
        xTable2.setPreferredSize(new java.awt.Dimension(0, 0));
        jPanel9.add(xTable2, java.awt.BorderLayout.CENTER);

        jPanel8.setLayout(new java.awt.BorderLayout());

        jPanel8.setBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 5, 5));
        jPanel8.setPreferredSize(new java.awt.Dimension(10, 27));
        xActionTextField2.setActionName("doSearch");
        xActionTextField2.setCaption("Seach");
        xActionTextField2.setCaptionMnemonic('s');
        xActionTextField2.setHint("Search");
        xActionTextField2.setName("search.textSearch");
        xActionTextField2.setPreferredSize(new java.awt.Dimension(250, 19));
        jPanel8.add(xActionTextField2, java.awt.BorderLayout.WEST);

        jPanel9.add(jPanel8, java.awt.BorderLayout.NORTH);

        jPanel6.add(jPanel9, java.awt.BorderLayout.CENTER);

        jSplitPane1.setLeftComponent(jPanel6);

        add(jSplitPane1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JPanel jPanel9;
    private javax.swing.JSplitPane jSplitPane1;
    private com.rameses.rcp.control.XActionTextField xActionTextField2;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XSubFormPanel xSubFormPanel1;
    private com.rameses.rcp.control.XTable xTable2;
    // End of variables declaration//GEN-END:variables
    
}
