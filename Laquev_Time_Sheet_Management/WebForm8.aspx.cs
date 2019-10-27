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
    public partial class WebForm8 : System.Web.UI.Page
    {
        LTSMDataContext db1 = new LTSMDataContext();
        public string conn = ConfigurationManager.ConnectionStrings["Laquev_timesheet_managementConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
               
           ////////// System.TimeSpan du = new TimeSpan(10, 10, 10);
           ////////// ff.Subtract(du );
           ////// var rst =( from x in db.tblTime_Records
           //////           where x.Date == Convert.ToDateTime("2014/10/02") && x.Status == "in"
           //////           group x by x.Staff_id into cc
           //////           select new
           //////           {
           //////               tt = cc.Sum(x => x.Time.TotalHours),
           //////              cc.Key 
           //////           });
           ////// var rr = from cc in rst
           //////          orderby cc.Key
           //////          select cc;
           ////// foreach (var xx in rr)
           ////// {
           //////   // ListBox1 .Items .Add (xx.Key + "  " + xx.tt.ToString());
           ////// }

           ////// //var rst = (from x in db.tblTime_Records
           ////// //           where x.Date == Convert.ToDateTime("2014/10/02")
            //           select new{
            //               rrr=x.Time.TotalHours - DateTime .Today.TimeOfDay .TotalHours 
            //           }
           // Label1.Text = DateTime.Today.TimeOfDay.TotalHours.ToString();
            //DateTime ff = new DateTime (# "2014/10/03" #);
        
            }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            // Label2.Text = DateTime.Today.ToShortDateString();
            SqlConnection con = new SqlConnection(conn);
            DataSet ds = new DataSet();

            DataTable FromTable = new DataTable();

            con.Open();

            // string cmdstr = "Select * from tblStaff_info order by Profession";

            SqlCommand cmd = new SqlCommand("report", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);

            adp.Fill(ds);

            cmd.ExecuteNonQuery();

            FromTable = ds.Tables[0];

            DateTime? sd = DateTime.Now.AddDays(-40);
            DateTime? ed = DateTime.Now.AddDays(40);
            var cc = (from x in db1.tblStaff_infos
                      select x);

            ReportViewer1.LocalReport.ReportEmbeddedResource = "Report2.rdlc";

            // //   ReportViewer1.ReportRefresh ;
            //DataSet1  s = new DataSet1 ();
            //var rst = db1.report();
            //var ff = from x in rst
            //         where x.Date.Month == DateTime.Now.Month
            //         group x by x.Date into ccc
            //         select new
            //         {
            //             ///ss = ccc.Sum(x => x.Total_per_day),
            //             aa = ccc.Select(x => x.Fname),
            //             aaa = ccc.Select(x => x.Lname),


            //};
            this.ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", FromTable));
          
           
        }

        protected void ReportViewer1_Load(object sender, EventArgs e)
        {
          
        }


      
    }
}