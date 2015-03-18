<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Preference.aspx.cs" Inherits="Team11.Preference" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    <!-- Preference CSS -->
    <link rel="Stylesheet" type="text/css" href="Styles/Preference.css" />

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            //Loading Page
            if ($("#MainContent_create").is(":checked")) {
                $("#MainContent_create").parent().addClass("btn btn-danger");
            };
            
        };
        </script>
    <style type="text/css">
        .auto-style5 {
            width: 75px;
            text-align: center;
        }
        .auto-style6 {
            width: 119px;
            text-align: center;
        }
        .auto-style7 {
            width: 119px;
            text-align: center;
        }
        .auto-style8 {
            width: 69px;
        }
        .auto-style9 {
            width: 69px;
            text-align: center;
        }
        .auto-style10 {
            width: 73px;
        }
        .auto-style11 {
            width: 55px;
        }
        .auto-style12 {
            text-align: center;
            width: 55px;
        }
        .auto-style13 {
            width: 119px;
            text-align: center;
            font-size: medium;
        }
        .auto-style14 {
            font-size: medium;
        }
        .auto-style15 {
            width: 73px;
            text-align: center;
        }
        .auto-style16 {
            width: 94px;
            text-align: center;
        }
        .auto-style17 {
            width: 106px;
            text-align: center;
        }
        .auto-style18 {
            width: 106px;
        }
    </style>
</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Preferences</h1>
</asp:Content>


<%-- Body Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="canister">
        <div class="canistertitle">
            <h2>System Preferences</h2>
        </div>
        <div class="canistercontainer">
            <div class="row">
                <div class="text-center col-md-4 col-sm-4">
                    <h3>Default Loading Page</h3>
                </div>
                <div class="text-center col-md-8 col-sm-8">
                    <asp:RadioButton class="btn btn-primary" ID="create" runat="server" GroupName="page" Text="Create Request" />
                    <asp:RadioButton class="btn btn-primary" ID="view" runat="server" GroupName="page" Text="View Request"  />
                    <asp:RadioButton class="btn btn-primary" ID="adhoc" runat="server" GroupName="page" Text="Ad-Hoc" />
                </div>
            </div>
            <div class="row">
                <div class="text-center col-md-4 col-sm-4">
                    <h3>Default Location</h3>
                </div>
                <div class="text-center col-md-8 col-sm-8">
                    
                    <asp:RadioButton class="btn btn-primary" ID="any" runat="server" GroupName="park" Text="Any" />
                    <asp:RadioButton class="btn btn-primary" ID="central" runat="server" GroupName="park" Text="Central Park" />
                    <asp:RadioButton class="btn btn-primary" ID="west" runat="server" GroupName="park" Text="West Park" />
                    <asp:RadioButton class="btn btn-primary" ID="east" runat="server" GroupName="park" Text="East Park" />
                </div>
            </div>
            <div class="row">
                <div class="text-center col-md-4 col-sm-4">
                    <h3>Default Time Format</h3>
                </div>
                <div class="text-center col-md-8 col-sm-8">
                    <asp:RadioButton class="btn btn-primary" ID="hr24" runat="server" GroupName="time" Text="24 Hour Format" />
                    <asp:RadioButton class="btn btn-primary" ID="hr12" runat="server" GroupName="time" Text="12 Hour Format" />
                </div>
            </div>
            <div class="row">
                <div class="text-center col-md-4 col-sm-4">
                    <h3>Periods or Times</h3>
                </div>
                <div class="text-center col-md-8 col-sm-8">
                    <asp:RadioButton class="btn btn-primary" ID="period" runat="server" GroupName="period" Text="Periods and Duration" />
                    <asp:RadioButton class="btn btn-primary" ID="time" runat="server" GroupName="period" Text="Start and End Time" />
                </div>
            </div>
            <div class="row">
                <div class="text-center col-md-6 col-sm-6">
                    <h3>Header 1</h3>
                </div>
                <div class="text-center col-md-3 col-sm-3">
                    <asp:DropDownList class="form-control" ID="header1" runat="server" >
                        <asp:ListItem Value="facilities">Facilities</asp:ListItem>
                        <asp:ListItem Value="park">Park</asp:ListItem>
                        <asp:ListItem Value="altrooms">Alt Rooms</asp:ListItem>
                        <asp:ListItem Value="building">Building</asp:ListItem>
                        <asp:ListItem Value="semester">Semester</asp:ListItem>
                        <asp:ListItem Value="year">Year</asp:ListItem>
                        <asp:ListItem Value="numberstudents">No. Students</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="text-center col-md-6 col-sm-6">
                    <h3>Header 2</h3>
                </div>
                <div class="text-center col-md-3 col-sm-3">
                    <asp:DropDownList class="form-control" ID="header2" runat="server" >
                        <asp:ListItem Value="facilities">Facilities</asp:ListItem>
                        <asp:ListItem Value="park">Park</asp:ListItem>
                        <asp:ListItem Value="altrooms">Alt Rooms</asp:ListItem>
                        <asp:ListItem Value="building">Building</asp:ListItem>
                        <asp:ListItem Value="semester">Semester</asp:ListItem>
                        <asp:ListItem Value="year">Year</asp:ListItem>
                        <asp:ListItem Value="numberstudents">No. Students</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="text-center col-md-6 col-sm-6">
                    <h3>Header 3</h3>
                </div>
                <div class="text-center col-md-3 col-sm-3">
                    <asp:DropDownList class="form-control" ID="header3" runat="server" >
                        <asp:ListItem Value="facilities">Facilities</asp:ListItem>
                        <asp:ListItem Value="park">Park</asp:ListItem>
                        <asp:ListItem Value="altrooms">Alt Rooms</asp:ListItem>
                        <asp:ListItem Value="building">Building</asp:ListItem>
                        <asp:ListItem Value="semester">Semester</asp:ListItem>
                        <asp:ListItem Value="year">Year</asp:ListItem>
                        <asp:ListItem Value="numberstudents">No. Students</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="text-center col-md-6 col-sm-6 col-md-offset-3 col-sm-offset-3">
                    <asp:Button class="btn btn-success btn-block" ID="Button1" runat="server" onclick="Button1_Click" Text="Save" />
                </div>
            </div>
        </div><!-- ./canistercontainer -->
    </div><!-- ./canister -->
   

    <div class ="canister">
        <div class ="canistertitle">
            <h2>Round Dates</h2>
        </div>
        <div class ="canistercontainer">

            <table style="width: 98%; height: 85px;">
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style13"><strong>Semester 1</strong></td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">Start:</td>
                    <td class="auto-style15">
                        <asp:DropDownList ID="dayStart1" runat="server" Height="28px" Width="54px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style16">
                        <asp:DropDownList ID="monthStart1" runat="server" Height="28px" Width="110px">
                            <asp:ListItem>January</asp:ListItem>
                            <asp:ListItem>February</asp:ListItem>
                            <asp:ListItem>March</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style17">
                        <asp:DropDownList ID="yearart1" runat="server" Height="28px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Width="91px">
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem>2016</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">End:</td>
                    <td class="auto-style15">
                        <asp:DropDownList ID="dayEnd1" runat="server" Height="28px" Width="54px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style12">
                        <asp:DropDownList ID="monthEnd1" runat="server" Height="28px" Width="110px">
                            <asp:ListItem>January</asp:ListItem>
                            <asp:ListItem>February</asp:ListItem>
                            <asp:ListItem>March</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style17">
                        <asp:DropDownList ID="yearEnd1" runat="server" Height="28px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Width="91px">
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem>2016</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"><span class="auto-style14"></td>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                    <td class="auto-style17"></span></td>
                    <td class="auto-style13"><strong>Semester 2</strong></td>
                    <td class="auto-style8"><span class="auto-style14"></td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style18"></span></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">Start:</td>
                    <td class="auto-style15">
                        <asp:DropDownList ID="daySelect2" runat="server" Height="28px" Width="54px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style16">
                        <asp:DropDownList ID="monthSelect2" runat="server" Height="28px" Width="110px">
                            <asp:ListItem>January</asp:ListItem>
                            <asp:ListItem>February</asp:ListItem>
                            <asp:ListItem>March</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style17">
                        <asp:DropDownList ID="yearSelect2" runat="server" Height="28px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Width="91px">
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem>2016</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">End:</td>
                    <td class="auto-style15">
                        <asp:DropDownList ID="daySelect4" runat="server" Height="28px" Width="54px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style12">
                        <asp:DropDownList ID="monthSelect4" runat="server" Height="28px" Width="110px">
                            <asp:ListItem>January</asp:ListItem>
                            <asp:ListItem>February</asp:ListItem>
                            <asp:ListItem>March</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style17">
                        <asp:DropDownList ID="yearSelect4" runat="server" Height="28px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Width="91px">
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem>2016</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table style="width:100%;">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                    <asp:Button class="btn btn-success btn-block" ID="Button2" runat="server" onclick="Button1_Click" Text="Save" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>

    </div>
   
   
   
</asp:Content>
