using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.Common;
using Microsoft.Reporting.WebForms ;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace Laquev_Time_Sheet_Management
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        public string conn = ConfigurationManager.ConnectionStrings["Laquev_timesheet_managementConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Menu5.Enabled = true;
            
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void rv1_Load(object sender, EventArgs e)
        {
        if(!IsPostBack )
        {
            rv1 .Visible =false ;
        }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
             try
            {
                if (Calendar1.SelectedDate==null)
                {
                    Response.Write("<script>alert ('Please Select a Date');</script>");
                    return;
                }
                else
                {
            rv1.Visible = true ;
            SqlConnection con = new SqlConnection(conn);
            DataSet ds = new DataSet();

            DataTable FromTable = new DataTable();

            con.Open();

            // string cmdstr = "Select * from tblStaff_info order by Profession";
                           SqlCommand cmd = new SqlCommand("efficiency1", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Currentmonth", SqlDbType.Date, 50));
            cmd.Parameters["@Currentmonth"].Value = Calendar1.SelectedDate;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);

            adp.Fill(ds);

            cmd.ExecuteNonQuery();

            FromTable = ds.Tables[0];
            rv1.LocalReport.ReportEmbeddedResource = "Report3.rdlc";


            rv1.LocalReport.DataSources.Clear();


            this.rv1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", FromTable));
            cmd.Parameters.Clear();
                }
            }
             catch (Exception ex)
             {
                 Response.Write("<script>alert ('Please Try Again');</script>");
                 return;
             }
           
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}