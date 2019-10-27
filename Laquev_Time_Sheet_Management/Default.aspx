<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Laquev_Time_Sheet_Management._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" OnRowEditing="GridView1_RowEditing" style="z-index: 1; left: 10px; top: 15px; position: absolute; height: 143px; width: 356px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdated="GridView1_RowUpdated" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnRowCommand="GridView1_RowCommand" ShowFooter="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>

                            <asp:Label ID="EmpID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Staff_id") %>'></asp:Label>

                        </ItemTemplate>

                        
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name">
                    <ItemTemplate>

                            <asp:Label ID="lblName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Fname") %>'></asp:Label>

                        </ItemTemplate>

                       
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name">
                    <ItemTemplate>

                            <asp:Label ID="lblEmpID1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Lname") %>'></asp:Label>

                        </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Profession">
                    <ItemTemplate>

                            <asp:Label ID="lblEmpID2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Profession") %>'></asp:Label>

                        </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
                <asp:TemplateField HeaderText="date">
                <ItemTemplate>         

                            <asp:TextBox ID="txtEditName" runat="server" Text="" AutoPostBack="False"></asp:TextBox>            

                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Time">
                    <ItemTemplate>         

                            <asp:TextBox ID="txtEditName1" runat="server" Text="" AutoPostBack="False"></asp:TextBox>            

                        </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Week Id">
                    <ItemTemplate>         

                            <asp:TextBox ID="txtEditName2" runat="server" Text="" AutoPostBack="False"></asp:TextBox>            

                        </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Day Status">
                    <ItemTemplate>         

                            <asp:TextBox ID="txtEditName3" runat="server" Text="" AutoPostBack="False"></asp:TextBox>            

                        </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status"></asp:TemplateField>
               
                <asp:TemplateField HeaderText="Action">
                     <ItemTemplate>
                   <asp:Button ID="btn_add"  CommandName="ADDd" runat="server" Text="ADD" OnClick="btn_add_Click"  ValidationGroup="submit" />
                 </ItemTemplate>
                     <FooterTemplate>

                           <asp:LinkButton ID="lbAdd" runat="server" CommandName="ADD" Text="Add" Width="100px"></asp:LinkButton> 

                        </FooterTemplate>

                </asp:TemplateField>
               
            </Columns>
            <EmptyDataTemplate>
                <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 21px; top: 66px; position: absolute" Text="Label"></asp:Label>
            </EmptyDataTemplate>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    
    </div>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 109px; top: 269px; position: absolute; width: 181px" Text="Label"></asp:Label>
        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 25px; top: 399px; position: absolute; height: 345px; width: 516px">
            <asp:Calendar ID="Calendar1" runat="server" style="z-index: 1; left: 0px; top: -1px; position: absolute; height: 188px; width: 259px" BackColor="White" BorderColor="White" BorderWidth="1px" FirstDayOfWeek="Monday" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" SelectedDate="09/26/2014 06:27:22" Width="350px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
            <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 339px; top: 101px; position: absolute; height: 23px" Text="Button" OnClick="Button1_Click" />
            <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 284px; top: 37px; position: absolute; width: 192px"></asp:TextBox>
        </asp:Panel>
    </form>
</body>
</html>
