using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_leave : System.Web.UI.Page
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
        getLeaveShort();
    }
    public void getLeaveShort()
    {
        string sel = "select * from leave";
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
}