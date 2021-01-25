<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="AS_Assignment.Success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 146px;
        }
        .auto-style3 {
            width: 146px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">User Profile</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">User ID:</td>
                <td>
            <asp:Label ID="lbl_userID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Card number:</td>
                <td class="auto-style4">
            <asp:Label ID="lbl_cc" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Expiration Date:</td>
                <td>
            <asp:Label ID="lbl_ed" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">CVV: </td>
                <td>
            <asp:Label ID="lbl_cvv" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="logout" runat="server" OnClick="logout_Click" Text="logout" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
