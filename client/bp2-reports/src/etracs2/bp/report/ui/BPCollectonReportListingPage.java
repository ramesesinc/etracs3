/*
 * ConsolidatedReportAF.java
 *
 * Created on May 17, 2011, 11:04 AM
 */

package etracs2.bp.report.ui;

/**
 *
 * @author  rameses
 */
public class BPCollectonReportListingPage extends javax.swing.JPanel {
    
    /** Creates new form ConsolidatedReportAF */
    public BPCollectonReportListingPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xNumberField1 = new com.rameses.rcp.control.XNumberField();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xComboBox2 = new com.rameses.rcp.control.XComboBox();
        xComboBox3 = new com.rameses.rcp.control.XComboBox();
        xComboBox4 = new com.rameses.rcp.control.XComboBox();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(300, 137));
        xActionBar1.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 5, 0, 0));
        xActionBar1.setName("formActions");
        add(xActionBar1, java.awt.BorderLayout.NORTH);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Abstract of Collection Initial");
        formPanel1.setBorder(xTitledBorder1);
        xNumberField1.setCaption("Year");
        xNumberField1.setFieldType(Integer.class);
        xNumberField1.setIndex(-10);
        xNumberField1.setName("year");
        xNumberField1.setPreferredSize(new java.awt.Dimension(80, 19));
        xNumberField1.setRequired(true);
        formPanel1.add(xNumberField1);

        xComboBox1.setCaption("Quarter");
        xComboBox1.setImmediate(true);
        xComboBox1.setItems("quarterlist");
        xComboBox1.setName("qtr");
        xComboBox1.setPreferredSize(new java.awt.Dimension(125, 22));
        xComboBox1.setRequired(true);
        formPanel1.add(xComboBox1);

        xComboBox2.setCaption("Month");
        xComboBox2.setDepends(new String[] {"qtr"});
        xComboBox2.setDynamic(true);
        xComboBox2.setExpression("#{name}");
        xComboBox2.setImmediate(true);
        xComboBox2.setItems("monthlist");
        xComboBox2.setName("month");
        xComboBox2.setPreferredSize(new java.awt.Dimension(125, 22));
        formPanel1.add(xComboBox2);

        xComboBox3.setCaption("Day");
        xComboBox3.setDepends(new String[] {"month"});
        xComboBox3.setDynamic(true);
        xComboBox3.setImmediate(true);
        xComboBox3.setItems("daylist");
        xComboBox3.setName("day");
        xComboBox3.setPreferredSize(new java.awt.Dimension(125, 22));
        formPanel1.add(xComboBox3);

        xComboBox4.setCaption("Barangay");
        xComboBox4.setDynamic(true);
        xComboBox4.setEmptyText("ALL BARANGAYS");
        xComboBox4.setExpression("#{barangayname}");
        xComboBox4.setItems("barangaylist");
        xComboBox4.setName("barangay");
        xComboBox4.setPreferredSize(new java.awt.Dimension(125, 22));
        formPanel1.add(xComboBox4);

        add(formPanel1, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XComboBox xComboBox2;
    private com.rameses.rcp.control.XComboBox xComboBox3;
    private com.rameses.rcp.control.XComboBox xComboBox4;
    private com.rameses.rcp.control.XNumberField xNumberField1;
    // End of variables declaration//GEN-END:variables
    
}
