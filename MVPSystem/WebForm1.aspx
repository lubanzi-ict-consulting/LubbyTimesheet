<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MVPSystem.WebForm1" %>

<%---
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
 <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
 <link href="style/styles.css" rel="stylesheet" />
 <title>Dashboard</title>
  <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<style>
    * {box-sizing: border-box;}

/* Style the input container */
.input-container {
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

/* Style the form icons */
.icon {
  padding: 10px;
  background: dodgerblue;
  color: white;
  min-width: 50px;
  text-align: center;
}

/* Style the input fields */
.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
  background-color: dodgerblue;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
</style>
<body>
    <form action="/action_page.php">
  <h2>Login Form</h2>
  <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="text" placeholder="Username" name="usrnm">
  </div>

  <div class="input-container">
    <i class="fa fa-envelope icon"></i>
    <input class="input-field" type="text" placeholder="Email" name="email">
  </div>

  <button type="submit" class="btn">Register</button>
</form>
</body>
</html>--%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
     
<style>
body {
  margin: 0;
  font-family: "Lato", sans-serif;
  background: linear-gradient(to left, #ff6600 0%, #ffcc00 100%);
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #ffffff;
  position: fixed;
  height: 100vh;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  /*background-color: #04AA6D;*/
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}



/* Dropdown container - needed to position the dropdown content */
/*.dropdown {
  float: left;
  overflow: hidden;
}*/

/* Style the dropdown button to fit inside the topnav */
/*.dropdown .dropbtn {
  font-size: 17px;
  border: none;
  outline: none;
  color: black;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}*/

/* Style the dropdown content (hidden by default) */
/*.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}*/

/* Style the links inside the dropdown */
/*.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}*/

/* Add a dark background on topnav links and the dropdown button on hover */
/*.topnav a:hover, .dropdown:hover .dropbtn {
  background-color: #555;
  color: white;
}*/

/* Add a grey background to dropdown links on hover */
/*.dropdown-content a:hover {
  background-color: #ddd;
  color: black;
}*/

/* Show the dropdown menu when the user moves the mouse over the dropdown button */
/*.dropdown:hover .dropdown-content {
  display: block;
}*/

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: black;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

h2 {
  overflow: hidden;
  background-color: #333;
  position: fixed;
  top: 0;
  width: 100%;
}

h2 a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

</style>
</head>
<body>
    <form id="form2" runat="server" style="position: relative; top: -10px;" >
<div class="sidebar">

     <a href="Dashboard.aspx" class="active">
      <i class="fas fa-home"></i>
      <span>Dashboard</span>
    </a>

  <a href="#news">News</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>

    <div class="dropdown">
    <button class="dropbtn">Project
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="CreateProject.aspx">Create Project</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
    </div>
  </div>
    <div class="dropdown">
    <button class="dropbtn">Employee 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="CreateEmployee.aspx">CreateEmployee.aspx</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
    </div>
  </div> 
    <div class="dropdown">
    <button class="dropbtn">Timesheet 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="CaptureTimesheet.aspx">Timesheet</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
    </div>
  </div> 

</div>

<div class="content">
  <%--<h2>Responsive Sidebar Example</h2>--%>
       <main class="contents">
           <center><h2>Create Project</h2></center>
            <center>
    <div class="sub-content" style="position: relative; left: -90px; margin-top: 80px;">
    <table class="container">
        <tr>
            <td>
                <asp:Label ID="lblProject" runat="server" Text="Project Name "></asp:Label><span style="color:red">*</span>
            </td>
            <td>
                <asp:TextBox ID="txtProjectName" runat="server" Height="35px" Width="350px" required></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="lblStartDate" runat="server" Text="Start Date"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblEndDate" runat="server" Text="End Date"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDuration" runat="server" Text="Duration"></asp:Label><span style="color:red">*</span>
            </td>
            <td class="date">
                <asp:TextBox ID="StartDate" runat="server" TextMode="Date" Height="35px" Width="100px" required></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="endDate" runat="server" TextMode="Date" Height="35px" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblClientName" runat="server" Text="Client Name"></asp:Label><span style="color:red">*</span>
            </td>
            <td>
                <asp:TextBox ID="txtClientName" runat="server" Height="35px" Width="350px" required></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" Height="35px" Width="100px" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="35px" Width="100px" />
                <asp:Button ID="btnView" runat="server" Text="View Page" Height="35px" Width="100px" />
                <%--<asp:Button ID="btnEdit" runat="server" Text="Edit" Height="35px" Width="100px" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" Height="35px" Width="100px" />--%>
            </td>
        </tr>
        <asp:Label ID="lblPopupMessage" runat="server" Text="" ForeColor="red"></asp:Label>
        
    </table>
</div>
    </center>
</div>
        </form>
</body>
</html>

<script>
    /* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>
