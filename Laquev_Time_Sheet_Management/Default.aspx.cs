using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Laquev_Time_Sheet_Management
{
    public partial class _Default : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=DB;Initial Catalog=Laquev_timesheet_management;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindData();

            }

        }
        protected void BindData()
        {

            DataSet ds = new DataSet();

            DataTable FromTable = new DataTable();

            conn.Open();

            string cmdstr = "Select * from tblStaff_info";

            SqlCommand cmd = new SqlCommand(cmdstr, conn);

            SqlDataAdapter adp = new SqlDataAdapter(cmd);

            adp.Fill(ds);

            cmd.ExecuteNonQuery();

            FromTable = ds.Tables[0];

            if (FromTable.Rows.Count > 0)
            {

                GridView1.DataSource = FromTable;

                GridView1.DataBind();

            }

            else
            {

                FromTable.Rows.Add(FromTable.NewRow());

                GridView1.DataSource = FromTable;

                GridView1.DataBind();

                int TotalColumns = GridView1.Rows[0].Cells.Count;

                GridView1.Rows[0].Cells.Clear();

                GridView1.Rows[0].Cells.Add(new TableCell());

                GridView1.Rows[0].Cells[0].ColumnSpan = TotalColumns;

                GridView1.Rows[0].Cells[0].Text = "No records Found";

            }

            ds.Dispose();

            conn.Close();

        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridView1.EditIndex = -1;

            BindData();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;

            BindData();
            
        }

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;

            BindData();
            
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label2.Text = GridView1.Rows[0].Cells[0].Text;
           
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Label2.Text = GridView1.Rows[e.NewSelectedIndex].Cells[e.NewSelectedIndex].Text;
            if (GridView1.Rows[e.NewSelectedIndex].Cells[4].Text == "")
            {
            }
            GridView1.Rows[e.NewSelectedIndex].Cells [5].Text=DateTime .Now .ToShortDateString ();
            GridView1.Rows[e.NewSelectedIndex].Cells[6].Text = DateTime.Now.ToShortTimeString ();
            GridView1.Rows[e.NewSelectedIndex].Cells[7].Text = DateTime.Now.DayOfWeek.ToString  () ;
           // GridView1.Rows[e.NewSelectedIndex].Cells[8].Text = DateTime.Now.ToString();
            DateTime dd = new DateTime();
           
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
             //if (e.CommandName.Equals("ADDd"))

           // {
               // Label2.Text = e.CommandName .ToString ();
            //}
        }
        protected void btn_add_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
            Label2.Text = "yes";
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool ch = Regex.Match(TextBox2.Text, @"^([1-3][0-9]/[1-9]/\d\d\d\d)$|^([1-3][0-9]/[0-1][0-2]/\d\d\d\d)$|^([1-9]/[1-9]/\d\d\d\d)$|^([1-9]/[0-1][0-2]/\d\d\d\d)$").Success;
            if (ch == true)
            {
               
                Label2.Text ="cool";
            }
                else
                {
                    Label2.Text ="no";
                }
            }
        }
       
    }
