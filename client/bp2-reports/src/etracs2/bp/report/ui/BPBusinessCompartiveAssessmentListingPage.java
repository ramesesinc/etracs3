/*
 * BPReportInitPage.java
 *
 * Created on September 8, 2011, 1:31 PM
 */

package etracs2.bp.report.ui;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  jzamora
 */
@StyleSheet("etracs2/bp/report/BPBusinessCompartiveAssessmentListingPage.style")
public class BPBusinessCompartiveAssessmentListingPage extends javax.swing.JPanel {
    
    /** Creates new form BPReportInitPage */
    public BPBusinessCompartiveAssessmentListingPage() {
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
        xNumberField1 = new com.rameses.rcp.control.XNumberField();
        xNumberField2 = new com.rameses.rcp.control.XNumberField();
        xComboBox2 = new com.rameses.rcp.control.XComboBox();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Initial Information");
        formPanel1.setBorder(xTitledBorder1);
        xNumberField1.setCaption("Year From");
        xNumberField1.setCaptionWidth(100);
        xNumberField1.setCellPadding(new java.awt.Insets(10, 10, 0, 0));
        xNumberField1.setFieldType(Integer.class);
        xNumberField1.setName("yearfrom");
        xNumberField1.setPreferredSize(new java.awt.Dimension(100, 22));
        xNumberField1.setRequired(true);
        formPanel1.add(xNumberField1);

        xNumberField2.setCaption("Year to");
        xNumberField2.setCaptionWidth(100);
        xNumberField2.setCellPadding(new java.awt.Insets(0, 10, 0, 0));
        xNumberField2.setFieldType(Integer.class);
        xNumberField2.setName("yearto");
        xNumberField2.setPreferredSize(new java.awt.Dimension(100, 22));
        xNumberField2.setRequired(true);
        formPanel1.add(xNumberField2);

        xComboBox2.setAllowNull(false);
        xComboBox2.setCaption("Type");
        xComboBox2.setCaptionWidth(100);
        xComboBox2.setCellPadding(new java.awt.Insets(0, 10, 0, 0));
        xComboBox2.setImmediate(true);
        xComboBox2.setItems("typelist");
        xComboBox2.setName("type");
        xComboBox2.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox2.setRequired(true);
        formPanel1.add(xComboBox2);

        xComboBox1.setCaption("Quarter");
        xComboBox1.setCaptionWidth(100);
        xComboBox1.setCellPadding(new java.awt.Insets(0, 10, 0, 0));
        xComboBox1.setDepends(new String[] {"type"});
        xComboBox1.setDynamic(true);
        xComboBox1.setExpression("#{caption}");
        xComboBox1.setImmediate(true);
        xComboBox1.setItems("qtrlist");
        xComboBox1.setName("qtr");
        xComboBox1.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox1.setRequired(true);
        formPanel1.add(xComboBox1);

        xActionBar1.setBorder(new com.rameses.rcp.control.border.XUnderlineBorder());
        xActionBar1.setName("formActions");
        xActionBar1.setPadding(new java.awt.Insets(0, 5, 0, 0));

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(xActionBar1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 443, Short.MAX_VALUE)
            .add(layout.createSequentialGroup()
                .add(10, 10, 10)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 409, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 201, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(71, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XComboBox xComboBox2;
    private com.rameses.rcp.control.XNumberField xNumberField1;
    private com.rameses.rcp.control.XNumberField xNumberField2;
    // End of variables declaration//GEN-END:variables
    
}
