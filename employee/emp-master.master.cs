using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee_emp_master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["emp_id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        lbl_admin_name.Text = Session["emp_name"].ToString();
    }
}
