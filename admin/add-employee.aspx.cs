using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_add_employee : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            getDepartment();
            string select_dp_id = tb_emp_dp.SelectedValue.ToString();
            getDivision(select_dp_id);
        }
        btn_emp_submit.Enabled = false;
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
    protected void tb_emp_dp_SelectedIndexChanged(object sender, EventArgs e)
    {  
        string select_dp_id = tb_emp_dp.SelectedValue.ToString();
        getDivision(select_dp_id);
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
    protected void btn_emp_submit_Click(object sender, EventArgs e)
    {
                //gender
        string gender = "";
        if(rb_emp_male.Checked){
            gender = rb_emp_male.Text;
        }else{
              gender = rb_emp_female.Text;
        }


        String SInsert = "INSERT INTO emp_info VALUES(@emp_name,@emp_mobile,@emp_email,@emp_pwd,@emp_address,@emp_dob,@emp_gender,@emp_join_date,@emp_department,@emp_division,@emp_type,@emp_basic_sal,@emp_house_aw,@emp_madical_aw,@emp_special_aw,@emp_fuel_aw,@emp_phone_bill_aw,@emp_other_aw,@emp_pf,@emp_tax_dd,@emp_other_dd,@emp_gross_sal,@emp_total_dd,@emp_net_sal)";
        cmd = new SqlCommand(SInsert, conn);
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
            Response.Write("<script language=javascript>alert('not add employee');</script>");
        }

    }
  
}