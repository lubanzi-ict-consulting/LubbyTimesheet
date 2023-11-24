<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateEmployee.aspx.cs" Inherits="MVPSystem.CreateEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <title>Create Employee</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Styling for the page -->
    <style>
        body {
            font-family: 'Lato', sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #11181f;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            z-index: 1;
        }

        .navbar-brand {
            color: #ecf0f1;
            margin-right: auto;
        }

        .hamburger-icon {
            font-size: 20px;
            cursor: pointer;
            color: #ecf0f1;
            margin-left: 10px;
        }

        .sidebar {
            position: fixed;
            width: 220px;
            height: 100%;
            background-color: #2c3e50;
            color: #ecf0f1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 20px;
            padding-top: 20px;
            z-index: 2;
        }

        .sidebar a {
            padding: 10px 25px;
            text-decoration: none;
            font-size: 16px;
            color: #ecf0f1;
            display: block;
            transition: background-color 0.3s;
            border-radius: 5px;
            width: 100%;
            text-align: left;
        }

        .sidebar a:hover {
            background-color: #3498db;
        }

        .content {
            margin-left: 220px;
            padding: 20px;
            position: relative;
            z-index: 1;
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ecf0f1;
            padding: 20px;
            width: 50%;
            position: relative;
            z-index: 0;
        }

        .card-header {
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
            margin-bottom: 20px;
            background-color: dimgray;
            color: white;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-group {
            display: flex;
            gap: 10px;
        }
    </style>
</head>

<body>
    <!-- Top navigation bar -->
    <div class="navbar navbar-expand-lg navbar-dark bg-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#">LUBANZI</a>
    </div>

    <!-- Sidebar navigation -->
    <div class="sidebar">
        <!-- Sidebar links -->
        <a href="Dashboard.aspx">
            <i class="fas fa-home"></i>Dashboard
        </a>
        <a href="Project.aspx">
            <i class="fas fa-briefcase"></i>Project
        </a>
        <a href="Employee.aspx">
            <i class="fas fa-users"></i>Employee
        </a>
        <a href="Timesheet.aspx">
            <i class="fas fa-keyboard"></i>Timesheet
        </a>
        <a href="Login.aspx">
            <i class="fas fa-power-off"></i>Logout
        </a>
    </div>

    <!-- Main content area -->
    <div class="content">
        <form id="form1" runat="server" class="d-flex">
            <!-- Bootstrap card container -->
            <div class="card">
                <h1 class="card-title text-center mt-3">Create Employee</h1>
                <div class="card-header">
                    <!-- Your existing form content here -->

                    <div class="container-form">
                        <div class="sub-content">
                            <div class="form-group">
                                <label for="txtEmployeeName">Create Employee:</label>
                                <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control" required></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtTask">Task:</label>
                                <asp:TextBox ID="txtTask" runat="server" CssClass="form-control" required></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="Roles">Role:</label>
                                <asp:DropDownList ID="Roles" runat="server" CssClass="form-control">
                                    <asp:ListItem>Select your Role</asp:ListItem>
                                    <asp:ListItem>Software Engineer</asp:ListItem>
                                    <asp:ListItem>Network Engineer</asp:ListItem>
                                    <asp:ListItem>Software Testing</asp:ListItem>
                                    <asp:ListItem>Quality Assurance</asp:ListItem>
                                    <asp:ListItem>Business Analyst</asp:ListItem>
                                    <asp:ListItem>RPA</asp:ListItem>
                                    <asp:ListItem>AI</asp:ListItem>
                                    <asp:ListItem>Support System</asp:ListItem>
                                    <asp:ListItem>Human Resources</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group btn-group">
                                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"
                                    OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary"
                                    OnClick="btnCancel_Click" />
                                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-secondary"
                                    OnClick="btnBack_Click" />
                            </div>
                            <asp:Label ID="Label3" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Toggle sidebar script -->
    <script>
        $(document).ready(function () {
            $("#toggleSidebar").click(function () {
                $(".sidebar").toggle();
            });
        });
    </script>
</body>

</html>
