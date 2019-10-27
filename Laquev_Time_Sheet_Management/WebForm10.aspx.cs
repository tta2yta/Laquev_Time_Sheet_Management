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
           
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conn);
            DataSet ds = new DataSet();

            DataTable FromTable = new DataTable();

            con.Open();

            // string cmdstr = "Select * from tblStaff_info order by Profession";

            SqlCommand cmd = new SqlCommand("efficiency", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);

            adp.Fill(ds);

            cmd.ExecuteNonQuery();

            FromTable = ds.Tables[0];
            rv1.LocalReport.ReportEmbeddedResource = "Report3.rdlc";


            rv1.LocalReport.DataSources.Clear();


            this.rv1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", FromTable));
        }

        protected void rv1_Load(object sender, EventArgs e)
        {
        
        }
    }
}