using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_update_rq_loan : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    string ln_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        conn = new SqlConnection(webStr);
        conn.Open();
        ln_id = Request.QueryString["id"];

        if (ViewState["i"] == null)
        {
            showData();
            ViewState["i"] = 1;
        }
    }
    protected void btn_ln_submit_Click(object sender, EventArgs e)
    {
        string update_leave =
         "UPDATE loan SET ln_status = @status where ln_id = " + ln_id;
        cmd = new SqlCommand(update_leave, conn);
        cmd.Parameters.AddWithValue("@status", ln_status.SelectedItem.Text);
        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect("loan.aspx");
        }
        else
        {
            Response.Write("<script language=javascript>alert('not update Loan Request');</script>");
        }
    }

    public void showData()
    {
        //select code
        String cSelect = "select * from loan where ln_id = " + ln_id;
        da = new SqlDataAdapter(cSelect, conn);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            tb_emp_id.Text = ds.Tables[0].Rows[0][1].ToString();
            tb_emp_name.Text = ds.Tables[0].Rows[0][2].ToString();
            tb_ln_apply_date.Text = ds.Tables[0].Rows[0][3].ToString();
            tb_ln_amount.Text = ds.Tables[0].Rows[0][4].ToString();
            tb_ln_reason.Text = ds.Tables[0].Rows[0][5].ToString();
            tb_ln_repayment_date.Text = ds.Tables[0].Rows[0][6].ToString();
            ln_status.Text = ds.Tables[0].Rows[0][7].ToString();
        }
    }
}