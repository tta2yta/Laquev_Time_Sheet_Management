<%@ Page Title="Staffing Page" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Staffing.aspx.cs" Inherits="Laquev_Time_Sheet_Management.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style7 {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 707px; margin-top: 0px;">

        <div style="height: 36px; width: 625px; background-color: #FFFFFF; margin-top: 36px; margin-left: 28px;">
            <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Enabled="False" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" StaticSubMenuIndent="10px" style="z-index: 1; left: 393px; top: 149px; position: absolute; height: 33px; width: 76px">
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
                        <asp:MenuItem Text="Staffing Operation" Value="Staffing Operation"></asp:MenuItem>
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
      <asp:Panel ID="Panel1" runat="server" BackColor="#FFFFCC" style="z-index: 1; left: 284px; top: 260px; position: absolute; height: 509px; width: 415px">
          <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 26px; top: 45px; position: absolute; right: 275px" Text="Enter First Name"></asp:Label>
          <asp:TextBox ID="txtfname" runat="server" style="z-index: 1; left: 143px; top: 46px; position: absolute; height: 20px; width: 230px;"></asp:TextBox>
          <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 23px; top: 87px; position: absolute; width: 121px; height: 19px;" Text="Enter Last Name"></asp:Label>
          <asp:TextBox ID="txtlname" runat="server" style="z-index: 1; left: 146px; top: 87px; position: absolute; width: 225px" TabIndex="1"></asp:TextBox>
          <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 64px; top: 142px; position: absolute" Text="Sex"></asp:Label>
          <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" style="z-index: 1; left: 150px; top: 138px; position: absolute; width: 57px" Text="Male" GroupName="one" TabIndex="2" />
          <asp:RadioButton ID="RadioButton2" runat="server" style="z-index: 1; left: 235px; top: 138px; position: absolute; height: 24px;" Text="Female" GroupName="one" />
          <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 45px; top: 210px; position: absolute" Text="Joining Date"></asp:Label>
          <asp:TextBox ID="txtdate" runat="server" style="z-index: 1; left: 149px; top: 207px; position: absolute; width: 186px" TabIndex="4"></asp:TextBox>
          <asp:TextBox ID="txtphone" runat="server" style="z-index: 1; left: 142px; top: 244px; position: absolute; width: 209px" TabIndex="5"></asp:TextBox>
          <asp:TextBox ID="txtaddress" runat="server" style="z-index: 1; left: 144px; top: 288px; position: absolute; width: 203px" TabIndex="6"></asp:TextBox>
          <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 6px; top: 244px; position: absolute" Text="Enter Phone Number"></asp:Label>
          <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 81px; top: 289px; position: absolute" Text="Address"></asp:Label>
          <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 42px; top: 329px; position: absolute" Text="Proffesion/Job"></asp:Label>
          <asp:DropDownList ID="dropjob" runat="server" style="z-index: 1; left: 148px; top: 330px; position: absolute; width: 173px" TabIndex="7">
          </asp:DropDownList>
          <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 7px; top: 373px; position: absolute; height: 18px; width: 127px" Text="Working Hours Per day"></asp:Label>
          <asp:TextBox ID="txthour" runat="server" style="z-index: 1; left: 145px; top: 376px; position: absolute; width: 133px" TabIndex="8"></asp:TextBox>
          <asp:Button ID="btnclr" runat="server" style="z-index: 1; left: 130px; top: 439px; position: absolute; width: 67px; height: 27px;" Text="Clear" OnClick="btnclr_Click" />
          <asp:Button ID="btnadd" runat="server" style="z-index: 1; left: 218px; top: 439px; position: absolute; height: 26px; width: 67px; " Text="Add" OnClick="btnadd_Click" />
          <asp:TextBox ID="txtage" runat="server" style="z-index: 1; left: 160px; top: 169px; position: absolute" SkinID="op" TabIndex="3"></asp:TextBox>
          <asp:Label ID="Label9" runat="server" style="z-index: 1; left: 69px; top: 167px; position: absolute; width: 62px; height: 19px" Text="Age"></asp:Label>
      </asp:Panel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Adding New Staff Member</strong><div style="z-index: 1; left: 709px; top: 345px; position: absolute; height: 226px; width: 315px; background-color: #FFFFCC;">
          <asp:DropDownList ID="dropprofession" runat="server" style="z-index: 1; left: 7px; top: 67px; position: absolute; height: 17px; width: 148px" AutoPostBack="True" OnSelectedIndexChanged="dropprofession_SelectedIndexChanged" OnLoad="dropprofession_Load">
              <asp:ListItem>Select</asp:ListItem>
          </asp:DropDownList>
          <asp:DropDownList ID="dropstaff" runat="server" style="z-index: 1; left: 177px; top: 65px; position: absolute; height: 16px; width: 119px" AutoPostBack="True" OnSelectedIndexChanged="dropstaff_SelectedIndexChanged">
          </asp:DropDownList>
          <asp:Button ID="btnupd" runat="server" style="z-index: 1; left: 58px; top: 141px; position: absolute; width: 75px; height: 27px;" Text="Update" OnClick="btnupd_Click" />
          <asp:Button ID="btndel" runat="server" style="z-index: 1; left: 160px; top: 141px; position: absolute; height: 26px; width: 75px;" Text="Delete" OnClick="btndel_Click" />
&nbsp;<span class="auto-style7"><strong>Updating Staff Identity Information<br />
         
          </strong></span>
     <br />
          Select Profession&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select&nbsp; Staff&nbsp;&nbsp;
      </div>

        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" style="z-index: 1; left: 761px; top: 202px; position: absolute">Logout</asp:LinkButton>

      <br />

        <asp:Label ID="Label10" runat="server" style="z-index: 1; left: 361px; top: 741px; position: absolute; width: 289px"></asp:Label>

  </div>
</asp:Content>
