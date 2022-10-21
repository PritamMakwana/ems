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
        DataSet ds = new DataSet();
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


   
      
            //tb_emp_gross_sal.Text = (Convert.ToInt32(tb_emp_gross_sal.Text) + Convert.ToInt32(tb_emp_basic_sal.Text)).ToString();

    protected void btn_cal_Click(object sender, EventArgs e)
    {
        int pluse = Convert.ToInt16(tb_emp_basic_sal.Text) +
                    Convert.ToInt16(tb_emp_house_aw.Text) +
                    Convert.ToInt16(tb_emp_madical_aw.Text) +
                    Convert.ToInt16(tb_emp_special_aw.Text) +
                    Convert.ToInt16(tb_emp_fuel_aw.Text) +
                    Convert.ToInt16(tb_emp_phone_bill_aw.Text) +
                    Convert.ToInt16(tb_emp_other_dd.Text);

        //int minus = Convert.ToInt16(tb_emp_pf.Text) +
        //            Convert.ToInt16(tb_emp_tax_dd.Text) +
        //            Convert.ToInt16(tb_emp_total_dd.Text);

        string minus = (Convert.ToInt16(tb_emp_total_dd.Text)).ToString();


        int net_salary = Convert.ToInt16(tb_emp_gross_sal.Text) 
                             - Convert.ToInt16(tb_emp_total_dd.Text);

        tb_emp_gross_sal.Text = pluse.ToString();
        tb_emp_total_dd.Text = minus.ToString();
        tb_emp_net_sal.Text = net_salary.ToString();

        btn_emp_submit.Enabled = true;
    }
    protected void btn_emp_submit_Click(object sender, EventArgs e)
    {

    }
}