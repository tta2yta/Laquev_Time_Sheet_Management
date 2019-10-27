<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm10.aspx.cs" Inherits="Laquev_Time_Sheet_Management.WebForm10" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 924px" >

        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Work Wealth Efficiency For Staff Members<br />
        <br />
        <br />
        <br />
&nbsp;&nbsp;
        <rsweb:ReportViewer ID="rv1" runat="server" style="z-index: 1; left: 395px; top: 257px; position: absolute; height: 651px; width: 744px; margin-top: 0px;" Font-Names="Verdana" Font-Size="8pt" OnLoad="rv1_Load" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportEmbeddedResource="Laquev_Time_Sheet_Management.Report3.rdlc" ReportPath="C:\Users\tedrost\Desktop\Tedros\Laquev_Time_Sheet_Management\Report3.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="efficiency" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="Laquev_timesheet_managementDataSet4TableAdapters.efficiencyviewTableAdapter"></asp:ObjectDataSource>

    </div>
</asp:Content>
