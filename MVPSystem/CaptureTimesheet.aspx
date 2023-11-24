<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CaptureTimesheet.aspx.cs" Inherits="MVPSystem.CaptureTimesheet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <!-- Add Bootstrap Datepicker CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />

    <title>Capture Timesheet</title>
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

        /* Adjusted card styles */
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

        .btn-save {
            margin-top: 10px;
        }

        .container-form {
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <!-- Top navigation bar -->
    <div class="navbar">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <span class="navbar-toggler-icon hamburger-icon" id="toggleSidebar">&#9776;</span>
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
        <form id="form1" runat="server">
            <!-- Bootstrap card container -->
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h1 class="card-title">Capture Timesheet</h1>
                </div>
                <div class="card-body">
                    <!-- Your existing form content here -->
                    <div class="container-form">
                        <table class="container">
                            <!-- Your form fields here -->
                            <tr>
                                <td>
                                    <!-- Project Name Dropdown -->
                                    <asp:DropDownList ID="ddlProjectName" runat="server" CssClass="form-control" required></asp:DropDownList>
                                </td>
                                <td>
                                    <!-- Employee Name Dropdown -->
                                    <asp:DropDownList ID="ddlEmployeeName" runat="server" CssClass="form-control" required></asp:DropDownList>
                                </td>
                                <td>
                                    <!-- Task Dropdown -->
                                    <asp:DropDownList ID="ddlTask" runat="server" CssClass="form-control" required></asp:DropDownList>
                                </td>
                            </tr>
                          
                            <tr>
                                <td>
                                    <!-- Add Bootstrap Datepicker to the Start Date field -->
                                   <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control datepicker" required></asp:TextBox>
                                </td>
                                <!-- Add more labels and dropdowns as needed -->
                                <td>
                                    <!-- Add Bootstrap Datepicker to the End Date field -->
                                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control datepicker" required></asp:TextBox>
                                </td>
                                <!-- Add more labels and dropdowns as needed -->
                            </tr>
                        </table>
                        <br />
                        <!-- Add more HTML markup for additional form elements -->
                    </div>

                    <div style="margin-left: -570px;">
                        <asp:Button ID="Button1" runat="server" Text="Save" Height="35px" Width="120px" OnClick="btnSave_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" Height="35px" Width="120px" OnClick="btnClear_Click" />
                    </div>

                    <asp:Label ID="lblPopupMessage" runat="server" Text=""></asp:Label>

                    <!-- Save button -->
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-save" OnClick="btnSave_Click" />
                    </div>
                    <!-- End Save button -->
                </div>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Add Bootstrap Datepicker JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

    <!-- Toggle sidebar script -->
    <script>
        $(document).ready(function () {
            $("#toggleSidebar").click(function () {
                $(".sidebar").toggle();
            });

            // Initialize Bootstrap Datepicker
            $(".datepicker").datepicker({
                format: 'dd MM yyyy',
                autoclose: true,
            });
        });
    </script>
</body>
</html>
