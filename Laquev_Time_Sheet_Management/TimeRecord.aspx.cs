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
    public partial class WebForm5 : System.Web.UI.Page
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
                    if (str == "Timekeeper")
                    {
                        Menu4.Enabled = true;

                        if (!IsPostBack)
                        {

                            BindData();

                        }
                    }
                    else
                    {
                        Response.Redirect("~/Login.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
          
                          
              
            

        }
        protected void Page_unLoad(object sender, EventArgs e)
        {
            //Response.Write("<script>alert ('Record Added Successfully');</script>");
          //  Session.Abandon();
        }
        public void BindData()
        {
            // Label2.Text = DateTime.Today.ToShortDateString();
            SqlConnection con = new SqlConnection(conn);
            DataSet ds = new DataSet();

            DataTable FromTable = new DataTable();

            con.Open();

           // string cmdstr = "Select * from tblStaff_info order by Profession";

            SqlCommand cmd = new SqlCommand("SELECT_STAFF", con);
            cmd.CommandType = CommandType.StoredProcedure;
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

      

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
          
           // TextBox t=
            BindData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;

            BindData();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }
        protected void btn_add_Click(object sender, EventArgs e)
        {
           // GridView1.SelectedIndex = -1;

        }
         protected void btn1_add_Click(object sender, EventArgs e)
        {
            
           
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                TextBox txtdate = (TextBox)GridView1.FooterRow.FindControl("txtdate");

                TextBox txttime = (TextBox)GridView1.FooterRow.FindControl("txttime");

                TextBox txtweek = (TextBox)GridView1.FooterRow.FindControl("txtweek");

                TextBox txtdaystatus = (TextBox)GridView1.FooterRow.FindControl("txtdaystatus");
                //  GridView1.DataBind();

                if (e.CommandName.Equals("ADD"))
                {
                    try
                    {




                        TextBox date1 = new TextBox();
                        TextBox time = new TextBox();
                        TextBox week = new TextBox();
                        TextBox day = new TextBox();
                        GridViewRow grid1 = (GridViewRow)((Button)e.CommandSource).NamingContainer;
                        date1 = (TextBox)grid1.FindControl("Date");
                        time = (TextBox)grid1.FindControl("time");
                        week = (TextBox)grid1.FindControl("week");
                        day = (TextBox)grid1.FindControl("Day");
                        Label t = (Label)grid1.FindControl("staffid");
                        Label tt = (Label)grid1.FindControl("lblstatus");
                      //  Label2.Text = time.Text;
                        if (date1.Equals(null))
                        {
                            Response.Write("<script>alert ('Please Fill a value ');</script>");
                        }
                        else
                        {


                            var result = (from x in db.tblTime_Records
                                          where x.Staff_id == Convert.ToInt32(t.Text) && x.Date == DateTime.Today.Date
                                          orderby x.Time descending
                                          select x).FirstOrDefault();
                            if (result == null)
                            {

                                tblTime_Record trecord = new tblTime_Record();
                                trecord.Staff_id = Convert.ToInt32(t.Text);
                                trecord.Date = Convert.ToDateTime(date1.Text);
                                //   trecord.Time = Convert.ToDateTime(time.Text,TimeSpan ("hh:mm"));
                                DateTime dd = DateTime.Now;
                                trecord.Time = dd.TimeOfDay;
                                trecord.Week_id = week.Text;
                                trecord.Day_status = day.Text;
                                trecord.Status = "in";
                                trecord.Total_per_day = 0;
                                db.tblTime_Records.InsertOnSubmit(trecord);
                                db.SubmitChanges();

                                BindData();
                                GridView1.Rows[GridView1.EditIndex].Cells[9].Text = "in";
                            }


                            else if (result.Status == "out")
                            {
                                tblTime_Record trecord = new tblTime_Record();
                                trecord.Staff_id = Convert.ToInt32(t.Text);
                                trecord.Date = Convert.ToDateTime(date1.Text);
                                //   trecord.Time = Convert.ToDateTime(time.Text,TimeSpan ("hh:mm"));
                                DateTime dd = DateTime.Now;
                                trecord.Time = dd.TimeOfDay;
                                trecord.Week_id = week.Text;
                                trecord.Day_status = day.Text;
                                trecord.Status = "in";
                                trecord.Total_per_day = 0;
                                BindData();
                                GridView1.Rows[GridView1.EditIndex].Cells[9].Text = "in";
                                db.tblTime_Records.InsertOnSubmit(trecord);
                                db.SubmitChanges();


                            }
                            else if (result.Status == "in")
                            {
                                tblTime_Record trecord = new tblTime_Record();
                                trecord.Staff_id = Convert.ToInt32(t.Text);
                                trecord.Date = Convert.ToDateTime(date1.Text);
                                DateTime dd = DateTime.Now;
                                trecord.Time = dd.TimeOfDay;
                                trecord.Week_id = week.Text;
                                trecord.Day_status = day.Text;
                                trecord.Status = "out";
                                trecord.Total_per_day =dd.TimeOfDay .TotalHours  - result.Time.TotalHours;
                                BindData();
                                GridView1.Rows[GridView1.EditIndex].Cells[9].Text = "out";
                                db.tblTime_Records.InsertOnSubmit(trecord);
                                db.SubmitChanges();


                            }

                        }
                    }
                    catch (Exception ex)
                    {
                       // Label2.Text = ex.ToString();
                        Response.Write("<script>alert ('Please try again ');</script>");
                        return;
                    }
                    finally
                    {
                        // BindData();

                    }
                }
                else if (e.CommandName == "ADDd")
                {
                    try
                    {
                        //adding holidays
                        var rst = from xx in db.tblStaff_infos
                                  select new { xx.Staff_id };
                        foreach (var add in rst)
                        {
                            tblTime_Record hol = new tblTime_Record();
                            hol.Staff_id = add.Staff_id;
                            hol.Date = Convert.ToDateTime(txtdate.Text);
                            DateTime dd = new DateTime();
                            dd = Convert.ToDateTime(txttime.Text);
                            hol.Time = dd.TimeOfDay;
                            hol.Week_id = txtweek.Text;
                            hol.Day_status = txtdaystatus.Text;
                            db.tblTime_Records.InsertOnSubmit(hol);
                            db.SubmitChanges();

                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert ('Please try again ');</script>");
                        return;
                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert ('Please try again ');</script>");
                return;
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridView1.EditIndex = e.NewSelectedIndex;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void HyperLink1_Init(object sender, EventArgs e)
        {

        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            //cal = Calendar1.SelectedDate;
           // Label3.Text = cal.ToString();
            TextBox txtdate = (TextBox)GridView1.FooterRow.FindControl("txtdate");
            TextBox txtweek = (TextBox)GridView1.FooterRow.FindControl("txtweek");
            txtdate.Text = Calendar1.SelectedDate.ToShortDateString();
            txtweek.Text = Calendar1.SelectedDate.DayOfWeek.ToString ();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}