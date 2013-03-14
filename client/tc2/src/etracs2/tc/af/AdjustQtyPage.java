/*
 * AdjustQtyPage.java
 *
 * Created on September 20, 2011, 9:28 AM
 */

package etracs2.tc.af;

/**
 *
 * @author  jzamora
 */
public class AdjustQtyPage extends javax.swing.JPanel {
    
    /** Creates new form AdjustQtyPage */
    public AdjustQtyPage() {
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
        formPanel2 = new com.rameses.rcp.util.FormPanel();
        xNumberField4 = new com.rameses.rcp.control.XNumberField();
        xCheckBox1 = new com.rameses.rcp.control.XCheckBox();
        xNumberField3 = new com.rameses.rcp.control.XNumberField();
        xButton1 = new com.rameses.rcp.control.XButton();
        xButton2 = new com.rameses.rcp.control.XButton();

        setPreferredSize(new java.awt.Dimension(330, 247));

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Quantity Adjustment Detail");
        formPanel1.setBorder(xTitledBorder1);
        xNumberField1.setCaption("Qty. Received");
        xNumberField1.setCaptionWidth(110);
        xNumberField1.setCellPadding(new java.awt.Insets(5, 0, 0, 0));
        xNumberField1.setEnabled(false);
        xNumberField1.setFieldType(Integer.class);
        xNumberField1.setFont(new java.awt.Font("Arial", 1, 11));
        xNumberField1.setName("qtyreceived");
        xNumberField1.setPreferredSize(new java.awt.Dimension(80, 19));
        formPanel1.add(xNumberField1);

        formPanel2.setLayout(null);

        formPanel2.setOrientation(com.rameses.rcp.constant.UIConstants.HORIZONTAL);
        formPanel2.setPadding(new java.awt.Insets(5, 0, 5, 5));
        formPanel2.setShowCaption(false);
        xNumberField4.setCaption("Qty. Adjustment");
        xNumberField4.setCaptionWidth(110);
        xNumberField4.setDepends(new String[] {"adjneg"});
        xNumberField4.setFieldType(Integer.class);
        xNumberField4.setFont(new java.awt.Font("Arial", 1, 11));
        xNumberField4.setName("qtyadjustment");
        xNumberField4.setPreferredSize(new java.awt.Dimension(80, 19));
        xNumberField4.setRequired(true);
        formPanel2.add(xNumberField4);
        xNumberField4.setBounds(117, 5, 80, 20);

        xCheckBox1.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xCheckBox1.setText("Adjust Negative?");
        xCheckBox1.setCaption("");
        xCheckBox1.setCaptionWidth(110);
        xCheckBox1.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xCheckBox1.setName("adjneg");
        xCheckBox1.setShowCaption(false);
        formPanel2.add(xCheckBox1);
        xCheckBox1.setBounds(210, 10, 99, 15);

        formPanel1.add(formPanel2);

        xNumberField3.setCaption("New Quantity");
        xNumberField3.setCaptionWidth(110);
        xNumberField3.setDepends(new String[] {"qtyadjustment"});
        xNumberField3.setEnabled(false);
        xNumberField3.setFieldType(Integer.class);
        xNumberField3.setFont(new java.awt.Font("Arial", 1, 11));
        xNumberField3.setName("newqty");
        xNumberField3.setPreferredSize(new java.awt.Dimension(80, 19));
        formPanel1.add(xNumberField3);

        xButton1.setMnemonic('c');
        xButton1.setText("Cancel");
        xButton1.setName("_close");

        xButton2.setMnemonic('a');
        xButton2.setText("Adjust Quantity");
        xButton2.setName("adjustQty");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(layout.createSequentialGroup()
                        .add(xButton2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 315, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(81, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 184, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(xButton2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(64, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.util.FormPanel formPanel2;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XButton xButton2;
    private com.rameses.rcp.control.XCheckBox xCheckBox1;
    private com.rameses.rcp.control.XNumberField xNumberField1;
    private com.rameses.rcp.control.XNumberField xNumberField3;
    private com.rameses.rcp.control.XNumberField xNumberField4;
    // End of variables declaration//GEN-END:variables
    
}