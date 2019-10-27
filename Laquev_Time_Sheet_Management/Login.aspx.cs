using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Laquev_Time_Sheet_Management
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        LTSMDataContext db = new LTSMDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            try
            {
               
                    
                var count = (from x in db.Authenticate_users
                             where x.Username == Login1.UserName && x.Password == Login1.Password
                             select x).SingleOrDefault();
            //   Label1.Text = Session.Count.ToString();
                    if (count != null)
                    {
                        Session.Add(count.Username, count.Role);
                        if (count.Role == "Personal")
                        {
                            //Label1.Text = Session.Count.ToString();
                            Response.Redirect("~/Staffing.aspx");

                        }
                        else if (count.Role == "Timekeeper")
                        {
                            Response.Redirect("~/TimeRecord.aspx");
                            // Label1.Text = Session.Count.ToString();
                        }
                        else if (count.Role == "Report")
                        {
                            Response.Redirect("~/efficiencyreport.aspx");
                            // Label1.Text = Session.Count.ToString();
                        }

                        else
                        {
                            //Label1.Text = Session.Count.ToString();
                            e.Authenticated = false;

                        }

                    }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert ('Please Try Again');</script>");
                return;
            }
            }
           
        }
    }
