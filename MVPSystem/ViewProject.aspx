<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProject.aspx.cs" Inherits="MVPSystem.ViewProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Project</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="card">
                <div class="card-body">
                    <h1 class="card-title text-center">View Project</h1>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtProjectName">Project Name</label>
                                    <asp:TextBox ID="txtProjectName" runat="server" CssClass="form-control" Height="35px" Width="100%" disabled></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtClientName">Client Name</label>
                                    <asp:TextBox ID="txtClientName" runat="server" CssClass="form-control" Height="35px" Width="100%" disabled></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="StartDate">Start Date</label>
                                    <asp:TextBox ID="StartDate" runat="server" TextMode="Date" CssClass="form-control" Height="35px" Width="100%" Visible="false" disabled></asp:TextBox>
                                    <asp:Label ID="StartDateLabel" runat="server" CssClass="form-control" Height="35px" Width="100%"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="endDate">End Date</label>
                                    <asp:TextBox ID="endDate" runat="server" TextMode="Date" CssClass="form-control" Height="35px" Width="100%" Visible="false" disabled></asp:TextBox>
                                    <asp:Label ID="EndDateLabel" runat="server" CssClass="form-control" Height="35px" Width="100%"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="Hour">Hours</label>
                                    <asp:TextBox ID="Hour" runat="server" TextMode="Singleline" CssClass="form-control" Height="35px" Width="100%" disabled></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-12">
                                <asp:Button ID="btnBack" runat="server" Text="Go Back" CssClass="btn btn-primary" OnClick="btnBack_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
