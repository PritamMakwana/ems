using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_admin_sidebar : System.Web.UI.MasterPage
{
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;
  
    protected void Page_Load(object sender, EventArgs e)
    {
        String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        conn = new SqlConnection(webStr);
        conn.Open();

        if (Session["admin_id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        String cSelect = "select * from admin_login where a_l_id = " + Session["admin_id"];
        da = new SqlDataAdapter(cSelect, conn);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_admin_name.Text = ds.Tables[0].Rows[0][1].ToString();
        }

    }
}
