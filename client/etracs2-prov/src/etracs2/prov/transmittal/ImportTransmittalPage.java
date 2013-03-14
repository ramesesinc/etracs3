/*
 * ImportTransmittalPage.java
 *
 * Created on January 6, 2011, 1:50 PM
 */

package etracs2.prov.transmittal;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  jzamss
 */
@StyleSheet("etracs2/prov/transmittal/ImportTransmittalPage.style")
public class ImportTransmittalPage extends javax.swing.JPanel {
    
    /** Creates new form ImportTransmittalPage */
    public ImportTransmittalPage() {
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
        jPanel2 = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xTable1 = new com.rameses.rcp.control.XTable();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(609, 230));
        xActionBar1.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 5, 0, 0));
        xActionBar1.setButtonCaptionOrientation(javax.swing.SwingConstants.BOTTOM);
        xActionBar1.setName("formActions");
        add(xActionBar1, java.awt.BorderLayout.NORTH);

        jPanel2.setLayout(new java.awt.BorderLayout());

        jPanel2.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 5, 5, 5));
        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setFont(new java.awt.Font("Tahoma", 1, 12));
        xTitledBorder1.setTitle("Transmittal Information");
        xTitledBorder1.setTitlePadding(new java.awt.Insets(2, 5, 2, 5));
        jPanel1.setBorder(xTitledBorder1);

        formPanel1.setCaptionWidth(110);
        formPanel1.setCellspacing(1);
        xLabel1.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xLabel1.setCaption("Transmittal No.");
        xLabel1.setFont(new java.awt.Font("Tahoma", 1, 11));
        xLabel1.setName("transmittal.docNo");
        xLabel1.setPreferredSize(new java.awt.Dimension(195, 19));
        formPanel1.add(xLabel1);

        xLabel2.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xLabel2.setCaption("LGU Name ");
        xLabel2.setFont(new java.awt.Font("Tahoma", 1, 11));
        xLabel2.setName("transmittal.lgu");
        xLabel2.setPreferredSize(new java.awt.Dimension(195, 19));
        formPanel1.add(xLabel2);

        xLabel4.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xLabel4.setCaption("Transmitted By");
        xLabel4.setFont(new java.awt.Font("Tahoma", 1, 11));
        xLabel4.setName("transmittal.transmittedBy");
        xLabel4.setPreferredSize(new java.awt.Dimension(195, 19));
        formPanel1.add(xLabel4);

        xLabel3.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        xLabel3.setCaption("Date Transmitted");
        xLabel3.setFont(new java.awt.Font("Tahoma", 1, 11));
        xLabel3.setName("transmittal.dtTransmitted");
        xLabel3.setPreferredSize(new java.awt.Dimension(195, 19));
        formPanel1.add(xLabel3);

        xTable1.setHandler("listHandler");

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 450, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, xTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 450, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 255, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel2.add(jPanel1, java.awt.BorderLayout.CENTER);

        add(jPanel2, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XTable xTable1;
    // End of variables declaration//GEN-END:variables
    
}