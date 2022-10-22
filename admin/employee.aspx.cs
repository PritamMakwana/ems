using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_employee : System.Web.UI.Page
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

        string sel;
       if (Request.QueryString["dp"] != null)
       {
           sel = "select * from emp_info where emp_department = '"+ Request.QueryString["dp"] +"'";
           getEmpShort(sel);
           lbl_title.Text = "Department : " + Request.QueryString["dp"];
       }
       else if (Request.QueryString["dv"] != null)
       {
           sel = "select * from emp_info where emp_division = '" + Request.QueryString["dv"] + "'";
           getEmpShort(sel);
           lbl_title.Text = "Division : " + Request.QueryString["dv"];
       }
       else
       {
           sel = "select * from emp_info";
           lbl_title.Text = "";
           getEmpShort(sel);
       }
       
    }

    public void getEmpShort(string sel)
    {
        
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        rpt_emp_show.DataSource = ds;
        rpt_emp_show.DataBind();
    }

    protected void rpt_emp_full_show_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
      
    }
    protected void rpt_emp_show_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string select_emp_Id = (e.Item.FindControl("emp_id") as HiddenField).Value;
            Repeater RptEmpFull = e.Item.FindControl("rpt_emp_full_show") as Repeater;

            string sel = "select * from emp_info where emp_id = " + select_emp_Id;
            da = new SqlDataAdapter(sel, conn);
            ds = new DataSet();
            da.Fill(ds);

            RptEmpFull.DataSource = ds;
            RptEmpFull.DataBind();
        }
    }
}