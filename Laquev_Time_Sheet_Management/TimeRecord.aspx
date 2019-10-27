<%@ Page Title="Time Recording Page" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TimeRecord.aspx.cs" Inherits="Laquev_Time_Sheet_Management.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style7 {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 1028px"> 
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
                        <asp:MenuItem Text="Job Operatiopn" Value="Job Operatiopn"></asp:MenuItem>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" style="z-index: 1; left: 737px; top: 263px; position: absolute">Logout</asp:LinkButton>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 699px; top: 228px; position: absolute; width: 136px;" Text="Please Select Date"></asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" SelectedDate="10/09/2014 21:45:44" style="z-index: 1; left: 822px; top: 170px; position: absolute; height: 188px; width: 259px" VisibleDate="2014-10-09" Width="350px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style7"><strong>Currently Time Recording Operation<br />
       
        </strong></span> 
         <br />
        <br />
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"  style="z-index: 1; left: 309px; top: 383px; position: absolute; height: 143px; width: 356px" OnRowCommand="GridView1_RowCommand" ShowFooter="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnRowEditing="GridView1_RowEditing1" OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="GridView1_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>

                            <asp:Label ID="staffid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Staff_id") %>'></asp:Label>

                        </ItemTemplate>

                        
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name">
                    <ItemTemplate>

                            <asp:Label ID="lblfName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Fname") %>'></asp:Label>

                        </ItemTemplate>

                       
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name">
                    <ItemTemplate>

                            <asp:Label ID="lblname" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Lname") %>'></asp:Label>

                        </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Profession">
                    <ItemTemplate>

                            <asp:Label ID="lblProfession" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Profession") %>'></asp:Label>

                        </ItemTemplate>
                    
                    
                </asp:TemplateField>
               
                <asp:CommandField EditText="select" HeaderText="select" ShowCancelButton="False" ShowEditButton="True" UpdateText="" />
               
                <asp:TemplateField HeaderText="date">
                <ItemTemplate>  
                     <asp:Label ID="lblDate" Text='<%#(DateTime .Now  .ToShortDateString () ) %>' runat="server" ></asp:Label>       
               </ItemTemplate> 
                    <EditItemTemplate >
                            <asp:TextBox ID="Date" runat="server" Text='<%#(DateTime .Now .ToShortDateString () ) %>' AutoPostBack="True" ReadOnly="true"></asp:TextBox>            
                       </EditItemTemplate>
                        
                    <FooterTemplate>

                        <asp:TextBox ID="txtdate" runat="server" ReadOnly ="true" ></asp:TextBox>
                        

                    </FooterTemplate>

                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Time">
                     <ItemTemplate>  
                     <asp:Label ID="lbltime" Text='<%#(DateTime .Now .ToShortTimeString  ()) %>' runat="server" ></asp:Label>       
               </ItemTemplate> 
                    <EditItemTemplate >
                            <asp:TextBox ID="time" runat="server" Text='<%#(DateTime .Now .ToShortTimeString  ()) %>' AutoPostBack="True" ReadOnly="true"></asp:TextBox>            
                       </EditItemTemplate>
                      <FooterTemplate>

                            <asp:TextBox ID="txttime" runat="server" text="00:00" ReadOnly ="true" ></asp:TextBox>

                        </FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Week Id">
                    <ItemTemplate>  
                     <asp:Label ID="lblweek" Text='<%#(DateTime.Now .DayOfWeek.ToString ())%>' runat="server" ></asp:Label>       
               </ItemTemplate> 
                    <EditItemTemplate >
                            <asp:TextBox ID="week" runat="server" Text='<%#(DateTime.Now .DayOfWeek.ToString ())%>' AutoPostBack="True" ReadOnly="true"></asp:TextBox>            
                       </EditItemTemplate>
                      <FooterTemplate>

                            <asp:TextBox ID="txtweek" runat="server" ReadOnly ="true" ></asp:TextBox>

                        </FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Day Status">
                     <ItemTemplate>  
                     <asp:Label ID="lblDay" Text="Normal" runat="server" ></asp:Label>       
               </ItemTemplate> 
                    <EditItemTemplate >
                            <asp:TextBox ID="Day" runat="server" Text='<%#("Normal")%>'> AutoPostBack="True" ReadOnly="true"></asp:TextBox>            
                       </EditItemTemplate>
                      <FooterTemplate>

                            <asp:TextBox ID="txtdaystatus" runat="server" ></asp:TextBox>

                        </FooterTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                     <ItemTemplate>
                         <asp:Label ID="lblitemstatus" runat="server" Text=""></asp:Label>
                     </ItemTemplate>
                          <EditItemTemplate >
                            <asp:Label ID="lblstatus" runat="server" Text=""></asp:Label>
</EditItemTemplate>
                        
                    <FooterTemplate>

                            <asp:Button ID="btn1_add"  CommandName="ADDd" runat="server" Text="ADD" OnClick="btn1_add_Click"  ValidationGroup="submit" />

                        </FooterTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Action">
                     <ItemTemplate>
                   <asp:Button ID="btn_add"  CommandName="ADD" runat="server" Text="ADD" OnClick="btn1_add_Click"  ValidationGroup="submit" />
                 </ItemTemplate>
                      

                </asp:TemplateField>
               
            </Columns>
            <EditRowStyle BackColor="Red" />
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
</asp:Content>
