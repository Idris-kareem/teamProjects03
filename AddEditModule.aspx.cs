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
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;

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
                Int32 checksum = Convert.ToInt32(checkcommand.ExecuteScalar().ToString());
                conn.Close();
                if (checksum == 0)
                {
                    conn.Open();
                    string insertquery = "INSERT INTO [Module] VALUES('" + TextBoxModuleCode.Text + "','" + TextBoxModuleName.Text + "','1')";
                    SqlCommand insertcommand = new SqlCommand(insertquery, conn);
                    insertcommand.ExecuteNonQuery();
                    LabelResponse.Text = "Module was sucessfully added to the Database";
                    GridView1.DataBind();
                    this.Panel1.Update();
                    conn.Close();
                }
                else { LabelResponse.Text = "Please enter a different Module Code/Title"; }
            }
            else { LabelResponse.Text = "Please Enter Module Code/Title"; }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBoxRoomName1.Text != "" && TextBoxCapacity.Text != "" && TextBoxBuildingName.Text != "")
            {
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ParkConnectionString"].ToString());
                conn.Open();
                string buildingIDSelect = "SELECT [Building].buildingID FROM [Building] WHERE buildingName='" + TextBoxBuildingName.Text + "'";
                string check = "SELECT COUNT(roomID) FROM [Room] WHERE roomName='" + TextBoxRoomName1.Text + "' AND capacity='" + TextBoxCapacity.Text + "' AND [Room].buildingID='" + buildingIDSelect + "'";
                SqlCommand checkcommand = new SqlCommand(check, conn);
                Int32 checksum = Convert.ToInt32(checkcommand.ExecuteScalar().ToString());
                conn.Close();
                if (checksum == 0)
                {
                    conn.Open();
                    string insertquery = "SET IDENTITY_INSERT [Room] ON INSERT INTO [Room] VALUES('" + TextBoxRoomName1.Text + "', '" + TextBoxCapacity.Text + "', 'SELECT [Building].buildingID FROM [Building] WHERE buildingName='" + TextBoxBuildingName.Text + "') SET IDENTITY_INSERT [Room] OFF";
                    SqlCommand insertcommand = new SqlCommand(insertquery, conn);
                    insertcommand.ExecuteNonQuery();
                    LabelResponse.Text = "Room was sucessfully added to the Database";
                    GridView2.DataBind();
                    this.Panel2.Update();
                    conn.Close();
                }
                else { LabelResponse.Text = "Please enter a different Room ID/Name"; }
            }
            else { LabelResponse.Text = "Please Enter Room ID/Name"; }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBoxFacilityName1.Text != "")
            {
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ParkConnectionString"].ToString());
                conn.Open();
                string check = "SELECT COUNT(facilityID) FROM [Facility] WHERE FacilityName='" + TextBoxFacilityName1 + "'";
                SqlCommand checkcommand = new SqlCommand(check, conn);
                Int32 checksum = Convert.ToInt32(checkcommand.ExecuteScalar().ToString());
                conn.Close();
                if (checksum == 0)
                {
                    conn.Open();
                    string insertquery = "Insert into [Facility] Values('" + TextBoxFacilityName1.Text + "')";
                    SqlCommand insertcommand = new SqlCommand(insertquery, conn);
                    insertcommand.ExecuteNonQuery();
                    LabelResponse.Text = "Facility was sucessfully added to the Database";
                    GridView3.DataBind();
                    this.Panel3.Update();
                    conn.Close();
                }
                else { LabelResponse.Text = "Please enter a different Facility ID/Name"; }
            }
            else { LabelResponse.Text = "Please Enter Facility ID/Name"; }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (TextBoxRoomName2.Text != "" && TextBoxFacilityName2.Text != "")
            {
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ParkConnectionString"].ToString());
                conn.Open();
                string check = "SELECT COUNT([Room].roomID) FROM [Room] INNER JOIN [RoomFacilities] ON [Room].roomID = [RoomFacilities].roomID INNER JOIN [Facility] ON [RoomFacilities].facilityID = [Facility].facilityID WHERE facilityName='" + TextBoxFacilityName2 + "' AND roomName='" + TextBoxRoomName2 + "'";
                SqlCommand checkcommand = new SqlCommand(check, conn);
                Int32 checksum = Convert.ToInt32(checkcommand.ExecuteScalar().ToString());
                conn.Close();
                if (checksum == 0)
                {
                    conn.Open();
                    string roomIdSelect = "SELECT [Room].roomID FROM [Room] WHERE roomName='" + TextBoxRoomName2.Text + "'";
                    string facilityIdSelect = "SELECT [Facility].facilityID FROM [Facility] WHERE facilityName='" + TextBoxFacilityName2.Text + "'";
                    string insertquery = "Insert into [RoomFacilities] Values('" + roomIdSelect + "', '" + facilityIdSelect + "')";
                    SqlCommand insertcommand = new SqlCommand(insertquery, conn);
                    insertcommand.ExecuteNonQuery();
                    LabelResponse.Text = "Room/Facility Association was sucessfully added to the Database";
                    conn.Close();
                }
                else { LabelResponse.Text = "Please enter a different Room/Facility ID"; }
            }
            else { LabelResponse.Text = "Please Enter Room/Facility ID"; }
        }

        protected void Management_Choice(object sender, EventArgs e)
        {
            if(DropDownListMain.SelectedItem.Text == "Modules")
            {
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;
                Panel1.Visible = true;
            }
            if(DropDownListMain.SelectedItem.Text == "Rooms")
            {
                Panel1.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;
                Panel2.Visible = true;
            }
            if(DropDownListMain.SelectedItem.Text == "Facilities")
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel4.Visible = false;
                Panel3.Visible = true;
            }
            if(DropDownListMain.SelectedItem.Text == "Facilities in a Room")
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = true;
            }
        }
    }
}