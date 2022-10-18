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

}