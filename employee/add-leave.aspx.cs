using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class employee_add_leave : System.Web.UI.Page
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
    protected void btn_lv_submit_Click(object sender, EventArgs e)
    {
        DateTime dateTime = DateTime.UtcNow.Date;

        String SInsert = "INSERT INTO leave VALUES(@emp_id,@emp_name,@lv_category,@lv_apply_date,@lv_start_date,@lv_end_date,@lv_reason,@lv_status)";
        cmd = new SqlCommand(SInsert, conn);
        cmd.Parameters.AddWithValue("@emp_id", Session["emp_id"]);
        cmd.Parameters.AddWithValue("@emp_name", Session["emp_name"]);
        cmd.Parameters.AddWithValue("@lv_category", tb_lv_type.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@lv_apply_date", dateTime.ToString("dd/MM/yyyy"));
        cmd.Parameters.AddWithValue("@lv_start_date", tb_lv_start_date.Text);
        cmd.Parameters.AddWithValue("@lv_end_date", tb_lv_end_date.Text);
        cmd.Parameters.AddWithValue("@lv_reason", tb_lv_reason.Text);
        cmd.Parameters.AddWithValue("@lv_status", "PENDING");

        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect("leave.aspx");
        }
        else
        {
            Response.Write("<script language=javascript>alert('not add leave');</script>");
        }

    }
}