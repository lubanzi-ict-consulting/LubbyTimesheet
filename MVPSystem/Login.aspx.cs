using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class Login : Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\EmployeeInfo.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the session variable is null or empty
                if (Session["sessionCaptcha"] == null || string.IsNullOrEmpty(Session["sessionCaptcha"].ToString()))
                {
                    // If it is, generate a new captcha
                    RefreshCaptcha();
                }

                // Set the source of the image control to the captcha image
                captchaImage.Src = "~/MyCaptcha.aspx?" + DateTime.Now.Ticks;
            }
        }

        private void RefreshCaptcha()
        {
            // Refresh the CAPTCHA
            captchaImage.Src = "~/MyCaptcha.aspx?" + DateTime.Now.Ticks;
            captchacode.Text = string.Empty;
            txtErrorMessage.Text = string.Empty;
            // Set the captcha code in the session variable
            Session["sessionCaptcha"] = captchacode.Text.ToLower();
        }

        protected void BtnLogin_Click(object sender, EventArgs e)

        {
            if (Page.IsValid)
            {
                if (captchacode.Text.ToLower() == Session["sessionCaptcha"].ToString())
                {
                    string email = Request.Form["txtEmail"];
                    string password = Request.Form["txtPassword"];

                    string query = "SELECT count(*) FROM Register WHERE EmailAddress = @Email and Password = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Use parameters to avoid SQL injection
                        cmd.Parameters.AddWithValue("@Email", email.Trim());
                        cmd.Parameters.AddWithValue("@Password", password.Trim());

                        con.Open();
                        int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                        con.Close();

                        if (count > 0)
                        {
                            Session["@Email"] = email.Trim();
                            Response.Redirect("Dashboard.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Incorrect credentials')</script>");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Incorrect captcha code')</script>");
                }
            }
        }

        protected void BtnRefreshCaptcha_Click(object sender, EventArgs e)
        {
            // Call the RefreshCaptcha method when the button is clicked
            RefreshCaptcha();
            // Also, update the source of the image control to the new captcha
            captchaImage.Src = "~/MyCaptcha.aspx?" + DateTime.Now.Ticks;
        }
    }
}
