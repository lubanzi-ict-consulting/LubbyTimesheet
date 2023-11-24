using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class CreateProject : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\EmployeeInfo.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            /*INSERT DATA INTO THE DATABASE*/
            string conn = "insert into CreateProject ([ProjectName], [StartDate], [EndDate], [ClientName], [Hour]) values ('" + txtProjectName.Text + "','" + StartDate.Text + "', '" + endDate.Text + "', '" + txtClientName.Text + "', '" + txtHour.Text + "')";

            /*SqlCommand allow the user to query and send the command to the database*/
            SqlCommand cmd = new SqlCommand(conn, con);
            con.Open();

            /*ExecuteNonQuery for insert, update, and delete commands. it is the method that is best for the different commands*/
           cmd.ExecuteNonQuery();

            /*Once the operation is completed successfully, then close the connection to the databasez*/
            con.Close();

            Response.Write("<script>alert('Project successfully created')</script>");
        }

        protected void btnBack_Click(object sender, EventArgs e)
            {
            Response.Redirect("Project.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtProjectName.Text = "";
            StartDate.Text = "";
            endDate.Text = "";
            txtClientName.Text = "";

            txtProjectName.Focus();
        }


    }
}
