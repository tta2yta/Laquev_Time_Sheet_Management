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
        DateTime cal;
        LTSMDataContext db1 = new LTSMDataContext();
        public string conn = ConfigurationManager.ConnectionStrings["Laquev_timesheet_managementConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Menu5.Enabled = true;
           
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
            
           
        }

        protected void ReportViewer1_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
               rv1.Visible = false;
            } 
        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
           
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
                else{
                    // Label2.Text = DateTime.Today.ToShortDateString();
                   rv1.Visible = true;
                    SqlConnection con = new SqlConnection(conn);
                    DataSet ds = new DataSet();

                    DataTable FromTable = new DataTable();

                    con.Open();

                    // string cmdstr = "Select * from tblStaff_info order by Profession";

                    SqlCommand cmd = new SqlCommand("Report11", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Currentmonth1", SqlDbType.Date));
                    cmd.Parameters["@Currentmonth1"].Value = Calendar1.SelectedDate ;

                    SqlDataAdapter adp = new SqlDataAdapter(cmd);

                    adp.Fill(ds);

                    cmd.ExecuteNonQuery();

                    FromTable = ds.Tables[0];

             

                 rv1.LocalReport.ReportEmbeddedResource = "Report4.rdlc";

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

                 rv1.LocalReport.DataSources.Clear();
                    this.rv1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", FromTable));
                    cmd .Parameters .Clear ();
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

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
           
        }

      
        


      
    }
}