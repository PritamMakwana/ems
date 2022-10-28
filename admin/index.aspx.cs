using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_index : System.Web.UI.Page
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

        getEmpCount();
        getDpCount();
        getLeaveCount();
        getLoanRqCount();
        getLoanApprovCount();
    }

    public void getEmpCount()
    {
        string sel = "select * from emp_info";
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
           lbl_emp_count.Text = ds.Tables[0].Rows.Count.ToString();
        }
        else
        {
            lbl_emp_count.Text = "0";
        }
    }

    public void getDpCount()
    {
        string sel = "select * from department";
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_dp_count.Text = ds.Tables[0].Rows.Count.ToString();
        }
        else
        {
            lbl_dp_count.Text = "0";
        }
    }


    public void getLeaveCount()
    {
        string sel = "select * from leave where lv_status = 'PENDING' ";
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_leave_rq.Text = ds.Tables[0].Rows.Count.ToString();
        }
        else
        {
            lbl_leave_rq.Text = "0";
        }
    }

    public void getLoanRqCount()
    {
        string sel = "select * from loan where ln_status = 'PENDING' ";
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
        string sel = "select * from loan where ln_status = 'Apporve' ";
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