<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="Laquev_Time_Sheet_Management.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging"
             AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="None"
             BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowCommand="GridView1_RowCommand"
             Caption="GRIDVIEW EXAMPLE" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"
             OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Height="348px"
             ShowFooter="True" Width="767px">
             <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
             <Columns>
                 <asp:TemplateField HeaderText="EMP_ID" Visible="false">
                     <ItemTemplate>
                         <asp:Label ID="lblemp_id" runat="server" Text='<%#Eval("emp_id") %>'></asp:Label>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:Label ID="lbl_edit" runat="server" Text='<%# Eval("emp_id") %>'></asp:Label>
                     </EditItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="FirstName">
                     <ItemTemplate>
                         <asp:Label ID="lblfname" runat="server" Text='<%#Eval("fname") %>'></asp:Label>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:TextBox ID="txt_fname" runat="server" Text='<%# Eval("fname") %>'></asp:TextBox>
                         &nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_fname"
                             ErrorMessage="*" ValidationGroup="update1"></asp:RequiredFieldValidator>
                     </EditItemTemplate>
                     <FooterTemplate>
                         <asp:TextBox ID="txtf_fname" runat="server" Width="128px"></asp:TextBox>
                         &nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtf_fname"
                             ErrorMessage="*" ValidationGroup="submit"></asp:RequiredFieldValidator>
                     </FooterTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="LastName">
                     <ItemTemplate>
                         <asp:Label ID="lblname" runat="server" Text='<%#Eval("lname") %>'></asp:Label>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:TextBox ID="txt_lname" runat="server" Text='<%# Eval("lname") %>'></asp:TextBox>
                         &nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_lname"
                             ErrorMessage="*" ValidationGroup="update1"></asp:RequiredFieldValidator>
                     </EditItemTemplate>
                     <FooterTemplate>
                         <asp:TextBox ID="txtf_lname" runat="server"></asp:TextBox>
                         &nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtf_lname"
                             ErrorMessage="*" ValidationGroup="submit"></asp:RequiredFieldValidator>
                     </FooterTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Address">
                     <ItemTemplate>
                         <asp:Label ID="lbladdress" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:TextBox ID="txt_address" runat="server" Text='<%# Eval("address") %>'></asp:TextBox>
                         &nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_address"
                             ErrorMessage="*" ValidationGroup="update1"></asp:RequiredFieldValidator>
                     </EditItemTemplate>
                     <FooterTemplate>
                         <asp:TextBox ID="txtf_address" runat="server"></asp:TextBox>
                         &nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtf_address"
                             ErrorMessage="*" ValidationGroup="submit"></asp:RequiredFieldValidator>
                     </FooterTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField Visible="false">
                     <ItemTemplate>
                         <asp:Label ID="lblcon" runat="server" Text='<%#Eval("country1") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Country">
                     <ItemTemplate>
                         <asp:Label ID="lblcountry" runat="server" Text='<%#Eval("country") %>'></asp:Label>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:DropDownList ID="drp_country" runat="server" OnSelectedIndexChanged="drp_country_SelectedIndexChanged"
                             AutoPostBack="true">
                         </asp:DropDownList>
                         &nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="drp_country"
                             ErrorMessage="*" InitialValue="0" ValidationGroup="update1"></asp:RequiredFieldValidator>
                     </EditItemTemplate>
                     <FooterTemplate>
                         <asp:DropDownList ID="footer_country" runat="server" AutoPostBack="True" OnSelectedIndexChanged="footer_country_SelectedIndexChanged">
                         </asp:DropDownList>
                         &nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="footer_country"
                             ErrorMessage="*" InitialValue="0" ValidationGroup="submit"></asp:RequiredFieldValidator>
                         &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="footer_country"
                             ErrorMessage="*" InitialValue="0" ValidationGroup="submit"></asp:RequiredFieldValidator>
                     </FooterTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField Visible="false">
                     <ItemTemplate>
                         <asp:Label ID="lblstcon" runat="server" Text='<%#Eval("state1") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="City">
                     <ItemTemplate>
                         <asp:Label ID="lblcity" runat="server" Text='<%#Eval("city") %>'></asp:Label>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:DropDownList ID="drp_city" runat="server" AutoPostBack="true">
                         </asp:DropDownList>
                         &nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="drp_city"
                             ErrorMessage="*" ValidationGroup="update1"></asp:RequiredFieldValidator>
                     </EditItemTemplate>
                     <FooterTemplate>
                         <asp:DropDownList ID="footer_city" runat="server">
                         </asp:DropDownList>
                         &nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="footer_city"
                             ErrorMessage="*" InitialValue="0" ValidationGroup="submit"></asp:RequiredFieldValidator>
                         &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="footer_city"
                             ErrorMessage="*" InitialValue="0" ValidationGroup="submit"></asp:RequiredFieldValidator>
                     </FooterTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="ContactNo">
                     <ItemTemplate>
                         <asp:Label ID="lblcontactno" runat="server" Text='<%#Eval("contactno") %>'></asp:Label>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:TextBox ID="txt_contactno" runat="server" Text='<%# Eval("contactno") %>'></asp:TextBox>
                         &nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_contactno"
                             ErrorMessage="*" ValidationExpression="\d{10}" ValidationGroup="update1"></asp:RegularExpressionValidator>
                     </EditItemTemplate>
                     <FooterTemplate>
                         <asp:TextBox ID="txtf_contactno" runat="server"></asp:TextBox>
                         &nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtf_contactno"
                             ErrorMessage="*" ValidationExpression="\d{10}" ValidationGroup="submit"></asp:RegularExpressionValidator>
                         &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtf_contactno"
                             ErrorMessage="*" ValidationGroup="submit"></asp:RequiredFieldValidator>
                     </FooterTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Email_ID">
                     <ItemTemplate>
                         <asp:Label ID="lblemailid" runat="server" Text='<%#Eval("emailid") %>'></asp:Label>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:TextBox ID="txt_id" runat="server" Text='<%# Eval("emailid") %>'></asp:TextBox>
                         &nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_id"
                             ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                             ValidationGroup="update1"></asp:RegularExpressionValidator>
                     </EditItemTemplate>
                     <FooterTemplate>
                         <asp:TextBox ID="txtf_emailid" runat="server"></asp:TextBox>
                         &nbsp;
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtf_emailid"
                             ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                             ValidationGroup="submit"></asp:RegularExpressionValidator>
                         &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtf_emailid"
                             ErrorMessage="*" ValidationGroup="submit"></asp:RequiredFieldValidator>
                     </FooterTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Delete">
                     <ItemTemplate>
                         <asp:LinkButton ID="LinkButton2" runat="server" CommandName="deleteitem" CommandArgument='<%# Eval("emp_id") %>'
                             CausesValidation="False">Delete</asp:LinkButton>
                     </ItemTemplate>
                     <FooterTemplate>
                         <asp:Button ID="btn_add" runat="server" Text="Insert" OnClick="btn_add_Click" ValidationGroup="submit" />
                     </FooterTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Edit IN Gridview">
                     <ItemTemplate>
                         <asp:LinkButton ID="LinkButton3" runat="server" CommandName="edit" ValidationGroup="update">Edit</asp:LinkButton>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:LinkButton ID="LinkButton4" runat="server" CommandName="update" ValidationGroup="update1">update</asp:LinkButton>
                         &nbsp;<asp:LinkButton ID="LinkButton5" runat="server" CommandName="cancel">cencel</asp:LinkButton>
                     </EditItemTemplate>
                 </asp:TemplateField>
             </Columns>
             <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
             <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
             <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
             <AlternatingRowStyle BackColor="#DCDCDC" />
         </asp:GridView>
    </div>
    </form>
</body>
</html>
