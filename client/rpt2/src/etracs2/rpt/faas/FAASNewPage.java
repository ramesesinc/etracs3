/*
 * FAASNewPage.java
 *
 * Created on June 25, 2011, 10:35 AM
 */

package etracs2.rpt.faas;

import com.rameses.rcp.ui.annotations.StyleSheet;

/**
 *
 * @author  jzamora
 */
@StyleSheet("etracs2/rpt/faas/FAASNewPage.style")
public class FAASNewPage extends javax.swing.JPanel {
    
    /** Creates new form FAASNewPage */
    public FAASNewPage() {
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
        xComboBox2 = new com.rameses.rcp.control.XComboBox();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xNumberField2 = new com.rameses.rcp.control.XNumberField();
        xComboBox3 = new com.rameses.rcp.control.XComboBox();
        xNumberField3 = new com.rameses.rcp.control.XNumberField();
        xNumberField4 = new com.rameses.rcp.control.XNumberField();
        xNumberField5 = new com.rameses.rcp.control.XNumberField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        jPanel1 = new javax.swing.JPanel();
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xCheckBox1 = new com.rameses.rcp.control.XCheckBox();
        xActionBar1 = new com.rameses.rcp.control.XActionBar();

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("New FAAS Initial Information");
        formPanel1.setBorder(xTitledBorder1);
        xComboBox2.setAllowNull(false);
        xComboBox2.setCaption("PIN Type");
        xComboBox2.setCaptionWidth(100);
        xComboBox2.setImmediate(true);
        xComboBox2.setItems("pinTypes");
        xComboBox2.setName("faas.rp.pintype");
        xComboBox2.setPreferredSize(new java.awt.Dimension(100, 22));
        xComboBox2.setRequired(true);
        formPanel1.add(xComboBox2);

        xComboBox1.setCaption("Transaction");
        xComboBox1.setCaptionWidth(100);
        xComboBox1.setExpression("#{caption}");
        xComboBox1.setImmediate(true);
        xComboBox1.setIndex(-10);
        xComboBox1.setItems("txnTypes");
        xComboBox1.setName("faas.info.txn");
        xComboBox1.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox1.setRequired(true);
        formPanel1.add(xComboBox1);

        xNumberField2.setCaption("Revision Year");
        xNumberField2.setCaptionWidth(100);
        xNumberField2.setFieldType(Integer.class);
        xNumberField2.setName("faas.rpu.ry");
        xNumberField2.setPreferredSize(new java.awt.Dimension(100, 19));
        xNumberField2.setRequired(true);
        formPanel1.add(xNumberField2);

        xComboBox3.setCaption("Barangay");
        xComboBox3.setCaptionWidth(100);
        xComboBox3.setDepends(new String[] {"lgu"});
        xComboBox3.setExpression("#{lguname}");
        xComboBox3.setImmediate(true);
        xComboBox3.setIndex(-10);
        xComboBox3.setItems("barangays");
        xComboBox3.setName("barangay");
        xComboBox3.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox3.setRequired(true);
        formPanel1.add(xComboBox3);

        xNumberField3.setCaption("Section");
        xNumberField3.setCaptionWidth(100);
        xNumberField3.setFieldType(Integer.class);
        xNumberField3.setName("section");
        xNumberField3.setPreferredSize(new java.awt.Dimension(100, 19));
        xNumberField3.setRequired(true);
        formPanel1.add(xNumberField3);

        xNumberField4.setCaption("Parcel");
        xNumberField4.setCaptionWidth(100);
        xNumberField4.setFieldType(Integer.class);
        xNumberField4.setName("parcel");
        xNumberField4.setPreferredSize(new java.awt.Dimension(100, 19));
        xNumberField4.setRequired(true);
        formPanel1.add(xNumberField4);

        xNumberField5.setCaption("Suffix");
        xNumberField5.setCaptionWidth(100);
        xNumberField5.setFieldType(Integer.class);
        xNumberField5.setName("faas.rpu.suffix");
        xNumberField5.setPreferredSize(new java.awt.Dimension(100, 19));
        xNumberField5.setRequired(true);
        formPanel1.add(xNumberField5);

        xTextField2.setCaption("Claim No.");
        xTextField2.setCaptionWidth(100);
        xTextField2.setDepends(new String[] {"faas.info.txn", "barangay"});
        xTextField2.setName("faas.info.claimno");
        xTextField2.setPreferredSize(new java.awt.Dimension(100, 19));
        xTextField2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                xTextField2ActionPerformed(evt);
            }
        });

        formPanel1.add(xTextField2);

        jPanel1.setLayout(null);

        jPanel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));

        formPanel2.setCaptionBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 1));
        formPanel2.setPreferredSize(new java.awt.Dimension(0, 29));
        xTextField1.setCaption("Sub-Suffix");
        xTextField1.setDepends(new String[] {"iscondo", "faas.rpu.suffix"});
        xTextField1.setName("faas.rpu.subsuffix");
        xTextField1.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel2.add(xTextField1);

        jPanel1.add(formPanel2);
        formPanel2.setBounds(42, 24, 164, 29);

        xCheckBox1.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 5, 0, 0));
        xCheckBox1.setText("Is Condominium ?");
        xCheckBox1.setDepends(new String[] {"faas.rpu.suffix"});
        xCheckBox1.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xCheckBox1.setName("iscondo");
        xCheckBox1.setPreferredSize(new java.awt.Dimension(101, 19));
        jPanel1.add(xCheckBox1);
        xCheckBox1.setBounds(10, 6, 112, 18);

        xActionBar1.setBorder(new com.rameses.rcp.control.border.XUnderlineBorder());
        xActionBar1.setName("initCreateActions");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 490, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 344, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 344, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(xActionBar1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 217, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 62, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(81, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void xTextField2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_xTextField2ActionPerformed
// TODO add your handling code here:
    }//GEN-LAST:event_xTextField2ActionPerformed
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private javax.swing.JPanel jPanel1;
    private com.rameses.rcp.control.XActionBar xActionBar1;
    private com.rameses.rcp.control.XCheckBox xCheckBox1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XComboBox xComboBox2;
    private com.rameses.rcp.control.XComboBox xComboBox3;
    private com.rameses.rcp.control.XNumberField xNumberField2;
    private com.rameses.rcp.control.XNumberField xNumberField3;
    private com.rameses.rcp.control.XNumberField xNumberField4;
    private com.rameses.rcp.control.XNumberField xNumberField5;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField2;
    // End of variables declaration//GEN-END:variables
    
}
