using System;
using System.IO ;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Laquev_Time_Sheet_Management
{
    public partial class WebForm3 : System.Web.UI.Page
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
                      string curdate = DateTime.Today.Date.ToShortDateString();
                     // txtdate.Text = curdate;
                 //    txtdate.Text = DateTime.ParseExact(curdate, "dd/mm/yyyy", System.Globalization.CultureInfo.CurrentUICulture).ToShortDateString();
                        if (!IsPostBack)
                        {
                            dropjob.DataSource = from x in db.tblJob_Titles select x;
                            dropjob.DataTextField = "Job_name";
                            dropjob.DataValueField = "Job_id";
                            dropjob.DataBind();
                            dropprofession.DataSource = from y in db.tblJob_Titles select y;
                            dropprofession.DataTextField = "Job_name";
                            dropprofession.DataValueField = "Job_id";
                            dropprofession.DataBind();
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
        

        protected void btnclr_Click(object sender, EventArgs e)
        {
            clear();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
        public bool validateinput()

        {

            if (txtfname.Text == "" || txtdate.Text == "" || txtlname.Text == "" || txthour.Text == "" || txtage.Text == "" ||txtphone .Text==""||txtaddress.Text=="")
            {
                //please fill a value
                Label10.Text = "Missing some values please fill it";
                return false ;
            }
            else
            {
                if (!validate(txtfname.Text, "^[A-Z][a-zA-Z]*$", "invalid first name"))
                {
                    txtfname.Focus();
                    return false;
                }
                else if (!validate(txtlname.Text, "^[A-Z][a-zA-Z]*$", "invalid last name"))
                {
                    txtlname.Focus();
                    return false;
                }
                else if (!validate(txtphone.Text, @"^([0][7][1-9][1-9]\d{4}|[1-9]\d{5})$", "invalid Phone number"))
                {
                    txtphone.Focus();
                    return false;
                }
                else if (!validate(txtaddress.Text, @"^[1-9]+\s([a-zA-Z]+|[a-zA-Z]+\s[a-zA-Z]+)$", "invalid address"))
                {
                    txtaddress.Focus();
                    return false;
                }
                else if (!validate(txtage.Text, @"^[1-9](\d{1}|\d{2})$", "invalid age"))
                {
                    txtage.Focus();
                    return false;
                }
                else if (!validate(txthour.Text, "^([1-9]|[1][0-4])$", "invalid hour"))
                {
                    txthour.Focus();
                    return false;
                }
                else if (!validate(txtdate .Text, @"^([1-3][1-9]/[1-9]/\d\d\d\d)$|^([1-3][1-9]/[0-1][0-2]/\d\d\d\d)$|^([1-9]/[1-9]/\d\d\d\d)$|^([1-9]/[0-1][0-2]/\d\d\d\d)$", "invalid Date"))
                {
                    txtdate.Focus();
                    return false;
                }
                else

                    return true;
            }



            
  

        }
        public bool validate(string input, string exp,string msg)
        {
            bool rst = Regex.Match(input,exp).Success ;
            if (!rst)
            {
              //  Response.Write("<script>alert ('');</script>");
                Label10.Text = msg;
                return false ;
            }
            return true ;
        }
        public void clear()
        {
           // txtdate.Text = DateTime.Today.Date.ToShortDateString();
            Label10.Text = "";
            txtaddress.Text = "";
            txtage.Text = "";
            txtdate.Text = "";
            txtfname.Text = "";
            txthour.Text = "";
            txtlname.Text = "";
            txtphone.Text = "";

        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            Label10.Text = "";
            try
            {
                if (validateinput())
                {


                    tblStaff_info person = new tblStaff_info();
                    person.Fname = txtfname.Text;
                    person.Lname = txtlname.Text;
                    person.Join_date = Convert.ToDateTime(txtdate.Text);
                    person.Phone_number = Convert.ToInt32(txtphone.Text);
                    person.Address = txtaddress.Text;
                    person.Profession = (dropjob.SelectedItem.Text);
                    person.Jop_id = Convert.ToInt32(dropjob.SelectedValue);
                    person.Hrs_per_day = Convert.ToInt32(txthour.Text);
                    person.Age = Convert.ToInt32(txtage.Text);
                    if (RadioButton1.Checked == true)
                        person.Sex = 'M';
                    else if (RadioButton2.Checked == true)
                        person.Sex = 'F';
                    db.tblStaff_infos.InsertOnSubmit(person);
                    db.SubmitChanges();
                    Response.Write("<script>alert ('Record Added Successfully');</script>");
                    clear();
                }
                else
                {
                    return;
                }
               
            }
            catch (Exception ex)
            {
                 Response.Write("<script>alert ('Please Try Again');</script>");
               // Label10.Text = ex.ToString();
            }
        }

        protected void dropprofession_SelectedIndexChanged(object sender, EventArgs e)
        {
            dropstaff.DataSource = from x in db.tblStaff_infos
                                   where x.Jop_id == Convert.ToInt32(dropprofession.SelectedValue)
                                   select x;
           
            dropstaff.DataTextField = "Fname";
            dropstaff.DataValueField = "Staff_id";
            dropstaff.DataBind();
            showstaff();
        }

        protected void btndel_Click(object sender, EventArgs e)
        {
            var del = (from x in db.tblStaff_infos
                      where x.Staff_id == Convert.ToInt32(dropstaff.SelectedValue)
                      select new
                      {
                          id=x.Staff_id,
                          count = x.tblTime_Records.Count
                      }).SingleOrDefault ();
            if (del !=null)
            {
                if (del.count < 250)
                {
                    //Delete Permanently
                   tblStaff_info stf=db.tblStaff_infos .Single (x=>x.Staff_id ==del .id );
                    db.tblStaff_infos .DeleteOnSubmit (stf);
                    db.SubmitChanges ();
                    Response.Write("<script>alert ('Staff Deleted Permanently');</script>");
                }
                else
                {
                    //terminate
                     tblStaff_info stf=db.tblStaff_infos .Single (x=>x.Staff_id ==del .id );
                    stf .Del_status ="Terminated";
                    db.SubmitChanges ();
                    Response.Write("<script>alert ('Staff Terminated');</script>");

                }
            }
        
        }

        protected void btnupd_Click(object sender, EventArgs e)
        {
            try
            {
                if (validateinput())
                {
                    if (dropstaff.SelectedValue.ToString() == "")
                    {
                        Response.Write("<script>alert ('Please Selerct a staff member');</script>");
                        return;
                    }
                    tblStaff_info upd = db.tblStaff_infos.Single(x => x.Staff_id == Convert.ToInt32(dropstaff.SelectedValue));
                    upd.Fname = txtfname.Text;
                    upd.Lname = txtlname.Text;
                    upd.Join_date = Convert.ToDateTime(txtdate.Text);
                    upd.Phone_number = Convert.ToInt32(txtphone.Text);
                    if (RadioButton1.Checked == true)
                        upd.Sex = 'M';
                    else if (RadioButton2.Checked == true)
                        upd.Sex = 'F';
                    upd.Hrs_per_day = Convert.ToInt32(txthour.Text);
                    upd.Profession = dropprofession.SelectedItem.ToString();
                    upd.Age = Convert.ToInt32(txtage.Text);
                    upd.Address = txtaddress.Text;
                    db.SubmitChanges();
                    Response.Write("<script>alert ('Record Updated Successfully');</script>");
                    clear();
                }
                else
                {
                    return;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert ('Please Try Again');</script>");
                return;
            }
        }

        protected void dropstaff_SelectedIndexChanged(object sender, EventArgs e)
        {
            showstaff();
        }
        public void showstaff()
        {
            if (dropstaff.SelectedValue.ToString() == "")
            {
               // Response.Write("<script>alert ('Please Selerct a staff member');</script>");
                clear();
                return;
            }
            var prs = (from x in db.tblStaff_infos
                       where x.Staff_id == Convert.ToInt32(dropstaff.SelectedValue)
                       select x).SingleOrDefault();
            if (prs != null)
            {
                txtfname.Text = prs.Fname;
                txtlname.Text = prs.Lname;
                if( prs.Phone_number .Value.ToString ().Substring (0,1)=="7")
                txtphone.Text ="0"+prs.Phone_number.ToString();
                else
                    txtphone.Text =  prs.Phone_number.ToString();
                txthour.Text = prs.Hrs_per_day.ToString();
                txtage.Text = prs.Age.ToString();
                txtdate.Text = prs.Join_date.ToShortDateString();
                txtaddress.Text = prs.Address.ToString();
                 
                     var job=( from x in db.tblJob_Titles where x.Job_id ==Convert .ToInt32 ( dropprofession .SelectedValue) select new {x.Job_name }).Single () ;
                     dropjob.SelectedValue  = dropprofession .SelectedValue ;
                if (prs.Sex == 'M')
                {
                    RadioButton1.Checked = true;
                }
                else if (prs.Sex == 'F')
                {
                    RadioButton2.Checked = true;
                }
            }
        }
        protected void dropprofession_Load(object sender, EventArgs e)
        {
            
        }
        protected void Page_unLoad(object sender, EventArgs e)
        {
            //if (Menu2.Items[0].NavigateUrl == "Staffing.aspx")
            //{
            //}
            //else if (Menu2.Items[1].NavigateUrl == "Job.aspx")
            //{
            //}
            //else
            //{
            //    Session.Abandon();
            //}
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        
    }
}