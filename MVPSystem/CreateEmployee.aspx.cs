using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class CreateEmployee : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\EmployeeInfo.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string insert = "insert into CreateEmployee ([EmployeeName] ,[Task] ,[Role]) values ('" + txtEmployeeName.Text + "','" + txtTask.Text + "','" + Roles.Text + "')";
            SqlCommand cmd = new SqlCommand(insert, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            Response.Write("<script>alert('Successfuly registred')</script>");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtEmployeeName.Text = "";
            txtTask.Text = "";
            Roles.ClearSelection();

            txtEmployeeName.Focus();
        }

        protected void btnBack_Click(object sender, EventArgs e)
            {
            Response.Redirect("Employee.aspx");
        }
    }
}