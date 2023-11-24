using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class Employee : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\EmployeeInfo.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            // Your existing code...

            // Debugging: Check the data in SqlDataSource1
            var view = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRow row in view.Table.Rows)
            {
                var employeeName = row["EmployeeName"].ToString();
                var task = row["Task"].ToString();
                var role = row["Role"].ToString();
            }
        }

        protected void btnEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateEmployee.aspx");
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            /*INSERT DATA INTO THE DATABASE*/
            //string conn = "insert into YourEmployeeTableName ([EmployeeName], [Task], [Role]) values ('" + txtEmployeeName.Text + "','" + txtTask.Text + "', '" + txtRole.Text + "')";

            /*SqlCommand allows the user to query and send the command to the database*/
            //SqlCommand cmd = new SqlCommand(conn, con);
            con.Open();

            /*ExecuteNonQuery for insert, update, and delete commands. it is the method that is best for the different commands*/
            //cmd.ExecuteNonQuery();

            /*Once the operation is completed successfully, then close the connection to the database*/
            con.Close();

            Response.Write("<script>alert('Employee successfully created')</script>");
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            //txtEmployeeName.Text = "";
            //txtTask.Text = "";
            //txtRole.Text = "";

            //txtEmployeeName.Focus();
        }
    }
}
