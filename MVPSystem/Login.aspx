<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MVPSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Login form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            padding-top: 50px;
        }

        .card {
            max-width: 500px;
            margin: 0 auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-img-top {
            max-width: 150px;
            height: auto;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .input-group {
            position: relative;
            width: 100%;
        }

        .input-group-append {
            position: absolute;
            right: 0;
            top: 0;
            bottom: 0;
            display: flex;
            align-items: center;
            padding: 0.375rem 0.75rem;
            border: 1px solid #ced4da;
            border-left: 0;
        }

        .btn-link {
            padding: 0;
            color: #007bff;
            background-color: transparent;
            border: 0;
        }

        .text-center p {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card mx-auto">
                    <img src="Capture2.PNG" class="card-img-top img-fluid mb-4" alt="Card image" />
                    <div class="card-body">
                        <h3 class="card-title text-center">Login</h3>
                        <asp:Label ID="Label1" runat="server" Text="Sign in to continue" CssClass="d-block text-center"></asp:Label>
                        <form id="form1" runat="server" class="needs-validation" novalidate>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="control-label">Email Address <span style="color: red">*</span></asp:Label>
                                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" required />
                                <div class="invalid-feedback">
                                    Please enter a valid email address.
                                </div>
                                <i id="toggleEmail" class="fa fa-envelope"></i>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="control-label">Password <span style="color: red">*</span></asp:Label>
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" TextMode="Password" required />
                                    <div class="input-group-append">
                                       
                                    </div>
                                </div>
                                <div class="invalid-feedback">
                                    Please enter your password.
                                </div>
                            </div>

                            <div class="form-group">
                                <img id="captchaImage" runat="server" class="img-fluid mb-2" />
                                <asp:Label runat="server" AssociatedControlID="captchacode" CssClass="control-label">Enter Captcha code</asp:Label>
                                <asp:TextBox runat="server" ID="captchacode" CssClass="form-control" placeholder="Enter Captcha code" required />
                                <button type="button" class="btn btn-link" id="btnRefreshCaptcha" OnClientClick="btnRefreshCaptcha_Click">Refresh CAPTCHA</button>
                            </div>

                            <div class="form-group">
                                <asp:HyperLink ID="lnkForgotPass" href="ForgotPassword.aspx" runat="server" Font-Size="Small">Forgot password?</asp:HyperLink>
                            </div>

                            <asp:Button runat="server" ID="Button1" Text="Submit" OnClick="BtnLogin_Click" CssClass="btn btn-primary" />
                            <div class="text-center">
                                <p>
                                    <asp:Label ID="lblText" runat="server" Text="Not Registered yet?">
                                        <asp:HyperLink ID="lnkRegister" href="Registration.aspx" runat="server">&nbsp;Register here</asp:HyperLink>
                                    </asp:Label>
                                </p>
                            </div>

                            <asp:Label ID="txtErrorMessage" runat="server" Text="" ForeColor="red"></asp:Label>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        // Add an event listener for form submission
        document.getElementById('form1').addEventListener('submit', function (event) {
            // Add the 'was-validated' class to the form
            this.classList.add('was-validated');

            // Validate the form
            if (!this.checkValidity()) {
                // If the form is not valid, prevent submission
                event.preventDefault();
                event.stopPropagation();
            }
        });

        function btnRefreshCaptcha_Click() {
            // Your JavaScript logic here
            // Call the RefreshCaptcha method when the button is clicked
            RefreshCaptcha();
            // Also, update the source of the image control to the new captcha
            document.getElementById('captchaImage').src = "~/MyCaptcha.aspx?" + new Date().getTime();
        }
    </script>
</body>
</html>
