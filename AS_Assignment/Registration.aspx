<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AS_Assignment.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>

    <script type="text/javascript">
        function validate() {
            var str = document.getElementById('<%=tb_pwd.ClientID %>').value;
            if (str.length < 8) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password length must be at least 8 characters long";
                document.getElementById("lbl_pwdchecker").style.color = "red";
                return ("Too short");
            }

            else if (str.search(/[0-9]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password reauire at least 1 number";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_number");
            }

            else if (str.search(/[A-Z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password reauire at least 1 upppercase letter";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_uppercase letter");
            }

            else if (str.search(/[a-z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password reauire at least 1 lowercase letter";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_lowercase letter");
            }

            else if (str.search(/[^a-zA-Z0-9]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password reauire at least 1 special character";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_special character");
            }


            document.getElementById("lbl_pwdchecker").innerHTML = "Excellent!";
            document.getElementById("lbl_pwdchecker").style.color = "Blue";

        }
    </script>

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 45px;
        }
        .auto-style3 {
            height: 30px;
        }
        .auto-style4 {
            height: 44px;
        }
        .auto-style5 {
            width: 128px;
        }
        .auto-style6 {
            height: 30px;
            width: 128px;
        }
        .auto-style7 {
            height: 45px;
            width: 128px;
        }
        .auto-style8 {
            height: 44px;
            width: 128px;
        }
        .auto-style9 {
            width: 128px;
            height: 26px;
        }
        .auto-style10 {
            height: 26px;
        }
        .auto-style11 {
            width: 128px;
            height: 27px;
        }
        .auto-style12 {
            height: 27px;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">First Name:</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="tb_firstname" runat="server" Width="214px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_firstname" ErrorMessage="First name is empty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Last name:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="tb_lastname" runat="server" Width="214px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_lastname" ErrorMessage="Last name is empty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">Date of Birth:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="tb_dob" runat="server" Width="214px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb_dob" ErrorMessage="Date of birth is empty " ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">Email Address:</td>
                    <td>
                        <asp:TextBox ID="tb_userid" runat="server" Width="214px" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_userid" ErrorMessage="Email is empty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Password:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="tb_pwd" runat="server" Width="214px" onkeyup="javascript:validate()" TextMode="Password"></asp:TextBox>
                        <asp:Label ID="lbl_pwdchecker" runat="server" ForeColor="Red"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tb_pwd" ErrorMessage="Password is empty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Re-Enter Password</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="tb_cfpwd" runat="server" Width="214px" onkeyup="javascript:validate()" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tb_cfpwd" ErrorMessage="Password is empty" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tb_pwd" ControlToValidate="tb_cfpwd" ErrorMessage="Password is not the same" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">Credit Card Info:</td>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Card Number"></asp:Label>
                        <br />
                        <asp:TextBox ID="tb_cc" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_cc" ErrorMessage="Card Number is empty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8"></td>
                    <td class="auto-style4">
                        <asp:Label ID="Label2" runat="server" Text="Expiration Date"></asp:Label>
                        <br />
                        <asp:TextBox ID="tb_ed" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tb_ed" ErrorMessage="Expiration date is empty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="CVV"></asp:Label>
                        <br />
                        <asp:TextBox ID="tb_cvv" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tb_cvv" ErrorMessage="CVV is empty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style3">
                        <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="Submit" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
