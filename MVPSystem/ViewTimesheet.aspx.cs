using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class ViewTimesheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ProjectName"] != null)
            {
                txtProjectName.Text = Request.QueryString["ProjectName"].ToString();
            }

            if (Request.QueryString["Employee"] != null)
            {
                txtEmployeeName.Text = Request.QueryString["Employee"].ToString();
            }

            if (Request.QueryString["Task"] != null)
            {
                txtTask.Text = Request.QueryString["Task"].ToString();
            }

            if (Request.QueryString["StartDate"] != null)
            {
                txtStartDate.Text = Request.QueryString["StartDate"].ToString();
            }

            if (Request.QueryString["EndDate"] != null)
            {
                txtEndDate.Text = Request.QueryString["EndDate"].ToString();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Timesheet.aspx");
        }
    }
}
