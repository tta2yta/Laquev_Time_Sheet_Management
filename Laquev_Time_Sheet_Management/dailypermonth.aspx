<%@ Page Title="Daily Per Month Report" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dailypermonth.aspx.cs" Inherits="Laquev_Time_Sheet_Management.WebForm8" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 708px">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div style="height: 36px; width: 625px; background-color: #FFFFFF; margin-top: 36px; margin-left: 28px;">
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" SelectedDate="10/09/2014 21:43:22" style="z-index: 1; left: 770px; top: 200px; position: absolute; height: 188px; width: 259px" VisibleDate="2014-10-09" Width="350px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
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
                        <asp:MenuItem NavigateUrl="~/Job.aspx" Text="Job Operatiopn" Value="Job Operatiopn"></asp:MenuItem>
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
                    <asp:MenuItem Text="Report" Value="Report">
                        <asp:MenuItem NavigateUrl="~/dailypermonth.aspx" Text="Dialy Per Month" Value="Dialy Per Month"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/efficiencyreport.aspx" Text="Efficiency" Value="Efficiency"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#507CD1" />
            </asp:Menu>
        </div>
        <br />
  
    <rsweb:ReportViewer ID="rv1" runat="server" Font-Names="Verdana" Font-Size="8pt" style="z-index: 1; left: 429px; top: 430px; position: absolute; height: 532px; width: 798px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" OnLoad="ReportViewer1_Load">
        <LocalReport ReportEmbeddedResource="Laquev_Time_Sheet_Management.Report4.rdlc" ReportPath="C:\Users\tedrost\Desktop\Tedros\Laquev_Time_Sheet_Management\Report4.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
        <%--<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="Laquev_timesheet_managementDataSet9TableAdapters.report1TableAdapter"></asp:ObjectDataSource>--%>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" style="z-index: 1; left: 292px; top: 410px; position: absolute; width: 91px">Load Report</asp:LinkButton>
        <asp:Label ID="Label1" runat="server" Font-Size="Large" style="z-index: 1; left: 437px; top: 383px; position: absolute; font-weight: 700; text-decoration: underline" Text="Daily working hours of a staff member"></asp:Label>
        <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="Laquev_timesheet_managementDataSet6TableAdapters.report1TableAdapter" OnSelecting="ObjectDataSource1_Selecting"></asp:ObjectDataSource>--%>
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" style="z-index: 1; left: 667px; top: 241px; position: absolute">Logout</asp:LinkButton>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 640px; top: 210px; position: absolute; width: 132px; text-decoration: underline" Text="Please select month"></asp:Label>
&nbsp;
        </div>
   
      
   
    <br />
    <br />
    <br />
    <br />
   
      
   
</asp:Content>
