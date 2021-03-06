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
@StyleSheet("etracs2/rpt/faas/BatchGRInitPage.style")
public class BatchGRInitPage extends javax.swing.JPanel {
    
    /** Creates new form FAASNewPage */
    public BatchGRInitPage() {
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
        xSeparator1 = new com.rameses.rcp.control.XSeparator();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xComboBox2 = new com.rameses.rcp.control.XComboBox();
        xComboBox3 = new com.rameses.rcp.control.XComboBox();
        jScrollPane1 = new javax.swing.JScrollPane();
        xTextArea1 = new com.rameses.rcp.control.XTextArea();
        xButton1 = new com.rameses.rcp.control.XButton();
        xButton2 = new com.rameses.rcp.control.XButton();
        xLabel1 = new com.rameses.rcp.control.XLabel();

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Batch General Revision Initial Information");
        formPanel1.setBorder(xTitledBorder1);
        xSeparator1.setPreferredSize(new java.awt.Dimension(0, 20));
        org.jdesktop.layout.GroupLayout xSeparator1Layout = new org.jdesktop.layout.GroupLayout(xSeparator1);
        xSeparator1.setLayout(xSeparator1Layout);
        xSeparator1Layout.setHorizontalGroup(
            xSeparator1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 564, Short.MAX_VALUE)
        );
        xSeparator1Layout.setVerticalGroup(
            xSeparator1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(0, 20, Short.MAX_VALUE)
        );
        formPanel1.add(xSeparator1);

        xComboBox1.setCaption("New General Revision");
        xComboBox1.setCaptionWidth(140);
        xComboBox1.setDepends(new String[] {"prevtd"});
        xComboBox1.setDynamic(true);
        xComboBox1.setItems("rylist");
        xComboBox1.setName("newry");
        xComboBox1.setPreferredSize(new java.awt.Dimension(120, 22));
        xComboBox1.setRequired(true);
        formPanel1.add(xComboBox1);

        xComboBox2.setCaption("LGU");
        xComboBox2.setCaptionWidth(140);
        xComboBox2.setExpression("#{lguname}");
        xComboBox2.setImmediate(true);
        xComboBox2.setItems("lguList");
        xComboBox2.setName("lgu");
        xComboBox2.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox2.setRequired(true);
        formPanel1.add(xComboBox2);

        xComboBox3.setCaption("Barangay");
        xComboBox3.setCaptionWidth(140);
        xComboBox3.setDepends(new String[] {"lgu"});
        xComboBox3.setDynamic(true);
        xComboBox3.setExpression("#{lguname}");
        xComboBox3.setItems("barangayList");
        xComboBox3.setName("barangay");
        xComboBox3.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox3.setRequired(true);
        formPanel1.add(xComboBox3);

        jScrollPane1.setPreferredSize(new java.awt.Dimension(0, 76));
        xTextArea1.setColumns(20);
        xTextArea1.setLineWrap(true);
        xTextArea1.setRows(5);
        xTextArea1.setWrapStyleWord(true);
        xTextArea1.setCaption("Default Memoranda");
        xTextArea1.setCaptionWidth(140);
        xTextArea1.setName("memoranda");
        xTextArea1.setPreferredSize(new java.awt.Dimension(0, 100));
        xTextArea1.setTextCase(com.rameses.rcp.constant.TextCase.UPPER);
        jScrollPane1.setViewportView(xTextArea1);

        formPanel1.add(jScrollPane1);

        xButton1.setMnemonic('r');
        xButton1.setText("Revise");
        xButton1.setDefaultCommand(true);
        xButton1.setName("revise");

        xButton2.setMnemonic('c');
        xButton2.setText("Cancel");
        xButton2.setImmediate(true);
        xButton2.setName("doCancel");

        xLabel1.setForeground(new java.awt.Color(153, 0, 0));
        xLabel1.setFont(new java.awt.Font("Tahoma", 1, 14));
        xLabel1.setName("msg");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING, false)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                        .add(xLabel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(xButton2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 578, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(82, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 234, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(xButton2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(xButton1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(xLabel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(43, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private com.rameses.rcp.control.XButton xButton1;
    private com.rameses.rcp.control.XButton xButton2;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XComboBox xComboBox2;
    private com.rameses.rcp.control.XComboBox xComboBox3;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XSeparator xSeparator1;
    private com.rameses.rcp.control.XTextArea xTextArea1;
    // End of variables declaration//GEN-END:variables
    
}
