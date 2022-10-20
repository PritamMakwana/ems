using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_division : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd, cmdup;
    protected void Page_Load(object sender, EventArgs e)
    {
        String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        conn = new SqlConnection(webStr);
        conn.Open();
        if (!IsPostBack)
        {
            getDepartment();
            getDepartmentTable();
        }
    }

    public void getDepartment()
    {
        String cSelect = "select * from department";
        da = new SqlDataAdapter(cSelect, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);

        select_dp.DataSource = ds;
        select_dp.DataTextField = "dp_name";
        select_dp.DataValueField = "dp_id";
        select_dp.DataBind();
    }

    public void getDepartmentTable()
    {
        string sel = "select * from department";
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        rpt_dp.DataSource = ds;
        rpt_dp.DataBind();
    }


    protected void btn_add_dv_Click(object sender, EventArgs e)
    {
        String SInsert = "INSERT INTO division VALUES(@dv,@dpid)";
        int dpid = Convert.ToInt16(select_dp.SelectedValue);
        cmd = new SqlCommand(SInsert, conn);
        cmd.Parameters.AddWithValue("@dv", tb_dv_name.Text);
        cmd.Parameters.AddWithValue("@dpid", dpid);

        String up_dp = "UPDATE department SET dp_division = dp_division + 1 WHERE dp_id ='" + dpid + "'";
        cmdup = new SqlCommand(up_dp, conn);
        cmdup.ExecuteNonQuery();

        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            Response.Write("<script language=javascript>alert('not add Division');</script>");
        } 
    }

    protected void rpt_dp_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string select_dp_Id = (e.Item.FindControl("hf_dp_id") as HiddenField).Value;
            Repeater rptDivision = e.Item.FindControl("rpt_dv") as Repeater;

            string sel = "select * from division where dp_id = " + select_dp_Id;
            da = new SqlDataAdapter(sel, conn);
            ds = new DataSet();
            da.Fill(ds);

            rptDivision.DataSource = ds;
            rptDivision.DataBind();
        }
    }
    protected void rpt_dv_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            SqlCommand SqlCmd_dv_d = new SqlCommand("delete division where dv_id=@ID", conn);
            SqlCmd_dv_d.Parameters.Add("@ID", SqlDbType.VarChar).Value = e.CommandArgument;

            string sel = "select * from division where dv_id=" + e.CommandArgument.ToString() ;
            da = new SqlDataAdapter(sel, conn);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string dp_id = ds.Tables[0].Rows[0][2].ToString();

                SqlCommand SqlCmd_dp_min = new SqlCommand("UPDATE department SET dp_division = dp_division - 1 WHERE dp_id =" + dp_id, conn);
                SqlCmd_dp_min.Parameters.Add("@ID", SqlDbType.VarChar).Value = e.CommandArgument;
                SqlCmd_dp_min.ExecuteNonQuery();
            }
          

            try
            {
                SqlCmd_dv_d.ExecuteNonQuery();
                
              
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }

            getDepartment();
            getDepartmentTable();
            
        }

     
    }
}