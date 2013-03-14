/*
 * ProvinceTaxpayerInfoPage.java
 *
 * Created on January 14, 2011, 10:08 AM
 */

package etracs2.prov;

/**
 *
 * @author  jzamss
 */
public class ProvinceTaxpayerPage extends javax.swing.JPanel {
    
    /** Creates new form ProvinceTaxpayerInfoPage */
    public ProvinceTaxpayerPage() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jPanel2 = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        formPanel1 = new com.rameses.rcp.util.FormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        jPanel3 = new javax.swing.JPanel();
        xTable1 = new com.rameses.rcp.control.XTable();
        xActionTextField1 = new com.rameses.rcp.control.XActionTextField();
        jLabel1 = new javax.swing.JLabel();
        xActionBar2 = new com.rameses.rcp.control.XActionBar();

        setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder1 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder1.setTitle("Document");
        setBorder(xTitledBorder1);
        jPanel2.setLayout(new java.awt.BorderLayout());

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder2 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder2.setTitle("General Information");
        formPanel1.setBorder(xTitledBorder2);
        formPanel1.setPreferredSize(new java.awt.Dimension(300, 125));
        xLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153)));
        xLabel1.setCaption("Taxpayer No.");
        xLabel1.setCaptionWidth(95);
        xLabel1.setFont(new java.awt.Font("Arial", 1, 11));
        xLabel1.setName("taxpayer.taxpayerNo");
        xLabel1.setPreferredSize(new java.awt.Dimension(150, 19));
        formPanel1.add(xLabel1);

        xTextField1.setCaption("Name ");
        xTextField1.setCaptionWidth(95);
        xTextField1.setName("taxpayer.name");
        xTextField1.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField1.setRequired(true);
        formPanel1.add(xTextField1);

        xTextField2.setCaption("Address");
        xTextField2.setCaptionWidth(95);
        xTextField2.setName("taxpayer.address");
        xTextField2.setPreferredSize(new java.awt.Dimension(0, 19));
        xTextField2.setRequired(true);
        formPanel1.add(xTextField2);

        xTextField3.setCaption("Mailing Address");
        xTextField3.setCaptionWidth(95);
        xTextField3.setName("taxpayer.mailAddress");
        xTextField3.setPreferredSize(new java.awt.Dimension(0, 19));
        formPanel1.add(xTextField3);

        com.rameses.rcp.control.border.XTitledBorder xTitledBorder3 = new com.rameses.rcp.control.border.XTitledBorder();
        xTitledBorder3.setTitle("Municipal Taxpayer Mapping");
        jPanel3.setBorder(xTitledBorder3);
        xTable1.setHandler("listHandler");

        xActionTextField1.setActionName("lookupTaxpayer");
        xActionTextField1.setCaption("Municipal Taxpayer Mapping");
        xActionTextField1.setCaptionWidth(120);
        xActionTextField1.setName("textSearch");

        jLabel1.setText("Search Taxpayer :");

        org.jdesktop.layout.GroupLayout jPanel3Layout = new org.jdesktop.layout.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(xTable1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 454, Short.MAX_VALUE)
                    .add(jPanel3Layout.createSequentialGroup()
                        .add(jLabel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 95, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(xActionTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 267, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel3Layout.createSequentialGroup()
                .add(5, 5, 5)
                .add(jPanel3Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel1)
                    .add(xActionTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(xTable1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 274, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(47, Short.MAX_VALUE))
        );

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, formPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(20, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(formPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(5, 5, 5)
                .add(jPanel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel2.add(jPanel1, java.awt.BorderLayout.WEST);

        add(jPanel2, java.awt.BorderLayout.CENTER);

        xActionBar2.setBorder(javax.swing.BorderFactory.createEmptyBorder(1, 10, 5, 1));
        xActionBar2.setButtonBorderPainted(false);
        xActionBar2.setButtonContentAreaFilled(false);
        xActionBar2.setDepends(new String[] {"selectedItem"});
        xActionBar2.setName("formActions");
        xActionBar2.setPreferredSize(new java.awt.Dimension(89, 40));
        add(xActionBar2, java.awt.BorderLayout.NORTH);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.util.FormPanel formPanel1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private com.rameses.rcp.control.XActionBar xActionBar2;
    private com.rameses.rcp.control.XActionTextField xActionTextField1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XTable xTable1;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    // End of variables declaration//GEN-END:variables
    
}
