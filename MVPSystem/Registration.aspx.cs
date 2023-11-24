using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\EmployeeInfo.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                // INSERT DATA INTO THE DATABASE

                // Use parameterized query to prevent SQL injection
                string connString = "insert into Register ([Fname], [Lname], [EmailAddress], [Gender], [PhoneNumber], [Password]) " +
                       "values (@Fname, @Lname, @Email, @Gender, @Phone, @Password)";

                using (SqlCommand cmd = new SqlCommand(connString, con))
                {
                    // Add parameters with values
                    cmd.Parameters.AddWithValue("@Fname", txtFname.Text);
                    cmd.Parameters.AddWithValue("@Lname", txtLname.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Gender", txtGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }


                // Show success message and login link
                lblMessage.Text = "Registered Successfully!";
                lblMessage.Visible = true;
                lnkLogin.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error occurred during registration. " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
            }
        }

    }
}