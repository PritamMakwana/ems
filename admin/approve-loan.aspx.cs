using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_approve_loan : System.Web.UI.Page
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
        getAPPLoanShort();
    }
    public void getAPPLoanShort()
    {
        string sel = "select * from loan where ln_status = 'Apporve' ";
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            rpt_loan_show.DataSource = ds;
            rpt_loan_show.DataBind();
            lbl_title.Text = "";
        }
        else
        {
            lbl_title.Text = "Loan not approved";
        }
    }

    protected void rpt_loan_show_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string select_ln_id = (e.Item.FindControl("ln_id") as HiddenField).Value;
            Repeater RptLoanFull = e.Item.FindControl("rpt_loan_full_show") as Repeater;

            string sel = "select * from loan where ln_id = " + select_ln_id;
            da = new SqlDataAdapter(sel, conn);
            ds = new DataSet();
            da.Fill(ds);

            RptLoanFull.DataSource = ds;
            RptLoanFull.DataBind();
        }
    }
    protected void rpt_loan_show_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            SqlCommand SqlCmd = new SqlCommand("delete loan where ln_id=@ID", conn);
            SqlCmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = e.CommandArgument;

            try
            {
                SqlCmd.ExecuteNonQuery();
                Response.Redirect("approve-loan.aspx");
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }
    }
}