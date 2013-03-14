/*
 * tPreviewPage.java
 *
 * Created on January 13, 2011, 3:09 PM
 */

package etracs2.tc.remittance.report.ui;

/**
 *
 * @author  jzamss
 */
public class RemittanceByFundPage extends javax.swing.JPanel {
    
    /** Creates new form tPreviewPage */
    public RemittanceByFundPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        xReportPanel1 = new com.rameses.osiris2.reports.ui.XReportPanel();
        jPanel1 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        jSeparator1 = new javax.swing.JSeparator();

        setLayout(new java.awt.BorderLayout());

        xReportPanel1.setDepends(new String[] {"fund"});
        xReportPanel1.setName("report");
        org.jdesktop.layout.GroupLayout xReportPanel1Layout = new org.jdesktop.layout.GroupLayout(xReportPanel1);
        xReportPanel1.setLayout(xReportPanel1Layout);
        xReportPanel1Layout.setHorizontalGroup(
            xReportPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 604, Short.MAX_VALUE)
        );
        xReportPanel1Layout.setVerticalGroup(
            xReportPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 312, Short.MAX_VALUE)
        );
        add(xReportPanel1, java.awt.BorderLayout.CENTER);

        jPanel1.setLayout(new java.awt.BorderLayout());

        xComboBox1.setAllowNull(false);
        xComboBox1.setCaption("Fund");
        xComboBox1.setCaptionWidth(60);
        xComboBox1.setDynamic(true);
        xComboBox1.setExpression("#{fundname}");
        xComboBox1.setImmediate(true);
        xComboBox1.setItems("fundList");
        xComboBox1.setName("fund");
        xComboBox1.setPreferredSize(new java.awt.Dimension(200, 22));
        xComboBox1.setRequired(true);
        formPanel1.add(xComboBox1);

        jPanel1.add(formPanel1, java.awt.BorderLayout.SOUTH);

        xActionBar1.setButtonBorderPainted(false);
        xActionBar1.setButtonContentAreaFilled(false);
        xActionBar1.setName("formActions");
        jPanel1.add(xActionBar1, java.awt.BorderLayout.NORTH);

        jPanel1.add(jSeparator1, java.awt.BorderLayout.CENTER);

        add(jPanel1, java.awt.BorderLayout.NORTH);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JSeparator jSeparator1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.osiris2.reports.ui.XReportPanel xReportPanel1;
    // End of variables declaration//GEN-END:variables
    
}
