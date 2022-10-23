using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_profile : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        conn = new SqlConnection(webStr);
        conn.Open();
        if (ViewState["i"] == null)
        {
            showData();
            ViewState["i"] = 1;
        }
    }
    protected void btn_ad_submit_Click(object sender, EventArgs e)
    {
        string update_admin = "UPDATE admin_login SET a_l_name = @ad_name, a_l_mobile = @ad_mobile , a_l_email = @ad_email, a_l_pwd = @ad_pwd where a_l_id = " + Session["admin_id"];

        cmd = new SqlCommand(update_admin, conn);
        cmd.Parameters.AddWithValue("@ad_name", tb_ad_name.Text);
        cmd.Parameters.AddWithValue("@ad_mobile", tb_ad_mobile.Text);
        cmd.Parameters.AddWithValue("@ad_email", tb_ad_email.Text);
        cmd.Parameters.AddWithValue("@ad_pwd", tb_ad_pwd.Text);

        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            Response.Write("<script language=javascript>alert('not update admin');</script>");
        }
    }

    public void showData()
    {
        //select code
        String cSelect = "select * from admin_login where a_l_id = " + Session["admin_id"];
        da = new SqlDataAdapter(cSelect, conn);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            tb_ad_name.Text = ds.Tables[0].Rows[0][1].ToString();
            tb_ad_mobile.Text = ds.Tables[0].Rows[0][2].ToString();
            tb_ad_email.Text = ds.Tables[0].Rows[0][3].ToString();
            tb_ad_pwd.Text = ds.Tables[0].Rows[0][4].ToString();
        }

    }
}