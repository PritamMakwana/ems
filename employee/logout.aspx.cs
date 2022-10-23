using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee_logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("emp_id");
        Session.Remove("emp_name");
        if (Session["emp_id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
    }
}