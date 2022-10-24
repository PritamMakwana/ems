using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class employee_leave : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        conn = new SqlConnection(webStr);
        conn.Open();
        getLeaveShort();
    }

    public void getLeaveShort()
    {
        string sel = "select * from leave where emp_id = " + Session["emp_id"] ;
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            rpt_leave_show.DataSource = ds;
            rpt_leave_show.DataBind();      
        }
    }

    protected void rpt_leave_show_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string select_lv_id = (e.Item.FindControl("lv_id") as HiddenField).Value;
            Repeater RptLeaveFull = e.Item.FindControl("rpt_leave_full_show") as Repeater;

            string sel = "select * from leave where lv_id = " + select_lv_id;
            da = new SqlDataAdapter(sel, conn);
            ds = new DataSet();
            da.Fill(ds);

            RptLeaveFull.DataSource = ds;
            RptLeaveFull.DataBind();
        }
    }
    protected void rpt_leave_show_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            SqlCommand SqlCmd = new SqlCommand("delete leave where lv_id=@ID", conn);
            SqlCmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = e.CommandArgument;

            try
            {
                SqlCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            getLeaveShort();
        }
    }
}