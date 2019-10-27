using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Laquev_Time_Sheet_Management
{
    public partial class WebForm9 : System.Web.UI.Page
    {

        LTSMDataContext db = new LTSMDataContext();

        public string conn = ConfigurationManager.ConnectionStrings["Laquev_timesheet_managementConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count > 0)
            {
                foreach (string key in Session.Keys)
                {
                    string str = Session[key].ToString();
                    if (str == "Personal")
                    {
                        Menu2.Enabled = true;
                    }
                    else
                    {
                        Response.Redirect("~/Login.aspx");
                        return;
                    }
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            if (!IsPostBack)
            {

            }  
        }
        public void BindData()
        {
            // Label2.Text = DateTime.Today.ToShortDateString();
            SqlConnection con = new SqlConnection(conn);
            DataSet ds = new DataSet();

            DataTable FromTable = new DataTable();

            con.Open();

            // string cmdstr = "Select * from tblStaff_info order by Profession";

            SqlCommand cmd = new SqlCommand("realtime", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Currentdate", SqlDbType.Date));
            cmd.Parameters["@Currentdate"].Value = DateTime.Now.Date;
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

            con.Close();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{

                BindData();

            //}
        }
       

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }
    }
}