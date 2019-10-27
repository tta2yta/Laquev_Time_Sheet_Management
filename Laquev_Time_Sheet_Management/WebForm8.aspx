<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm8.aspx.cs" Inherits="Laquev_Time_Sheet_Management.WebForm8" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 708px">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" style="z-index: 1; left: 149px; top: 225px; position: absolute" Text="Button" />
        <br />
  
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" style="z-index: 1; left: 376px; top: 200px; position: absolute; height: 532px; width: 798px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" OnLoad="ReportViewer1_Load">
        <LocalReport ReportEmbeddedResource="Laquev_Time_Sheet_Management.Report2.rdlc" ReportPath="C:\Users\tedrost\Desktop\Tedros\Laquev_Time_Sheet_Management\Report2.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
    </div>
   
      
   
    <br />
    <br />
    <br />
    <br />
   
      
   
</asp:Content>
