<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="MVPSystem.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

    <style>
        body {
            background-color: #f8f9fa;
        }

        .register-container {
            margin-top: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .register-card {
            max-width: 480px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .register-img-top {
            max-width: 141px;
            height: auto;
            display: block;
            margin: 0 auto;
            margin-top: 20px;
        }

        .register-title {
            text-align: center;
            margin-top: 20px;
        }

        .toggle-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            transition: all 0.3s ease-in-out;
            color: #6c757d;
            cursor: pointer;
        }

        .form-group {
            position: relative;
            margin-bottom: 20px;
        }

        .btn-register {
            width: 100%;
        }

        /* Add some margin to the success message and change its color to green */
        #lblMessage {
            margin-top: 20px;
            color: green;
        }
    </style>

</head>
<body>
    <div class="container register-container">
        <div class="card register-card">
            <img src="Capture2.PNG" class="card-img-top register-img-top" alt="Card image">
            <div class="card-body">
                <h2 class="card-title register-title">Create New Account</h2>
                <form id="form1" runat="server">
                    <div class="form-group">
                        <label for="txtEmail">Email Address <span style="color:red">*</span></label>
                        <div class="input-group">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Height="35px" Width="100%" TextMode="Email" required></asp:TextBox>
                            <span class="icon-addon toggle-icon" onclick="toggleVisibility('txtEmail', 'emailIcon')">
                                <i id="emailIcon" class="fa fa-envelope"></i>
                            </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtFname">First Name <span style="color:red">*</span></label>
                        <div class="input-group">
                            <asp:TextBox ID="txtFname" runat="server" CssClass="form-control" Height="35px" Width="100%" required></asp:TextBox>
                            <span class="icon-addon toggle-icon" onclick="toggleVisibility('txtFname', 'fnameIcon')">
                                <i id="fnameIcon" class="fa fa-user"></i>
                            </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtLname">Last Name <span style="color:red">*</span></label>
                        <div class="input-group">
                            <asp:TextBox ID="txtLname" runat="server" CssClass="form-control" Height="35px" Width="100%" required></asp:TextBox>
                            <span class="icon-addon toggle-icon" onclick="toggleVisibility('txtLname', 'lnameIcon')">
                                <i id="lnameIcon" class="fa fa-user"></i>
                            </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtPhone">Phone Number <span style="color:red">*</span></label>
                        <div class="input-group">
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Height="35px" Width="100%" TextMode="Phone" required></asp:TextBox>
                            <span class="icon-addon toggle-icon" onclick="toggleVisibility('txtPhone', 'phoneIcon')">
                                <i id="phoneIcon" class="fa fa-phone"></i>
                            </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtGender">Gender <span style="color:red">*</span></label>
                        <asp:DropDownList ID="txtGender" runat="server" CssClass="form-control" Height="35px" Width="100%" required>
                            <asp:ListItem>Select your gender*</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="txtPassword">Password <span style="color:red">*</span></label>
                        <div class="input-group">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Height="35px" Width="100%" TextMode="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required></asp:TextBox>
                            <span class="icon-addon toggle-icon" onclick="togglePasswordVisibility('txtPassword', 'passwordIcon')">
                                <i id="passwordIcon" class="fa fa-eye"></i>
                            </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary btn-register" OnClick="btnRegister_Click" />
                    </div>
                    <div class="form-group">
                        <!-- Add the success message and link to go back to login -->
                        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="green" Visible="false"></asp:Label>
                        <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Login.aspx" CssClass="btn btn-link" Visible="false">Already registered? Login here</asp:HyperLink>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Your existing JavaScript code
        function toggleVisibility(textBoxId, iconId) {
            var textBox = document.getElementById(textBoxId);
            var icon = document.getElementById(iconId);
            icon.style.color = textBox.value ? '#28a745' : '#6c757d';
        }

        function togglePasswordVisibility(passwordId, iconId) {
            var passwordField = document.getElementById(passwordId);
            var icon = document.getElementById(iconId);
            var type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            icon.style.color = type === 'password' ? '#6c757d' : '#28a745';
        }
    </script>

</body>
</html>
