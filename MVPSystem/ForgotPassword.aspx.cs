using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class ForgotPassword : Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\EmployeeInfo.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            // Add any necessary initialization logic
        }

        protected void BtnResetPassword_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = txtResetEmail.Text.Trim();
                string newPassword = txtNewPassword.Text;
                string confirmNewPassword = txtConfirmPassword.Text;

                if (newPassword != confirmNewPassword)
                {
                    lblResetMessage.Text = "Passwords do not match.";
                    lblResetMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // Check if the email exists in the database
                con.Open();
                SqlCommand checkEmailCmd = new SqlCommand("SELECT COUNT(*) FROM Register WHERE EmailAddress = @Email", con);
                checkEmailCmd.Parameters.AddWithValue("@Email", email);
                int emailCount = Convert.ToInt32(checkEmailCmd.ExecuteScalar());
                con.Close();

                if (emailCount > 0)
                {
                    // Update the password in the database
                    con.Open();
                    SqlCommand updatePasswordCmd = new SqlCommand("UPDATE Register SET Password = @Password WHERE EmailAddress = @Email", con);
                    updatePasswordCmd.Parameters.AddWithValue("@Password", newPassword);
                    updatePasswordCmd.Parameters.AddWithValue("@Email", email);
                    updatePasswordCmd.ExecuteNonQuery();
                    con.Close();

                    lblResetMessage.Text = "Password reset successful!";
                    lblResetMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblResetMessage.Text = "Email not found.";
                    lblResetMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}