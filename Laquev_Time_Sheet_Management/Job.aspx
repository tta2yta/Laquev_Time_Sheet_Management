<%@ Page Title="Jop Page" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Job.aspx.cs" Inherits="Laquev_Time_Sheet_Management.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style7 {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 703px; margin-top: 0px">

        <div style="z-index: 1; left: 306px; top: 311px; position: absolute; height: 234px; width: 315px; background-color: #FFFFCC;">
&nbsp;<span class="auto-style7"><strong>Adding A New Job<br /></strong>   </span>
            <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 17px; top: 128px; position: absolute" Text="Remark"></asp:Label>
         
            <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 21px; top: 35px; position: absolute" Text="Job Name"></asp:Label>
            

            <asp:TextBox ID="txtname" runat="server" style="z-index: 1; left: 109px; top: 28px; position: absolute; height: 23px; width: 194px"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 4px; top: 82px; position: absolute; height: 19px" Text="Nakfa Per Hour"></asp:Label>
            <asp:TextBox ID="txthour" runat="server" style="z-index: 1; left: 109px; top: 78px; position: absolute; height: 20px"></asp:TextBox>
            <asp:TextBox ID="txtremark" runat="server" style="z-index: 1; left: 105px; top: 123px; position: absolute"></asp:TextBox>
            

            <asp:Button ID="btnclr" runat="server" style="z-index: 1; left: 79px; top: 171px; position: absolute; width: 75px" Text="Clear" OnClick="btnclr_Click" />
            <asp:Button ID="btnadd" runat="server" style="z-index: 1; left: 181px; top: 170px; position: absolute; width: 75px; height: 26px;" Text="Add" OnClick="btnadd_Click" />
            

        </div>

        <div style="z-index: 1; left: 645px; top: 311px; position: absolute; height: 230px; width: 315px; background-color: #FFFFCC;">
            &nbsp;<span class="auto-style7"><strong>Updating Job Information<br /></strong></span>
         
            <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 24px; top: 35px; position: absolute" Text="Select A Job"></asp:Label>
            

            <asp:Button ID="btnupd" runat="server" style="z-index: 1; left: 132px; top: 115px; position: absolute; width: 75px" Text="Update" OnClick="btnupd_Click" />
            <asp:DropDownList ID="dropjop" runat="server" style="z-index: 1; left: 120px; top: 33px; position: absolute; height: 23px; width: 162px" AutoPostBack="True" OnSelectedIndexChanged="dropjop_SelectedIndexChanged">
            </asp:DropDownList>
            
        </div>

    &nbsp;<br />
&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" style="z-index: 1; left: 778px; top: 196px; position: absolute; height: 19px; width: 43px">Logout</asp:LinkButton>
        <div style="height: 36px; width: 625px; background-color: #FFFFFF; margin-top: 36px; margin-left: 28px;">
            <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Enabled="False" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" StaticSubMenuIndent="10px" style="z-index: 1; left: 394px; top: 148px; position: absolute; height: 33px; width: 76px">
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <Items>
                    <asp:MenuItem Text="File" Value="Home"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#507CD1" />
            </asp:Menu>
            <asp:Menu ID="Menu2" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Enabled="False" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Orientation="Horizontal" StaticSubMenuIndent="10px" style="z-index: 1; left: 486px; top: 149px; position: absolute; height: 33px; width: 76px">
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <Items>
                    <asp:MenuItem Text="Catalog" Value="Home">
                        <asp:MenuItem Text="Staffing Operation" Value="Staffing Operation" NavigateUrl="~/Staffing.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Job Operatiopn" Value="Job Operatiopn" NavigateUrl="~/Job.aspx"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Realtimestaff.aspx" Text="Real Time Staffs" Value="Real Time Staffs"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#507CD1" />
            </asp:Menu>
            <asp:Menu ID="Menu3" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" StaticSubMenuIndent="10px" style="z-index: 1; left: 298px; top: 149px; position: absolute; height: 32px; width: 76px">
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <Items>
                    <asp:MenuItem Text="Home" Value="Home"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#507CD1" />
            </asp:Menu>
            <asp:Menu ID="Menu4" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Enabled="False" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" StaticSubMenuIndent="10px" style="z-index: 1; left: 585px; top: 150px; position: absolute; height: 32px; width: 76px; right: 227px;">
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <Items>
                    <asp:MenuItem Text="Record Time" Value="Record Time"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#507CD1" />
            </asp:Menu>
            <asp:Menu ID="Menu5" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Enabled="False" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" StaticSubMenuIndent="10px" style="z-index: 1; left: 685px; top: 149px; position: absolute; height: 33px; width: 76px">
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <Items>
                    <asp:MenuItem Text="Report" Value="Report"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#507CD1" />
            </asp:Menu>
        </div>
        <br />
        <br />
        <br />

        <asp:Label ID="Label6" runat="server" style="z-index: 1; top: 517px; position: absolute; height: 27px; width: 255px; left: 353px"></asp:Label>

    </div>
</asp:Content>
