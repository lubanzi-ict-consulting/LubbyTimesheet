<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="MVPSystem.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Forgot Password</title>
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
                    <div class="card-body">
                        <h2 class="card-title text-center">Forgot Password</h2>
                        <asp:Label ID="lblResetMessage" runat="server" Text="" ForeColor="green"></asp:Label>
                        <form id="formForgotPassword" runat="server" class="needs-validation" novalidate>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtResetEmail" CssClass="control-label">Email Address <span style="color: red">*</span></asp:Label>
                                <asp:TextBox runat="server" ID="txtResetEmail" CssClass="form-control" required />
                                <div class="invalid-feedback">
                                    Please enter a valid email address.
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtNewPassword" CssClass="control-label">New Password <span style="color: red">*</span></asp:Label>
                                <asp:TextBox runat="server" ID="txtNewPassword" CssClass="form-control" TextMode="Password" required />
                                <div class="invalid-feedback">
                                    Password is required.
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtConfirmPassword" CssClass="control-label">Confirm Password <span style="color: red">*</span></asp:Label>
                                <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="form-control" TextMode="Password" required />
                                <div class="invalid-feedback">
                                    Please confirm the password.
                                </div>
                            </div>

                            <asp:Button runat="server" ID="btnResetPassword" Text="Reset Password" OnClick="BtnResetPassword_Click" CssClass="btn btn-primary" />
                        </form>

                        <!-- Link to go back to the login page -->
                        <div class="text-center">
                            <p>
                                <asp:HyperLink ID="lnkBackToLogin" runat="server" NavigateUrl="~/Login.aspx" CssClass="btn btn-link">Back to Login</asp:HyperLink>
                            </p>
                        </div>
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
        document.getElementById('formForgotPassword').addEventListener('submit', function (event) {
            // Add the 'was-validated' class to the form
            this.classList.add('was-validated');

            // Validate the form
            if (!this.checkValidity()) {
                // If the form is not valid, prevent submission
                event.preventDefault();
                event.stopPropagation();
            }
        });
    </script>
</body>
</html>
