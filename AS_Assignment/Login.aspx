<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AS_Assignment.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <script src="https://www.google.com/recaptcha/api.js?render=6LfeQzsaAAAAAIkEjg32oQkQzyOBZtkLA0DCx4AH"></script>

    <script>
        grecaptcha.ready(function () { grecaptcha.execute(' SITE KEY ', { action: 'Login' }).then(function (token) {document.getElementById("g-recaptcha-response").value = token;}); });
    </script>


    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 84px;
        }
        .auto-style3 {
            width: 84px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 84px;
            height: 27px;
        }
        .auto-style6 {
            height: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Email:</td>
                    <td>
                        <asp:TextBox ID="tb_userid" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password:</td>
                    <td>
                        <asp:TextBox ID="tb_pwd" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style4">
                        <asp:Button ID="btn_login" runat="server" OnClick="btn_login_Click" Text="Submit" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">
                        <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response"/>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Label ID="lblmessage" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" PostBackUrl="~/Registration.aspx" Text="Create New Account" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
