using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_update_leave : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    string lv_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        conn = new SqlConnection(webStr);
        conn.Open();
        lv_id = Request.QueryString["id"];

        showData();

    }
    protected void btn_lv_submit_Click(object sender, EventArgs e)
    {

        string update_leave =
            "UPDATE leave SET lv_status = @status where lv_id = " + lv_id;
        cmd = new SqlCommand(update_leave, conn);
        cmd.Parameters.AddWithValue("@status", lv_status.SelectedItem.Text);
        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect("leave.aspx");
        }
        else
        {
            Response.Write("<script language=javascript>alert('not update Leave');</script>");
        }
    }

    public void showData()
    {
        //select code
        String cSelect = "select * from leave where lv_id = " + lv_id;
        da = new SqlDataAdapter(cSelect, conn);
        ds = new DataSet();
        da.Fill(ds);


        if (ds.Tables[0].Rows.Count > 0)
        {
            tb_emp_id.Text = ds.Tables[0].Rows[0][1].ToString();
            tb_emp_name.Text = ds.Tables[0].Rows[0][2].ToString();
            tb_lv_type.Text = ds.Tables[0].Rows[0][3].ToString();
            tb_lv_apply_date.Text = ds.Tables[0].Rows[0][4].ToString();
            tb_lv_start_date.Text = ds.Tables[0].Rows[0][5].ToString();
            tb_lv_end_date.Text = ds.Tables[0].Rows[0][6].ToString();
            tb_lv_reason.Text = ds.Tables[0].Rows[0][7].ToString();
            lv_status.Text = ds.Tables[0].Rows[0][8].ToString();
        }
    }
}