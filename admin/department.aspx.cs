using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_department : System.Web.UI.Page
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
            get_dp();
    }
    protected void btn_add_dp_Click(object sender, EventArgs e)
    {

        String SInsert = "INSERT INTO department VALUES(@dp_name,@dp_divi)";
        cmd = new SqlCommand(SInsert, conn);
        cmd.Parameters.AddWithValue("@dp_name", dp_name.Text);
        cmd.Parameters.AddWithValue("@dp_divi", 0);

        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
           Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            Response.Write("<script language=javascript>alert('not add department');</script>");
        }

    }

    public void get_dp()
    {
        string sel = "select * from department";
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds);
        rp_dp_list.DataSource = ds;
        rp_dp_list.DataBind();
    }


    protected void rp_dp_list_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        string sel = "select * from department where dp_id = " + e.CommandArgument;
        da = new SqlDataAdapter(sel, conn);
        ds = new DataSet();
        da.Fill(ds); 
           string dp_name = ds.Tables[0].Rows[0][1].ToString();
         
           if (e.CommandName == "delete")
           {
               SqlCommand SqlCmd = new SqlCommand("delete department where dp_id=@ID", conn);
               SqlCmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = e.CommandArgument;

               SqlCommand SqlCmd_dv = new SqlCommand("delete division where dp_id=@ID", conn);
               SqlCmd_dv.Parameters.Add("@ID", SqlDbType.VarChar).Value = e.CommandArgument;

               SqlCommand SqlCmd_dp_emp_delete = new SqlCommand("delete emp_info where emp_department = '" + dp_name + "'", conn);

               try
               {
                   SqlCmd.ExecuteNonQuery();
                   SqlCmd_dv.ExecuteNonQuery();
                   SqlCmd_dp_emp_delete.ExecuteNonQuery();
               }
               catch (Exception ex)
               {
                   ex.Message.ToString();
               }
               get_dp();
           }
    }
}