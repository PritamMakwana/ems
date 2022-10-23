using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da,dae;
    DataSet ds,dse;
    protected void Page_Load(object sender, EventArgs e)
    {
        String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        conn = new SqlConnection(webStr);
        conn.Open();

        if (Session["admin_id"] != null)
        {
            Response.Redirect("admin/index.aspx");
        }
        if (Session["emp_id"] != null)
        {
            Response.Redirect("employee/index.aspx");
        }

    }
    protected void log_in_Click(object sender, EventArgs e)
    {
        String mSelect = "select * from admin_login where a_l_email = '" + l_email.Text + "' AND a_l_pwd = '" + l_pwd.Text + "' ";
        da = new SqlDataAdapter(mSelect, conn);
        ds = new DataSet();
        da.Fill(ds);

        String mSelecte = "select * from emp_info where emp_email = '" + l_email.Text + "' AND emp_pwd = '" + l_pwd.Text + "' ";
        dae = new SqlDataAdapter(mSelecte, conn);
        dse = new DataSet();
        dae.Fill(dse);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["admin_id"] = ds.Tables[0].Rows[0][0].ToString();
             Response.Redirect("admin/index.aspx");           
        }
        else if (dse.Tables[0].Rows.Count > 0)
        {
            Session["emp_id"] = dse.Tables[0].Rows[0][0].ToString();
            Session["emp_name"] = dse.Tables[0].Rows[0][1].ToString();
            Response.Redirect("employee/index.aspx");
        }
        else
        {
            this.err_msg.InnerHtml = "<div class='alert alert-danger alert-dismissible' role='alert'> Invalid Email or Password <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>";    
        }
    }
}