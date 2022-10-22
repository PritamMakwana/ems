using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
 

public partial class admin_update_employee : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    string emp_id;
   
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
        String webStr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        conn = new SqlConnection(webStr);
        conn.Open();
        emp_id = Request.QueryString["id"];
        if (!IsPostBack)
        {
            getDepartment();
            string select_dp_id = tb_emp_dp.SelectedValue.ToString();
            getDivision(select_dp_id);
        }
        btn_emp_submit.Enabled = false;

        if (ViewState["i"] == null)
        {
            showData();
            ViewState["i"] = 1;
        }

    }


    public void getDepartment()
    {
        String cSelect = "select * from department";
        da = new SqlDataAdapter(cSelect, conn);
        ds = new DataSet();
        da.Fill(ds);

        tb_emp_dp.DataSource = ds;
        tb_emp_dp.DataTextField = "dp_name";
        tb_emp_dp.DataValueField = "dp_id";
        tb_emp_dp.DataBind();

    }
    public void getDivision(string dpId)
    {
        String cSelect = "select * from division where dp_id = " + dpId;
        da = new SqlDataAdapter(cSelect, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);

        tb_emp_dv.DataSource = ds;
        tb_emp_dv.DataTextField = "dv_name";
        tb_emp_dv.DataValueField = "dv_id";
        tb_emp_dv.DataBind();

    }

    protected void btn_emp_submit_Click(object sender, EventArgs e)
    {
        //gender
        string gender = "";
        if (rb_emp_male.Checked)
        {
            gender = rb_emp_male.Text;
        }
        else
        {
            gender = rb_emp_female.Text;
        }

        string update_emp =
            "UPDATE emp_info SET emp_name = @emp_name, emp_mobile = @emp_mobile , emp_email = @emp_email, emp_pwd = @emp_pwd, emp_address = @emp_address,emp_dob = @emp_dob,emp_gender = @emp_gender, emp_join_date = @emp_join_date, emp_department = @emp_department, emp_division = @emp_division, emp_type = @emp_type, emp_basic_sal = @emp_basic_sal, emp_house_aw = @emp_house_aw, emp_madical_aw = @emp_madical_aw ,emp_special_aw = @emp_special_aw, emp_fuel_aw = @emp_fuel_aw,emp_phone_bill_aw = @emp_phone_bill_aw, emp_other_aw = @emp_other_aw, emp_pf = @emp_pf, emp_tax_dd = @emp_tax_dd, emp_other_dd = @emp_other_dd, emp_gross_sal = @emp_gross_sal, emp_total_dd = @emp_total_dd, emp_net_sal = @emp_net_sal where emp_id = " + emp_id;

        cmd = new SqlCommand(update_emp, conn);
        cmd.Parameters.AddWithValue("@emp_name", tb_emp_name.Text);
        cmd.Parameters.AddWithValue("@emp_mobile", tb_emp_mobile.Text);
        cmd.Parameters.AddWithValue("@emp_email", tb_emp_email.Text);
        cmd.Parameters.AddWithValue("@emp_pwd", tb_emp_pwd.Text);
        cmd.Parameters.AddWithValue("@emp_address", tb_emp_address.Text);
        cmd.Parameters.AddWithValue("@emp_dob", tb_emp_dob.Text);
        cmd.Parameters.AddWithValue("@emp_gender", gender);

        cmd.Parameters.AddWithValue("@emp_join_date", tb_emp_join_date.Text);
        cmd.Parameters.AddWithValue("@emp_department", tb_emp_dp.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@emp_division", tb_emp_dv.SelectedItem.Text);

        cmd.Parameters.AddWithValue("@emp_type", tb_emp_type.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@emp_basic_sal", tb_emp_basic_sal.Text);

        cmd.Parameters.AddWithValue("@emp_house_aw", tb_emp_house_aw.Text);
        cmd.Parameters.AddWithValue("@emp_madical_aw", tb_emp_madical_aw.Text);
        cmd.Parameters.AddWithValue("@emp_special_aw", tb_emp_special_aw.Text);
        cmd.Parameters.AddWithValue("@emp_fuel_aw", tb_emp_fuel_aw.Text);
        cmd.Parameters.AddWithValue("@emp_phone_bill_aw", tb_emp_phone_bill_aw.Text);
        cmd.Parameters.AddWithValue("@emp_other_aw", tb_other_aw.Text);

        cmd.Parameters.AddWithValue("@emp_pf", tb_emp_tax_pf.Text);
        cmd.Parameters.AddWithValue("@emp_tax_dd", tb_emp_tax_dd.Text);
        cmd.Parameters.AddWithValue("@emp_other_dd", tb_emp_other_tax_dd.Text);

        cmd.Parameters.AddWithValue("@emp_gross_sal", tb_emp_gross_sal.Text);
        cmd.Parameters.AddWithValue("@emp_total_dd", tb_emp_total_dd.Text);
        cmd.Parameters.AddWithValue("@emp_net_sal", tb_emp_net_sal.Text);

        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect("employee.aspx");
        }
        else
        {
            Response.Write("<script language=javascript>alert('not update employee');</script>");
        }

    }
    protected void btn_cal_Click(object sender, EventArgs e)
    {
        tb_emp_gross_sal.Text = (Convert.ToInt32(tb_emp_basic_sal.Text) +
                  Convert.ToInt32(tb_emp_house_aw.Text) +
                  Convert.ToInt32(tb_emp_madical_aw.Text) +
                  Convert.ToInt32(tb_emp_special_aw.Text) +
                  Convert.ToInt32(tb_emp_fuel_aw.Text) +
                  Convert.ToInt32(tb_emp_phone_bill_aw.Text) +
                  Convert.ToInt32(tb_other_aw.Text)).ToString();

        tb_emp_total_dd.Text = (Convert.ToInt16(tb_emp_tax_pf.Text) + Convert.ToInt16(tb_emp_tax_dd.Text) + Convert.ToInt16(tb_emp_other_tax_dd.Text)).ToString();


        tb_emp_net_sal.Text = (Convert.ToInt32(tb_emp_gross_sal.Text)
                             - Convert.ToInt32(tb_emp_total_dd.Text)).ToString();

        btn_emp_submit.Enabled = true;
    }
    protected void tb_emp_dp_SelectedIndexChanged(object sender, EventArgs e)
    {
        string select_dp_id = tb_emp_dp.SelectedValue.ToString();
        getDivision(select_dp_id);
    }

    public void showData()
    {
        //select code
        String cSelect = "select * from emp_info where emp_id = " + emp_id;
        da = new SqlDataAdapter(cSelect, conn);
        ds = new DataSet();
        da.Fill(ds);


        if (ds.Tables[0].Rows.Count > 0)
        {
            tb_emp_name.Text = ds.Tables[0].Rows[0][1].ToString();
            tb_emp_mobile.Text = ds.Tables[0].Rows[0][2].ToString();
            tb_emp_email.Text = ds.Tables[0].Rows[0][3].ToString();
            tb_emp_pwd.Text = ds.Tables[0].Rows[0][4].ToString();
            tb_emp_address.Text = ds.Tables[0].Rows[0][5].ToString();
            tb_emp_dob.Text = ds.Tables[0].Rows[0][6].ToString();

            //gender
            if (rb_emp_male.Text == ds.Tables[0].Rows[0][7].ToString())
            {
                rb_emp_male.Checked = true;
            }
            else
            {
                rb_emp_female.Checked = true;
            }
           
            tb_emp_join_date.Text = ds.Tables[0].Rows[0][8].ToString();
            tb_emp_dp.SelectedItem.Text = ds.Tables[0].Rows[0][9].ToString();
            tb_emp_dv.SelectedItem.Text = ds.Tables[0].Rows[0][10].ToString();

            tb_emp_type.Text = ds.Tables[0].Rows[0][11].ToString();
            tb_emp_basic_sal.Text = ds.Tables[0].Rows[0][12].ToString();

            tb_emp_house_aw.Text = ds.Tables[0].Rows[0][13].ToString();
            tb_emp_madical_aw.Text = ds.Tables[0].Rows[0][14].ToString();
            tb_emp_special_aw.Text = ds.Tables[0].Rows[0][15].ToString();
            tb_emp_fuel_aw.Text = ds.Tables[0].Rows[0][16].ToString();
            tb_emp_phone_bill_aw.Text = ds.Tables[0].Rows[0][17].ToString();
            tb_other_aw.Text = ds.Tables[0].Rows[0][18].ToString();

            tb_emp_tax_pf.Text = ds.Tables[0].Rows[0][19].ToString();
            tb_emp_tax_dd.Text = ds.Tables[0].Rows[0][20].ToString();
            tb_emp_other_tax_dd.Text = ds.Tables[0].Rows[0][21].ToString();

            tb_emp_gross_sal.Text = ds.Tables[0].Rows[0][22].ToString();
            tb_emp_total_dd.Text = ds.Tables[0].Rows[0][23].ToString();
            tb_emp_net_sal.Text = ds.Tables[0].Rows[0][24].ToString();

        }
    }

    protected void btn_emp_delete_Click(object sender, EventArgs e)
    {
        String strdel = "delete from emp_info where emp_id = " + emp_id + "";
        cmd = new SqlCommand(strdel, conn);
        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            Response.Redirect("employee.aspx");
        }
        else
        {
            Response.Write("<script language=javascript>alert('not delete employee');</script>");
        }
    }
}