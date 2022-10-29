using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class employee_index : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;
    string emp_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        emp_id = Session["emp_id"].ToString();

        String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        conn = new SqlConnection(webStr);
        conn.Open();

        getEmp();
        getLeaveCount();
        getLoanRqCount();
        getLoanApprovCount();

    }

    public void getEmp()
    {
        string sel = "select * from emp_info where emp_id = " + emp_id;
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_emp_id.Text = ds.Tables[0].Rows[0][0].ToString();
            lbl_emp_name.Text = ds.Tables[0].Rows[0][1].ToString();
            lbl_emp_email.Text = ds.Tables[0].Rows[0][3].ToString();
            lbl_dp.Text = ds.Tables[0].Rows[0][9].ToString();
            lbl_dv.Text = ds.Tables[0].Rows[0][10].ToString();
        }
       
    }



    public void getLeaveCount()
    {
        string sel = "select * from leave where emp_id = " + emp_id;
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_leave.Text = ds.Tables[0].Rows.Count.ToString();
        }
        else
        {
            lbl_leave.Text = "0";
        }
    }

    public void getLoanRqCount()
    {
        string sel = "select * from loan where NOT ln_status = 'Apporve' AND emp_id = " + emp_id;
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_loan_rq.Text = ds.Tables[0].Rows.Count.ToString();
        }
        else
        {
            lbl_loan_rq.Text = "0";
        }
    }

    public void getLoanApprovCount()
    {
        string sel = "select * from loan where ln_status = 'Apporve' AND emp_id = " + emp_id;
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_loan_approved.Text = ds.Tables[0].Rows.Count.ToString();
        }
        else
        {
            lbl_loan_approved.Text = "0";
        }
    }

}