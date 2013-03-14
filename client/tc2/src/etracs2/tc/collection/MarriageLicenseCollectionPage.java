/*
 * GeneralCollectionPage.java
 *
 * Created on April 20, 2011, 11:00 AM
 */

package etracs2.tc.collection;

import com.rameses.rcp.ui.annotations.StyleSheet;
import java.math.BigDecimal;

/**
 *
 * @author  jzamora
 */
@StyleSheet("etracs2/tc/collection/CollectionPage.style")
public class MarriageLicenseCollectionPage extends javax.swing.JPanel {
    
    /** Creates new form GeneralCollectionPage */
    public MarriageLicenseCollectionPage() {
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
        xLabel9 = new com.rameses.rcp.control.XLabel();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();
        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        xNumberField1 = new com.rameses.rcp.control.XNumberField();
        xNumberField2 = new com.rameses.rcp.control.XNumberField();
        xNumberField3 = new com.rameses.rcp.control.XNumberField();
        jPanel4 = new javax.swing.JPanel();
        jPanel5 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xLabel7 = new com.rameses.rcp.control.XLabel();
        xLabel10 = new com.rameses.rcp.control.XLabel();
        xLabel8 = new com.rameses.rcp.control.XLabel();
        xActionTextField1 = new com.rameses.rcp.control.XActionTextField();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xDateField1 = new com.rameses.rcp.control.XDateField();
        xSubFormPanel1 = new com.rameses.rcp.control.XSubFormPanel();
        jPanel6 = new javax.swing.JPanel();
        jPanel7 = new javax.swing.JPanel();
        formPanel3 = new com.rameses.rcp.util.FormPanel();
        xSeparator1 = new com.rameses.rcp.control.XSeparator();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xTextField4 = new com.rameses.rcp.control.XTextField();
        formPanel4 = new com.rameses.rcp.util.FormPanel();
        xNumberField4 = new com.rameses.rcp.control.XNumberField();
        xNumberField5 = new com.rameses.rcp.control.XNumberField();
        xSeparator2 = new com.rameses.rcp.control.XSeparator();
        xTextField5 = new com.rameses.rcp.control.XTextField();
        xTextField6 = new com.rameses.rcp.control.XTextField();
        formPanel6 = new com.rameses.rcp.util.FormPanel();
        xNumberField6 = new com.rameses.rcp.control.XNumberField();
        xNumberField7 = new com.rameses.rcp.control.XNumberField();
        xSeparator3 = new com.rameses.rcp.control.XSeparator();
        xTextField7 = new com.rameses.rcp.control.XTextField();
        xTextField8 = new com.rameses.rcp.control.XTextField();
        xTextField9 = new com.rameses.rcp.control.XTextField();
        xTextField10 = new com.rameses.rcp.control.XTextField();

        setLayout(new java.awt.BorderLayout());

        setPreferredSize(new java.awt.Dimension(884, 487));
        jPanel3.setLayout(new java.awt.BorderLayout());

        xLabel9.setBackground(new java.awt.Color(1, 47, 8));
        xLabel9.setForeground(new java.awt.Color(255, 255, 255));
        xLabel9.setFont(new java.awt.Font("Arial", 1, 18));
        xLabel9.setName("collectionTitle");
        xLabel9.setOpaque(true);
        jPanel3.add(xLabel9, java.awt.BorderLayout.SOUTH);

        xActionBar1.setName("formActions");
        jPanel3.add(xActionBar1, java.awt.BorderLayout.CENTER);

        add(jPanel3, java.awt.BorderLayout.NORTH);

        jPanel1.setLayout(new java.awt.BorderLayout());

        jPanel1.setPreferredSize(new java.awt.Dimension(230, 100));
        jPanel2.setLayout(null);

        jPanel2.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 18));
        jLabel3.setText("Amount Due:");
        jPanel2.add(jLabel3);
        jLabel3.setBounds(12, 14, 158, 20);

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 18));
        jLabel4.setText("Total Payment:");
        jPanel2.add(jLabel4);
        jLabel4.setBounds(12, 92, 206, 20);

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 18));
        jLabel5.setForeground(new java.awt.Color(204, 0, 0));
        jLabel5.setText("Change:");
        jPanel2.add(jLabel5);
        jLabel5.setBounds(12, 170, 158, 20);

        xNumberField1.setEditable(false);
        xNumberField1.setFieldType(BigDecimal.class);
        xNumberField1.setFocusable(false);
        xNumberField1.setFont(new java.awt.Font("Tahoma", 1, 24));
        xNumberField1.setIndex(100);
        xNumberField1.setName("entity.info.amount");
        xNumberField1.setOpaque(false);
        xNumberField1.setPattern("#,##0.00");
        xNumberField1.setReadonly(true);
        jPanel2.add(xNumberField1);
        xNumberField1.setBounds(12, 38, 206, 48);

        xNumberField2.setEditable(false);
        xNumberField2.setFieldType(BigDecimal.class);
        xNumberField2.setFocusable(false);
        xNumberField2.setFont(new java.awt.Font("Tahoma", 1, 24));
        xNumberField2.setIndex(100);
        xNumberField2.setName("entity.info.totalpayment");
        xNumberField2.setOpaque(false);
        xNumberField2.setPattern("#,##0.00");
        xNumberField2.setReadonly(true);
        jPanel2.add(xNumberField2);
        xNumberField2.setBounds(12, 116, 206, 48);

        xNumberField3.setEditable(false);
        xNumberField3.setFieldType(BigDecimal.class);
        xNumberField3.setFocusable(false);
        xNumberField3.setFont(new java.awt.Font("Tahoma", 1, 24));
        xNumberField3.setForeground(new java.awt.Color(204, 0, 0));
        xNumberField3.setIndex(100);
        xNumberField3.setName("entity.info.change");
        xNumberField3.setOpaque(false);
        xNumberField3.setPattern("#,##0.00");
        xNumberField3.setReadonly(true);
        jPanel2.add(xNumberField3);
        xNumberField3.setBounds(12, 196, 206, 48);

        jPanel1.add(jPanel2, java.awt.BorderLayout.CENTER);

        add(jPanel1, java.awt.BorderLayout.EAST);

        jPanel4.setLayout(new java.awt.BorderLayout());

        jPanel5.setLayout(new java.awt.BorderLayout());

        formPanel1.setCaptionBorder(null);
        formPanel1.setCaptionFont(new java.awt.Font("Arial", 0, 12));
        formPanel1.setPadding(new java.awt.Insets(8, 8, 8, 8));

        formPanel2.setCaptionBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 1));
        formPanel2.setCaptionFont(new java.awt.Font("Arial", 0, 12));
        formPanel2.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel2.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel2.setPreferredSize(new java.awt.Dimension(0, 22));
        formPanel2.setShowCaption(false);
        xLabel4.setForeground(new java.awt.Color(204, 0, 0));
        xLabel4.setCaption("AF No. ");
        xLabel4.setCaptionWidth(75);
        xLabel4.setFont(new java.awt.Font("Arial", 1, 14));
        xLabel4.setName("entity.info.afid");
        xLabel4.setPreferredSize(new java.awt.Dimension(60, 20));
        formPanel2.add(xLabel4);

        xLabel7.setForeground(new java.awt.Color(204, 0, 0));
        xLabel7.setCaption("Serial No.");
        xLabel7.setCaptionWidth(80);
        xLabel7.setFont(new java.awt.Font("Arial", 1, 14));
        xLabel7.setName("entity.info.serialno");
        xLabel7.setPreferredSize(new java.awt.Dimension(150, 20));
        formPanel2.add(xLabel7);

        xLabel10.setForeground(new java.awt.Color(204, 0, 0));
        xLabel10.setCaption("Stub No.");
        xLabel10.setCaptionWidth(65);
        xLabel10.setFont(new java.awt.Font("Arial", 1, 14));
        xLabel10.setName("entity.info.stubno");
        xLabel10.setPreferredSize(new java.awt.Dimension(100, 20));
        formPanel2.add(xLabel10);

        xLabel8.setForeground(new java.awt.Color(204, 0, 0));
        xLabel8.setCaption("Mode");
        xLabel8.setCaptionWidth(50);
        xLabel8.setFont(new java.awt.Font("Arial", 1, 14));
        xLabel8.setName("entity.info.mode");
        xLabel8.setPreferredSize(new java.awt.Dimension(150, 20));
        formPanel2.add(xLabel8);

        formPanel1.add(formPanel2);

        xActionTextField1.setActionName("lookupEntity");
        xActionTextField1.setCaption("Payor");
        xActionTextField1.setCaptionWidth(75);
        xActionTextField1.setFont(new java.awt.Font("Arial", 0, 12));
        xActionTextField1.setHint("Search Payor");
        xActionTextField1.setIndex(-10);
        xActionTextField1.setName("entity.info.payorname");
        xActionTextField1.setPreferredSize(new java.awt.Dimension(0, 20));
        formPanel1.add(xActionTextField1);

        xTextField1.setCaption("Paid By");
        xTextField1.setCaptionWidth(75);
        xTextField1.setFont(new java.awt.Font("Arial", 0, 12));
        xTextField1.setName("entity.info.paidby");
        xTextField1.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField1.setRequired(true);
        formPanel1.add(xTextField1);

        xTextField2.setCaption("Address");
        xTextField2.setCaptionWidth(75);
        xTextField2.setFont(new java.awt.Font("Arial", 0, 12));
        xTextField2.setName("entity.info.paidbyaddress");
        xTextField2.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField2.setRequired(true);
        formPanel1.add(xTextField2);

        xDateField1.setCaption("Txn Date ");
        xDateField1.setCaptionWidth(75);
        xDateField1.setDepends(new String[] {"af"});
        xDateField1.setFont(new java.awt.Font("Arial", 0, 12));
        xDateField1.setName("entity.info.txndate");
        xDateField1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xDateField1);

        jPanel5.add(formPanel1, java.awt.BorderLayout.NORTH);

        xSubFormPanel1.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        xSubFormPanel1.setHandler("paymentSummary");
        xSubFormPanel1.setPreferredSize(new java.awt.Dimension(40, 120));
        jPanel5.add(xSubFormPanel1, java.awt.BorderLayout.SOUTH);

        jPanel6.setPreferredSize(new java.awt.Dimension(566, 382));
        jPanel7.setBackground(java.awt.SystemColor.controlHighlight);
        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Marriage License and Fee Information");
        jPanel7.setBorder(xTitledBorder1);

        formPanel3.setCaptionBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 1));
        formPanel3.setCaptionFont(new java.awt.Font("Arial", 0, 12));
        xSeparator1.setCaption("Groom Information");
        xSeparator1.setCaptionWidth(120);
        xSeparator1.setFont(new java.awt.Font("Tahoma", 1, 12));
        xSeparator1.setPreferredSize(new java.awt.Dimension(0, 20));
        xSeparator1.setShowCaption(true);
        org.jdesktop.layout.GroupLayout xSeparator1Layout = new org.jdesktop.layout.GroupLayout(xSeparator1);
        xSeparator1.setLayout(xSeparator1Layout);
        xSeparator1Layout.setHorizontalGroup(
            xSeparator1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 500, Short.MAX_VALUE)
        );
        xSeparator1Layout.setVerticalGroup(
            xSeparator1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 20, Short.MAX_VALUE)
        );
        formPanel3.add(xSeparator1);

        xTextField3.setCaption("Name");
        xTextField3.setCaptionWidth(120);
        xTextField3.setCellPadding(new java.awt.Insets(0, 20, 0, 0));
        xTextField3.setFont(new java.awt.Font("Arial", 0, 12));
        xTextField3.setIndex(-10);
        xTextField3.setName("entity.groomname");
        xTextField3.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField3.setRequired(true);
        formPanel3.add(xTextField3);

        xTextField4.setCaption("Address");
        xTextField4.setCaptionWidth(120);
        xTextField4.setCellPadding(new java.awt.Insets(0, 20, 0, 0));
        xTextField4.setFont(new java.awt.Font("Arial", 0, 12));
        xTextField4.setName("entity.groomaddress");
        xTextField4.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField4.setRequired(true);
        formPanel3.add(xTextField4);

        formPanel4.setCaptionBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 1));
        formPanel4.setCaptionFont(new java.awt.Font("Arial", 0, 12));
        formPanel4.setCellpadding(new java.awt.Insets(10, 0, 0, 0));
        formPanel4.setCellspacing(5);
        formPanel4.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel4.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel4.setPreferredSize(new java.awt.Dimension(0, 22));
        formPanel4.setShowCaption(false);
        xNumberField4.setCaption("Age -> Years");
        xNumberField4.setCaptionWidth(120);
        xNumberField4.setCellPadding(new java.awt.Insets(0, 20, 0, 0));
        xNumberField4.setFieldType(Integer.class);
        xNumberField4.setFont(new java.awt.Font("Arial", 0, 12));
        xNumberField4.setName("entity.groomageyear");
        xNumberField4.setPreferredSize(new java.awt.Dimension(100, 19));
        xNumberField4.setRequired(true);
        formPanel4.add(xNumberField4);

        xNumberField5.setCaption("Months");
        xNumberField5.setCaptionWidth(70);
        xNumberField5.setFieldType(Integer.class);
        xNumberField5.setFont(new java.awt.Font("Arial", 0, 12));
        xNumberField5.setName("entity.groomagemonth");
        xNumberField5.setPreferredSize(new java.awt.Dimension(100, 19));
        formPanel4.add(xNumberField5);

        formPanel3.add(formPanel4);

        xSeparator2.setCaption("Bride Information");
        xSeparator2.setCaptionWidth(120);
        xSeparator2.setCellPadding(new java.awt.Insets(5, 0, 0, 0));
        xSeparator2.setFont(new java.awt.Font("Tahoma", 1, 12));
        xSeparator2.setPreferredSize(new java.awt.Dimension(0, 20));
        xSeparator2.setShowCaption(true);
        org.jdesktop.layout.GroupLayout xSeparator2Layout = new org.jdesktop.layout.GroupLayout(xSeparator2);
        xSeparator2.setLayout(xSeparator2Layout);
        xSeparator2Layout.setHorizontalGroup(
            xSeparator2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 500, Short.MAX_VALUE)
        );
        xSeparator2Layout.setVerticalGroup(
            xSeparator2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 20, Short.MAX_VALUE)
        );
        formPanel3.add(xSeparator2);

        xTextField5.setCaption("Name");
        xTextField5.setCaptionWidth(120);
        xTextField5.setCellPadding(new java.awt.Insets(0, 20, 0, 0));
        xTextField5.setFont(new java.awt.Font("Arial", 0, 12));
        xTextField5.setName("entity.bridename");
        xTextField5.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField5.setRequired(true);
        formPanel3.add(xTextField5);

        xTextField6.setCaption("Address");
        xTextField6.setCaptionWidth(120);
        xTextField6.setCellPadding(new java.awt.Insets(0, 20, 0, 0));
        xTextField6.setFont(new java.awt.Font("Arial", 0, 12));
        xTextField6.setName("entity.brideaddress");
        xTextField6.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField6.setRequired(true);
        formPanel3.add(xTextField6);

        formPanel6.setCaptionBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 1));
        formPanel6.setCaptionFont(new java.awt.Font("Arial", 0, 12));
        formPanel6.setCellspacing(5);
        formPanel6.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel6.setPadding(new java.awt.Insets(0, 0, 0, 0));
        formPanel6.setPreferredSize(new java.awt.Dimension(0, 22));
        formPanel6.setShowCaption(false);
        xNumberField6.setCaption("Age -> Years");
        xNumberField6.setCaptionWidth(120);
        xNumberField6.setCellPadding(new java.awt.Insets(0, 20, 0, 0));
        xNumberField6.setFieldType(Integer.class);
        xNumberField6.setFont(new java.awt.Font("Arial", 0, 12));
        xNumberField6.setName("entity.brideageyear");
        xNumberField6.setPreferredSize(new java.awt.Dimension(100, 19));
        xNumberField6.setRequired(true);
        formPanel6.add(xNumberField6);

        xNumberField7.setCaption("Months");
        xNumberField7.setCaptionWidth(70);
        xNumberField7.setCellPadding(new java.awt.Insets(0, 20, 0, 0));
        xNumberField7.setFieldType(Integer.class);
        xNumberField7.setFont(new java.awt.Font("Arial", 0, 12));
        xNumberField7.setName("entity.brideagemonth");
        xNumberField7.setPreferredSize(new java.awt.Dimension(100, 19));
        formPanel6.add(xNumberField7);

        formPanel3.add(formPanel6);

        xSeparator3.setCaption("License Fee Detail");
        xSeparator3.setCaptionWidth(120);
        xSeparator3.setCellPadding(new java.awt.Insets(5, 0, 0, 0));
        xSeparator3.setFont(new java.awt.Font("Tahoma", 1, 12));
        xSeparator3.setPreferredSize(new java.awt.Dimension(0, 20));
        xSeparator3.setShowCaption(true);
        org.jdesktop.layout.GroupLayout xSeparator3Layout = new org.jdesktop.layout.GroupLayout(xSeparator3);
        xSeparator3.setLayout(xSeparator3Layout);
        xSeparator3Layout.setHorizontalGroup(
            xSeparator3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 500, Short.MAX_VALUE)
        );
        xSeparator3Layout.setVerticalGroup(
            xSeparator3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 20, Short.MAX_VALUE)
        );
        formPanel3.add(xSeparator3);

        xTextField7.setCaption("Register No.");
        xTextField7.setCaptionWidth(120);
        xTextField7.setCellPadding(new java.awt.Insets(0, 20, 0, 0));
        xTextField7.setFont(new java.awt.Font("Arial", 0, 14));
        xTextField7.setName("entity.registerno");
        xTextField7.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField7.setRequired(true);
        formPanel3.add(xTextField7);

        xTextField8.setCaption("Attachments");
        xTextField8.setCaptionWidth(120);
        xTextField8.setCellPadding(new java.awt.Insets(0, 20, 0, 0));
        xTextField8.setFont(new java.awt.Font("Arial", 0, 14));
        xTextField8.setName("entity.attachments");
        xTextField8.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField8.setRequired(true);
        formPanel3.add(xTextField8);

        xTextField9.setCaption("LCR Officer");
        xTextField9.setCaptionWidth(120);
        xTextField9.setCellPadding(new java.awt.Insets(0, 20, 0, 0));
        xTextField9.setFont(new java.awt.Font("Arial", 0, 14));
        xTextField9.setName("entity.lcrofficer");
        xTextField9.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField9.setRequired(true);
        formPanel3.add(xTextField9);

        xTextField10.setCaption("Job Title");
        xTextField10.setCaptionWidth(120);
        xTextField10.setCellPadding(new java.awt.Insets(0, 20, 0, 0));
        xTextField10.setFont(new java.awt.Font("Arial", 0, 14));
        xTextField10.setName("entity.lcrofficertitle");
        xTextField10.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField10.setRequired(true);
        formPanel3.add(xTextField10);

        org.jdesktop.layout.GroupLayout jPanel7Layout = new org.jdesktop.layout.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel7Layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 630, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel7Layout.createSequentialGroup()
                .add(formPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 321, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        org.jdesktop.layout.GroupLayout jPanel6Layout = new org.jdesktop.layout.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel7, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel7, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 340, Short.MAX_VALUE)
        );
        jPanel5.add(jPanel6, java.awt.BorderLayout.CENTER);

        jPanel4.add(jPanel5, java.awt.BorderLayout.CENTER);

        add(jPanel4, java.awt.BorderLayout.CENTER);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private com.rameses.rcp.util.FormPanel formPanel3;
    private com.rameses.rcp.util.FormPanel formPanel4;
    private com.rameses.rcp.util.FormPanel formPanel6;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XActionTextField xActionTextField1;
    private com.rameses.rcp.control.XDateField xDateField1;
    private com.rameses.rcp.control.XLabel xLabel10;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel7;
    private com.rameses.rcp.control.XLabel xLabel8;
    private com.rameses.rcp.control.XLabel xLabel9;
    private com.rameses.rcp.control.XNumberField xNumberField1;
    private com.rameses.rcp.control.XNumberField xNumberField2;
    private com.rameses.rcp.control.XNumberField xNumberField3;
    private com.rameses.rcp.control.XNumberField xNumberField4;
    private com.rameses.rcp.control.XNumberField xNumberField5;
    private com.rameses.rcp.control.XNumberField xNumberField6;
    private com.rameses.rcp.control.XNumberField xNumberField7;
    private com.rameses.rcp.control.XSeparator xSeparator1;
    private com.rameses.rcp.control.XSeparator xSeparator2;
    private com.rameses.rcp.control.XSeparator xSeparator3;
    private com.rameses.rcp.control.XSubFormPanel xSubFormPanel1;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField10;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    private com.rameses.rcp.control.XTextField xTextField4;
    private com.rameses.rcp.control.XTextField xTextField5;
    private com.rameses.rcp.control.XTextField xTextField6;
    private com.rameses.rcp.control.XTextField xTextField7;
    private com.rameses.rcp.control.XTextField xTextField8;
    private com.rameses.rcp.control.XTextField xTextField9;
    // End of variables declaration//GEN-END:variables
    
}