<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTimesheet.aspx.cs" Inherits="MVPSystem.ViewTimesheet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link href="style/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
</head>

<body>
   
    <div class="frame">
        <form id="form2" runat="server" style="position: relative; top: -210px;">
            <main class="content">
                <center><h1>View Timesheet</h1></center>
                <center>
                    <div class="sub-content" style="position: relative; left: -2px; margin-top: 10px;">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="txtProjectName">Project Name</label>
                                        <asp:TextBox ID="txtProjectName" runat="server" CssClass="form-control" Height="35px" Width="100%" disabled BackColor="White"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="txtEmployeeName">Employee Name</label>
                                        <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control" Height="35px" Width="100%" disabled BackColor="White"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="txtTask">Task</label>
                                        <asp:TextBox ID="txtTask" runat="server" CssClass="form-control" Height="35px" Width="100%" disabled BackColor="White"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="txtStartDate">Start Date</label>
                                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" Height="35px" Width="100%" disabled BackColor="White"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="txtEndDate">End Date</label>
                                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" Height="35px" Width="100%" disabled BackColor="White"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="txtHour">Hour</label>
                                        <asp:TextBox ID="txtHour" runat="server" CssClass="form-control" Height="35px" Width="100%" disabled BackColor="White"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </center>
                <div style="margin-left: -510px; margin-top:15px;">
                    <asp:Button ID="btnBack" runat="server" Text="Back" Height="35px" Width="120px" OnClick="btnBack_Click" />
                </div>
            </main>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.getElementById('toggleSidebar').addEventListener('click', function () {
            document.querySelector('.sidebar').style.left = '0';
        });

        document.getElementById('cancel').addEventListener('click', function () {
            document.querySelector('.sidebar').style.left = '-250px';
        });
    </script>
</body>
</html>
