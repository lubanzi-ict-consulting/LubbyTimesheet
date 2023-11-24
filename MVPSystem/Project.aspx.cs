using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class Project : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\EmployeeInfo.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            // Your existing code...

            // Debugging: Check the data in SqlDataSource1
            var view = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRow row in view.Table.Rows)
            {
                var projectName = row["ProjectName"].ToString();
                var startDate = row["StartDate"].ToString();
                var endDate = row["EndDate"].ToString();
                var clientName = row["ClientName"].ToString();
                var hours = row["Hour"].ToString(); // Check if this line throws any error
            }
        }


        protected void BtnSave_Click(object sender, EventArgs e)
        {
            /*INSERT DATA INTO THE DATABASE*/
            //string conn = "insert into CreateProject ([ProjectName], [StartDate], [EndDate], [ClientName]) values ('" + txtProjectName.Text + "','" + StartDate.Text + "', '" + endDate.Text + "', '" + txtClientName.Text + "')";
            //string conString = "insert into ProjectName values('2012-02-21T18:10:00', '2012-01-01T00:00:00')";

            /*SqlCommand allow the user to query and send the command to the database*/
            //SqlCommand cmd = new SqlCommand(conn, con);
            con.Open();

            /*ExecuteNonQuery for insert, update, and delete commands. it is the method that is best for the different commands*/
            //cmd.ExecuteNonQuery();

            /*Once the operation is completed successfully, then close the connection to the databasez*/
            con.Close();

            Response.Write("<script>alert('Project successfully created')</script>");
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            //txtProjectName.Text = "";
            //StartDate.Text = "";
            //endDate.Text = "";
            //txtClientName.Text = "";

            //txtProjectName.Focus();
        }
        protected void btnProject_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateProject.aspx");
        }
    }
}