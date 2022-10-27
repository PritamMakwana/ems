using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class employee_add_rq_loan : System.Web.UI.Page
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
       
    }
    protected void btn_ln_rq_submit_Click(object sender, EventArgs e)
    {
        DateTime dateTime = DateTime.UtcNow.Date;

        String SInsert = "INSERT INTO loan VALUES(@emp_id,@emp_name,@ln_apply_date,@ln_amount,@ln_reason,@ln_repay_date,@ln_status)";
        cmd = new SqlCommand(SInsert, conn);
        cmd.Parameters.AddWithValue("@emp_id", Session["emp_id"]);
        cmd.Parameters.AddWithValue("@emp_name", Session["emp_name"]);
        cmd.Parameters.AddWithValue("@ln_apply_date", dateTime.ToString("dd/MM/yyyy"));
        cmd.Parameters.AddWithValue("@ln_amount", tb_ln_amount.Text);
        cmd.Parameters.AddWithValue("@ln_repay_date", tb_ln_repayment_date.Text);
        cmd.Parameters.AddWithValue("@ln_reason", tb_ln_reason.Text);
        cmd.Parameters.AddWithValue("@ln_status", "PENDING");

        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect("loan.aspx");
        }
        else
        {
            Response.Write("<script language=javascript>alert('not add loan Request');</script>");
        }
    }
}