using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class ViewEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve data from the query string and populate your controls
            txtEmployeeName.Text = Request.QueryString["EmployeeName"].ToString();
            txtTask.Text = Request.QueryString["Task"].ToString();
            txtRole.Text = Request.QueryString["Role"].ToString();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            // Redirect back to the employee list page (adjust the URL as needed)
            Response.Redirect("Employee.aspx");
        }
    }
}
