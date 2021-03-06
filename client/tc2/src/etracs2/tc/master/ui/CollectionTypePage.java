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
public class CollectionTypePage extends javax.swing.JPanel {
    
    /** Creates new form AccountPage */
    public CollectionTypePage() {
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
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xComboBox2 = new com.rameses.rcp.control.XComboBox();
        xComboBox1 = new com.rameses.rcp.control.XComboBox();
        xSeparator1 = new com.rameses.rcp.control.XSeparator();
        xCheckBox1 = new com.rameses.rcp.control.XCheckBox();

        setPreferredSize(new java.awt.Dimension(542, 498));

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Collection Type Information");
        formPanel1.setBorder(xTitledBorder1);
        xTextField2.setCaption("Collection Type");
        xTextField2.setCaptionWidth(100);
        xTextField2.setDepends(new String[] {"selectedItem"});
        xTextField2.setName("entity.name");
        xTextField2.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField2.setRequired(true);
        formPanel1.add(xTextField2);

        xComboBox2.setCaption("AF No.");
        xComboBox2.setCaptionWidth(100);
        xComboBox2.setDepends(new String[] {"selectedItem"});
        xComboBox2.setEmptyText("");
        xComboBox2.setImmediate(true);
        xComboBox2.setItems("aflist");
        xComboBox2.setName("entity.afid");
        xComboBox2.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox2.setRequired(true);
        formPanel1.add(xComboBox2);

        xComboBox1.setCaption("App Code");
        xComboBox1.setCaptionWidth(100);
        xComboBox1.setDepends(new String[] {"selectedItem", "entity.afid"});
        xComboBox1.setDynamic(true);
        xComboBox1.setImmediate(true);
        xComboBox1.setItems("appcodelist");
        xComboBox1.setName("entity.appcode");
        xComboBox1.setPreferredSize(new java.awt.Dimension(0, 22));
        xComboBox1.setRequired(true);
        formPanel1.add(xComboBox1);

        xSeparator1.setPreferredSize(new java.awt.Dimension(0, 20));
        formPanel1.add(xSeparator1);

        xCheckBox1.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
        xCheckBox1.setCaption("Payor Required");
        xCheckBox1.setCaptionWidth(100);
        xCheckBox1.setDepends(new String[] {"selectedItem"});
        xCheckBox1.setMargin(new java.awt.Insets(0, 0, 0, 0));
        xCheckBox1.setName("entity.payorrequired");
        xCheckBox1.setPreferredSize(new java.awt.Dimension(0, 15));
        formPanel1.add(xCheckBox1);

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 417, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(162, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 158, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(303, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private com.rameses.rcp.control.XCheckBox xCheckBox1;
    private com.rameses.rcp.control.XComboBox xComboBox1;
    private com.rameses.rcp.control.XComboBox xComboBox2;
    private com.rameses.rcp.control.XSeparator xSeparator1;
    private com.rameses.rcp.control.XTextField xTextField2;
    // End of variables declaration//GEN-END:variables
    
}
