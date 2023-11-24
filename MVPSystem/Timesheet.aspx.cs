using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class Timesheet1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCapture_Click(object sender, EventArgs e)
        {
            Response.Redirect("CaptureTimesheet.aspx");
        }

        protected void btnTimesheet_Click(object sender, EventArgs e)
        {
            // Redirect to the "CaptureTimesheet.aspx" page when the "New Timesheet" button is clicked
            Response.Redirect("CaptureTimesheet.aspx");
        }

        protected void gvCaptureTimesheet_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                // Retrieve the index of the clicked row
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Retrieve data from the GridView based on the index
                string projectName = gvCaptureTimesheet.DataKeys[rowIndex]["ProjectName"].ToString();
                string employeeName = gvCaptureTimesheet.DataKeys[rowIndex]["EmployeeName"].ToString();

                // Redirect to the details page with the retrieved parameters
                Response.Redirect($"DetailsPage.aspx?ProjectName={projectName}&EmployeeName={employeeName}");
            }
        }
    }
}
