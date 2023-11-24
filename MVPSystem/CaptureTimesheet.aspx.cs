using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVPSystem
{
    public partial class CaptureTimesheet : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate the dropdown lists with date options
                FillDropDowns();
            }
        }

        private void FillDropDowns()
        {
            FillDropDown(ddlProjectName, "getproject", "ProjectName", "ProjectName");
            FillDropDown(ddlEmployeeName, "getemployee", "EmployeeName", "EmployeeName");
            FillDropDown(ddlTask, "getemployee", "Task", "Task");

            // Add default items
            AddDefaultItem(ddlProjectName, "--Select Project--");
            AddDefaultItem(ddlEmployeeName, "--Select Employee--");
            AddDefaultItem(ddlTask, "--Select Task--");
        }

        private void FillDropDown(DropDownList ddl, string storedProcedure, string textField, string valueField)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\EmployeeInfo.mdf;Integrated Security=True"))
            {
                try
                {
                    conn.Open(); // Open the connection
                    using (SqlCommand cmd = new SqlCommand(storedProcedure, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            ddl.DataSource = dt;
                            ddl.DataTextField = textField;
                            ddl.DataValueField = valueField;
                            ddl.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions (e.g., log the error)
                    DisplayMessage("Error: " + ex.Message, Color.Red);
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Get the current date and format it as needed
            string currentDate = DateTime.Now.ToString("dd MMMM yyyy");

            using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\EmployeeInfo.mdf;Integrated Security=True"))
            {
                connection.Open();
                string insertQuery = "INSERT INTO [CaptureTimesheet] ([ProjectName], [EmployeeName], [Task], [StartDate], [EndDate]) VALUES (@ProjectName, @EmployeeName, @Task, @StartDate, @EndDate)";

                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@ProjectName", ddlProjectName.SelectedValue);
                    command.Parameters.AddWithValue("@EmployeeName", ddlEmployeeName.SelectedValue);
                    command.Parameters.AddWithValue("@Task", ddlTask.SelectedValue);
                    command.Parameters.AddWithValue("@StartDate", txtStartDate.Text);
                    command.Parameters.AddWithValue("@EndDate", txtEndDate.Text);

                    try
                    {
                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            DisplayMessage("Successfully saved", Color.Green);
                        }
                        else
                        {
                            DisplayMessage("No rows were affected. Insert failed", Color.Red);
                        }
                    }
                    catch (Exception ex)
                    {
                        DisplayMessage("Error: " + ex.Message, Color.Red);
                    }
                }
            }
        }

        private void AddDefaultItem(DropDownList ddl, string text)
        {
            ddl.Items.Insert(0, new ListItem(text, "0"));
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearSelections();
        }

        private void ClearSelections()
        {
            ddlProjectName.ClearSelection();
            ddlEmployeeName.ClearSelection();
            ddlTask.ClearSelection();
            txtStartDate.Text = ""; // Clear the text for date fields
            txtEndDate.Text = "";
            ddlProjectName.Focus();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Timesheet.aspx");
        }

        private void DisplayMessage(string message, Color color)
        {
            lblPopupMessage.Text = message;
            lblPopupMessage.ForeColor = color;
        }
    }
}
