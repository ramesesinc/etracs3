/*
 * NoticeReportPage.java
 *
 * Created on August 18, 2011, 10:47 AM
 */

package etracs2.rpt.report.ui;

/**
 *
 * @author  jzamora
 */
public class ORFReportPage extends javax.swing.JPanel {
    
    /** Creates new form NoticeReportPage */
    public ORFReportPage() {
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
        xLookupField1 = new com.rameses.rcp.control.XLookupField();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("ORF Initial Information");
        formPanel1.setBorder(xTitledBorder1);
        xLookupField1.setCaption("Taxpayer");
        xLookupField1.setExpression("#{entityname}");
        xLookupField1.setHandler("lookupTaxpayer");
        xLookupField1.setName("taxpayer");
        xLookupField1.setPreferredSize(new java.awt.Dimension(0, 19));
        xLookupField1.setRequired(true);
        formPanel1.add(xLookupField1);

        com.rameses.rcp.control.border.XLineBorder xLineBorder1 = new com.rameses.rcp.control.border.XLineBorder();
        xLineBorder1.setLineColor(new java.awt.Color(153, 153, 153));
        xLabel1.setBorder(xLineBorder1);
        xLabel1.setCaption("Address");
        xLabel1.setName("taxpayeraddress");
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xLabel1);

        xActionBar1.setBorder(new com.rameses.rcp.control.border.XUnderlineBorder());
        xActionBar1.setDepends(new String[] {"selectedItem"});
        xActionBar1.setName("formActions");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(xActionBar1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 528, Short.MAX_VALUE)
            .add(layout.createSequentialGroup()
                .add(10, 10, 10)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 478, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 199, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(109, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    // End of variables declaration//GEN-END:variables
    
}
