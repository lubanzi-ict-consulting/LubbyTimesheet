<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateProject.aspx.cs" Inherits="MVPSystem.CreateProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <title>Create Project</title>
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
        }

        /* Removed the entire header section with the logo */
        /*
        .sidebar img {
            height: 50px;
            width: 70%;
            margin-bottom: 10px;
        }
        */

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
        }

        @media (max-width: 768px) {
            .sidebar {
                display: none;
            }

            .content {
                margin-left: 0;
            }
        }

        /* Adjusted card styles */
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ecf0f1;
            padding: 20px;
            width: 50%;
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

        .sub-content {
            margin-top: 20px;
        }

        .date {
            white-space: nowrap;
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
                <h1 class="card-title">Create Project</h1>
                <div class="card-header">
                    <!-- Your existing form content here -->

                    <div class="container-form">
                        <div class="sub-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblProject" runat="server" Text="Project Name "></asp:Label><span style="color:red">*</span>
                                    <asp:TextBox ID="txtProjectName" runat="server" CssClass="form-control" required="enabled"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <asp:Label ID="lblStartDate" runat="server" Text="Start Date"></asp:Label><span style="color:red">*</span>
                                    <asp:TextBox ID="StartDate" runat="server" TextMode="Date" CssClass="form-control" required="enabled"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblEndDate" runat="server" Text="End Date"></asp:Label>
                                    <asp:TextBox ID="endDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <asp:Label ID="lblHour" runat="server" Text="Hour"></asp:Label><span style="color:red">*</span>
                                    <asp:TextBox ID="txtHour" runat="server" CssClass="form-control" required="enabled" TextMode="Time"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblClientName" runat="server" Text="Client Name"></asp:Label><span style="color:red">*</span>
                                    <asp:TextBox ID="txtClientName" runat="server" CssClass="form-control" required="enabled"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col-md-12">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-save" OnClick="btnSave_Click" />
                                </div>
                            </div>
                            <asp:Label ID="lblPopupMessage" runat="server" Text="" ForeColor="red"></asp:Label>
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
