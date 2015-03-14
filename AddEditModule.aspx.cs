using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Collections;

namespace Team11
{
    public partial class AddEditModule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownListMain.Items.Add("Please select data you wish to manage: ");
                DropDownListMain.Items.Add("Modules");
                DropDownListMain.Items.Add("Rooms");
                DropDownListMain.Items.Add("Facilities");
                DropDownListMain.Items.Add("Facilities in a Room");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (TextBoxModuleCode.Text != "" && TextBoxModuleName.Text != "")
            {
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ParkConnectionString"].ToString());
                conn.Open();
                string check = "SELECT COUNT(moduleID) FROM [Module] WHERE moduleTitle='" + TextBoxModuleName + "' AND moduleCode='" + TextBoxModuleCode + "'";
                SqlCommand checkcommand = new SqlCommand(check, conn);
                int checksum = Convert.ToInt32(checkcommand.ExecuteScalar().ToString());
                conn.Close();
                if (checksum == 0)
                {
                    conn.Open();
                    string insertquery = "Insert into [Module] Values('" + TextBoxModuleCode.Text + "','" + TextBoxModuleName.Text + "','1')";
                    SqlCommand insertcommand = new SqlCommand(insertquery, conn);
                    insertcommand.ExecuteNonQuery();
                    LabelResponse.Text = "Module was sucessfully added to the Database";
                    conn.Close();
                }
                else { LabelResponse.Text = "Please enter a different Module Code/Title"; }
            }
            else { LabelResponse.Text = "Please Enter Module Code/Title"; }
        }

        protected void Management_Choice(object sender, EventArgs e)
        {
            if(DropDownListMain.SelectedItem.Text == "Modules")
            {
                string getModules = "SELECT moduleCode, moduleTitle, moduleID FROM [Module] WHERE userID = 1";
            }
            if(DropDownListMain.SelectedItem.Text == "Rooms")
            {
                string getRooms = "SELECT roomID, roomName, capacity FROM [Room]";
            }
            if(DropDownListMain.SelectedItem.Text == "Facilities")
            {
                string getFacilities = "SELECT facilityID, facilityName FROM [Facility]";
            }
            if(DropDownListMain.SelectedItem.Text == "Facilities in a Room")
            {
                string getFacsInRooms = "SELECT roomID, roomName FROM [Room] INNER JOIN [RoomFacilities] ON [Room].roomID=[RoomFacilities].roomID INNER JOIN [Facilities] ON [RoomFacilities].facilityID=[Facilities].facilityID";
            }
        }
    }
}