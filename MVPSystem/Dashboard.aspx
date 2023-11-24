<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="MVPSystem.Dashboard" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!-- External Stylesheets -->
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">

    <!-- Internal Styles -->
    <style>
        body {
            font-family: 'Lato', sans-serif;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            position: fixed;
            height: 100%;
            width: 220px;
            background-color: #2c3e50; /* background color */
            color: #ecf0f1; /*  text color */
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* Align items to the left */
            gap: 20px;
            padding-top: 20px;
        }

            .sidebar a {
                padding: 10px 25px; /* Adjusted padding for better spacing */
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
                    background-color: #3498db; /* Azure-like hover color */
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

        .main-card {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ecf0f1;
            padding: 20px;
        }

        .hamburger-icon {
            font-size: 20px;
            cursor: pointer;
            color: #ecf0f1;
            margin-left: 10px;
        }
    </style>
</head>

<body>
    <!-- Top Navigation Bar -->
    <div class="navbar">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <span class="navbar-toggler-icon hamburger-icon" id="toggleSidebar">&#9776;</span>
        <a class="navbar-brand" href="#">LUBANZI</a>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
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

    <!-- Main content -->
    <main role="main" class="content">
        <form id="form1" runat="server">
            <div class="container-fluid">
                <center>
                    <div class="main-card">
                        <h1>Welcome To Our Dashboard</h1>
                        <h4 style="margin: auto; margin-top: 20px;">PROJECT LIST:</h4>
                        <div class="table-responsive">
                            <asp:GridView ID="gvCreateProject" runat="server" AutoGenerateColumns="False"
                                DataSourceID="SqlDataSource1" CssClass="table table-bordered">
                                <Columns>
                                    <asp:BoundField DataField="ProjectName" HeaderText="Project Name"
                                        SortExpression="ProjectName" />
                                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString="{0:dd MMMM yyyy}" />
                                    <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" DataFormatString="{0:dd MMMM yyyy}" />
                                    <asp:BoundField DataField="ClientName" HeaderText="Client Name"
                                        SortExpression="ClientName" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </center>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [ProjectName], [StartDate], [EndDate], [ClientName] FROM [CreateProject]"></asp:SqlDataSource>
            </div>
        </form>
    </main>

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
