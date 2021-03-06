/*
 * ConsolidatedReportAF.java
 *
 * Created on May 17, 2011, 11:04 AM
 */

package etracs2.tc.report.ui;

/**
 *
 * @author  rameses
 */
public class CRAAFPage extends javax.swing.JPanel {
    
    /** Creates new form ConsolidatedReportAF */
    public CRAAFPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(300, 137));

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Consolidated AF Report");
        formPanel1.setBorder(xTitledBorder1);
        xComboBox1.setAllowNull(false);
        xComboBox1.setCaption("Month");
        xComboBox1.setDynamic(true);
        xComboBox1.setExpression("#{name}");
        xComboBox1.setImmediate(true);
        xComboBox1.setItems("monthList");
        xComboBox1.setName("months");
        xComboBox1.setPreferredSize(new java.awt.Dimension(130, 23));
        xComboBox1.setRequired(true);
        formPanel1.add(xComboBox1);

        xDateField1.setCaption("Year");
        xDateField1.setInputFormat("yyyy");
        xDateField1.setName("entity.year");
        xDateField1.setOutputFormat("yyyy");
        xDateField1.setPreferredSize(new java.awt.Dimension(60, 20));
        xDateField1.setRequired(true);
        xDateField1.setValueFormat("yyyy");
        formPanel1.add(xDateField1);

        add(formPanel1, java.awt.BorderLayout.CENTER);

        xActionBar1.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 5, 0, 0));
        xActionBar1.setName("formActions");
        add(xActionBar1, java.awt.BorderLayout.NORTH);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XDateField xDateField1;
    // End of variables declaration//GEN-END:variables
    
}
