using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Laquev_Time_Sheet_Management
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        LTSMDataContext db = new LTSMDataContext();
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
                dropjop.DataSource = from x in db.tblJob_Titles select x;
                dropjop.DataTextField = "Job_name";
                dropjop.DataValueField = "Job_id";
                dropjop.DataBind();
             
            }
        }
        protected void Page_unLoad(object sender, EventArgs e)
        {
            //Response.Write("<script>alert ('Record Added Successfully');</script>");
            //Session.Abandon();
        }

        protected void btnclr_Click(object sender, EventArgs e)
        {
            clear();
        }
        public void clear()
        {
            Label6.Text = "";
            txtname.Text = "";
            txthour.Text = "";
            txtremark.Text = "";
        }
        public bool validateinput()
        {

            if (txthour.Text == "" || txtname .Text==String.Empty)
            {
                //please fill a value
                Label6.Text = "Missing some values please fill it";
                return false;
            }
            else
            {
                if (!validate(txthour.Text, @"^\d+([.]\d+)$", "Invalid Hour"))
                {
                    txthour.Focus();
                    return false;
                }
             
               
                else

                    return true;
            }






        }
        public bool validate(string input, string exp, string msg)
        {
            bool rst = Regex.Match(input, exp).Success;
            if (!rst)
            {
                //  Response.Write("<script>alert ('');</script>");
                Label6.Text = msg;
               // Label7.Text = msg;
                return false;
            }
            return true;
        }
        protected void btnadd_Click(object sender, EventArgs e)
        {
            Label6.Text = "";
            if (validateinput())
            {
                tblJob_Title newjob = new tblJob_Title();
                newjob.Job_name = txtname.Text;
                newjob.Nakfa_per_hr = Convert.ToDecimal(txthour.Text);
                newjob.Remark = txtremark.Text;
                try
                {
                    db.tblJob_Titles.InsertOnSubmit(newjob);
                    db.SubmitChanges();


                    Response.Write("<script>alert ('Record Added Successfully');</script>");
                    clear();
                }

                catch (Exception ex)
                {
                    Response.Write("<script>alert ('Please try again ');</script>");
                }
          
            }
            else
            {
                return;
            }
        }

        protected void btnupd_Click(object sender, EventArgs e)
        {
            Label6.Text = "";
            if (validateinput())
            {
                try
                {
                    tblJob_Title upd = db.tblJob_Titles.Single(x => x.Job_id == Convert.ToInt32(dropjop.SelectedValue));
                    upd.Job_name = txtname.Text;
                    upd.Nakfa_per_hr = Convert.ToDecimal(txthour.Text);
                    upd.Remark = txtremark.Text;
                    Response.Write("<script>alert ('Record Updated Successfully');</script>");
                    db.SubmitChanges();
                    clear();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert ('Please try again ');</script>");
                }
            }
            else
            {
                return;
            }

        }

        protected void dropjop_SelectedIndexChanged(object sender, EventArgs e)
        {
            tblJob_Title upd = db.tblJob_Titles.Single(x => x.Job_id == Convert.ToInt32(dropjop.SelectedValue));
            txtname.Text = upd.Job_name;
            txthour.Text = upd.Nakfa_per_hr.ToString();
            txtremark.Text = upd.Remark;

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
           
        }
       

        
    }
}