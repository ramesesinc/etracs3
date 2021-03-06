/*
 * AccountPage.java
 *
 * Created on February 27, 2011, 12:48 PM
 */

package etracs2.tc.master.ui;

import com.rameses.client.ui.template.DefaultFormPage;
import com.rameses.rcp.ui.annotations.StyleSheet;
import com.rameses.rcp.ui.annotations.Template;

/**
 *
 * @author  jzamss
 */
@StyleSheet
@Template(DefaultFormPage.class)
public class CollectionGroupPage extends javax.swing.JPanel {
    
    /** Creates new form AccountPage */
    public CollectionGroupPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel5 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xDataTable2 = new com.rameses.rcp.control.XDataTable();
        xLookupField1 = new com.rameses.rcp.control.XLookupField();

        setPreferredSize(new java.awt.Dimension(542, 498));
        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Collection Group");
        jPanel5.setBorder(xTitledBorder1);

        formPanel1.setCaptionWidth(60);
        formPanel1.setPadding(new java.awt.Insets(5, 0, 5, 0));
        xTextField1.setCaption("Name");
        xTextField1.setHint("Collection Group Name");
        xTextField1.setName("entity.name");
        xTextField1.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField1.setRequired(true);
        formPanel1.add(xTextField1);

        xLabel1.setText("<html><b>Income Accounts</b></html>");

        xDataTable2.setHandler("incomeAcctHandler");
        xDataTable2.setImmediate(true);
        xDataTable2.setName("selectedIncomeAcct");

        xLookupField1.setHandler("incomeAccountLookup");
        xLookupField1.setHint("Add Income Account");
        xLookupField1.setName("incomeAccount");
        xLookupField1.setPreferredSize(new java.awt.Dimension(97, 20));
        xLookupField1.setTranserFocusOnSelect(false);

        org.jdesktop.layout.GroupLayout jPanel5Layout = new org.jdesktop.layout.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, xDataTable2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 418, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, xLabel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 418, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 418, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, xLookupField1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 418, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel5Layout.createSequentialGroup()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xLabel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xLookupField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xDataTable2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 265, Short.MAX_VALUE)
                .addContainerGap())
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel5, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(137, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel5, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(78, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JPanel jPanel5;
    private com.rameses.rcp.control.XDataTable xDataTable2;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLookupField xLookupField1;
    private com.rameses.rcp.control.XTextField xTextField1;
    // End of variables declaration//GEN-END:variables
    
}
