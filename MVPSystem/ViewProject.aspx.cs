using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class ViewProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve data from the query string and populate your controls
                txtProjectName.Text = Request.QueryString["ProjectName"];
                string startDateValue = Request.QueryString["StartDate"];
                string endDateValue = Request.QueryString["EndDate"];
                Hour.Text = Request.QueryString["Hour"];
                txtClientName.Text = Request.QueryString["ClientName"];

                // Parse and set the values to the TextBoxes
                if (DateTime.TryParse(startDateValue, out DateTime startDate))
                {
                    StartDate.Text = startDate.ToString("yyyy-MM-dd");
                    StartDateLabel.Text = startDate.ToString("dd MMMM yyyy");
                }

                if (DateTime.TryParse(endDateValue, out DateTime endDate))
                {
                    this.endDate.Text = endDate.ToString("yyyy-MM-dd");
                    EndDateLabel.Text = endDate.ToString("dd MMMM yyyy");
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            // Redirect back to the project list page
            Response.Redirect("Project.aspx");
        }
    }
}
