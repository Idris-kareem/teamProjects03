<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEditModule.aspx.cs" Inherits="Team11.AddEditModule" %>

<%-- Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/AddEditModule.css" />
</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Data Management</h1>
</asp:Content>

<%-- Body Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        </asp:ScriptManagerProxy>

    </div>

    <asp:DropDownList CssClass="form-control" ID="DropDownListMain" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Management_Choice"></asp:DropDownList>

    <asp:UpdatePanel id="Panel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
    <!-- Add Module -->
        <div class="canister">
            <div class="canistertitle">
                <h2>Add Module</h2>
            </div>
            <div class="canistercontainer">
                <div class="row">
                    <div class="text-center col-md-4 col-sm-4">
                        <h3 class="minustopmarg">Module Title</h3>
                    </div>
                    <div class="text-center col-md-8 col-sm-8">
                        <asp:TextBox CssClass="form-control" ID="TextBoxModuleName" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="text-center col-md-4 col-sm-4">
                        <h3 class="minustopmarg">Module Code</h3>
                    </div>
                    <div class="text-center col-md-8 col-sm-8">
                        <asp:TextBox CssClass="form-control" ID="TextBoxModuleCode" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="text-center col-md-4 col-sm-4 col-md-offset-2 col-sm-offset-2">
                        <asp:Button CssClass="btn btn-success btn-block full" ID="Button1" runat="server" onclick="Button1_Click" Text="Add" Width="96px"/>
                    </div>
                    <div class="text-center col-md-4 col-sm-4">
                        <button class="btn btn-success btn-block">Clear All</button>
                    </div>
                    <asp:Label ID="LabelResponse" runat="server" Text=""></asp:Label>
                </div>
            </div><!-- ./canistercontainer -->
        </div><!-- ./canister -->

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
        DeleteCommand="DELETE FROM [Module] WHERE [moduleID] = @moduleID" 
        InsertCommand="INSERT INTO [Module] ([moduleCode], [moduleTitle]) VALUES (@moduleCode, @moduleTitle)" 
        SelectCommand="SELECT [moduleCode], [moduleTitle], [moduleID] FROM [Module] WHERE ([userID] = @userID)" 
        
        UpdateCommand="UPDATE [Module] SET [moduleCode] = @moduleCode, [moduleTitle] = @moduleTitle WHERE [moduleID] = @moduleID">
            <DeleteParameters>
                <asp:Parameter Name="moduleID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="moduleCode" Type="String" />
                <asp:Parameter Name="moduleTitle" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="userID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="moduleCode" Type="String" />
                <asp:Parameter Name="moduleTitle" Type="String" />
                <asp:Parameter Name="moduleID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br/>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="moduleID" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
            Width="927px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="moduleCode" HeaderText="moduleCode" 
                    SortExpression="moduleCode" />
                <asp:BoundField DataField="moduleTitle" HeaderText="moduleTitle" 
                    SortExpression="moduleTitle" />
                <asp:BoundField DataField="moduleID" HeaderText="moduleID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="moduleID" />
            </Columns>
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#CC0066" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

            <br/>

        <div class="tablecontainer">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
            InsertCommand="INSERT INTO [Module] ([moduleCode], [moduleTitle]) VALUES (@moduleCode, @moduleTitle)" 
        
                SelectCommand="SELECT [moduleCode], [moduleTitle] FROM [Module] WHERE ([userID] = @userID)">
            <InsertParameters>
                <asp:Parameter Name="moduleCode" Type="String" />
                <asp:Parameter Name="moduleTitle" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="userID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel id="Panel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
        <!-- Add Room -->
        <div class="canister">
            <div class="canistertitle">
                <h2>Add Room</h2>
            </div>
            <div class="canistercontainer">
                <div class="row">
                    <div class="text-center col-md-4 col-sm-4">
                        <h3 class="minustopmarg">Room Name</h3>
                    </div>
                    <div class="text-center col-md-8 col-sm-8">
                        <asp:TextBox CssClass="form-control" ID="TextBoxRoomName1" runat ="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="text-center col-md-4 col-sm-4">
                        <h3 class="minustopmarg">Capacity</h3>
                    </div>
                    <div class="text-center col-md-8 col-sm-8">
                        <asp:TextBox CssClass="form-control" ID="TextBoxCapacity" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="text-center col-md-4 col-sm-4">
                        <h3 class="minustopmarg">Building Name</h3>
                    </div>
                    <div class="text-center col-md-8 col-sm-8">
                        <asp:TextBox CssClass="form-control" ID="TextBoxBuildingName" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="text-center col-md-4 col-sm-4 col-md-offset-2 col-sm-offset-2">
                        <asp:Button CssClass="btn btn-success btn-block full" ID="Button2" runat="server" onclick="Button2_Click" Text="Add" Width="96px" />
                    </div>
                    <div class="text-center col-md-4 col-sm-4">
                        <button class="btn btn-success btn-block">Clear All</button>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
            </div><!-- ./canistercontainer -->
        </div><!-- ./canister -->

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
        DeleteCommand="DELETE FROM [Room] WHERE [roomID] = @roomID" 
        InsertCommand="INSERT INTO [Room] ([roomID], [roomName]) VALUES (@roomID, @roomName)" 
        SelectCommand="SELECT [roomID], [roomName] FROM [Room]" 
        
        UpdateCommand="UPDATE [Room] SET [roomName] = @roomName WHERE [roomID] = @roomID">
            <DeleteParameters>
                <asp:Parameter Name="roomID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="roomID" Type="Int32" />
                <asp:Parameter Name="roomName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="roomName" Type="String" />
                <asp:Parameter Name="roomID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br/>

        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="roomID" 
            DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" 
            Width="927px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="roomID" HeaderText="roomID" 
                    SortExpression="roomID" />
                <asp:BoundField DataField="roomName" HeaderText="roomName" 
                    SortExpression="roomName" />
            </Columns>
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#CC0066" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <br/>

        <div class="tablecontainer">
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
            InsertCommand="INSERT INTO [Room] ([roomID], [roomName]) VALUES (@roomID, @roomName)" 
        
            SelectCommand="SELECT [roomID], [roomName] FROM [Room]">
            <InsertParameters>
                <asp:Parameter Name="roomID" Type="Int32" />
                <asp:Parameter Name="roomName" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

        </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="Panel3" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
        <!-- Add Facility -->
        <div class="canister">
            <div class="canistertitle">
                <h2>Add Facility</h2>
            </div>
            <div class="canistercontainer">
                <div class="row">
                    <div class="text-center col-md-4 col-sm-4">
                        <h3 class="minustopmarg">Facility Name</h3>
                    </div>
                    <div class="text-center col-md-8 col-sm-8">
                        <asp:TextBox CssClass="form-control" ID="TextBoxFacilityName1" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="text-center col-md-4 col-sm-4 col-md-offset-2 col-sm-offset-2">
                        <asp:Button CssClass="btn btn-success btn-block full" ID="Button3" runat="server" onclick="Button3_Click" Text="Add" Width="96px" />
                    </div>
                    <div class="text-center col-md-4 col-sm-4">
                        <button class="btn btn-success btn-block">Clear All</button>
                    </div>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                </div>
            </div><!-- ./canistercontainer -->
        </div><!-- ./canister -->

        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
        DeleteCommand="DELETE FROM [Facility] WHERE [facilityID] = @facilityID" 
        InsertCommand="INSERT INTO [Facility] ([facilityID], [facilityName]) VALUES (@facilityID, @facilityName)" 
        SelectCommand="SELECT [facilityID], [facilityName] FROM [Facility]" 
        
        UpdateCommand="UPDATE [Facility] SET [facilityName] = @facilityName WHERE [facilityID] = @facilityID">
            <DeleteParameters>
                <asp:Parameter Name="facilityID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="facilityID" Type="Int32" />
                <asp:Parameter Name="facilityName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="facilityName" Type="String" />
                <asp:Parameter Name="facilityID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br/>

        <asp:GridView ID="GridView3" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="facilityID" 
            DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None" 
            Width="927px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="facilityID" HeaderText="facilityID" 
                    SortExpression="facilityID" />
                <asp:BoundField DataField="facilityName" HeaderText="facilityName" 
                    SortExpression="facilityName" />
            </Columns>
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#CC0066" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <br/>

        <div class="tablecontainer">
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
            InsertCommand="INSERT INTO [Facility] ([facilityID], [facilityName]) VALUES (@facilityID, @facilityName)" 
        
            SelectCommand="SELECT [facilityID], [facilityName] FROM [Facility]">
            <InsertParameters>
                <asp:Parameter Name="facilityID" Type="Int32" />
                <asp:Parameter Name="facilityName" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

        </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Panel ID="Panel4" runat="server">
        <!-- Add Facility in Room -->
        <div class="canister">
            <div class="canistertitle">
                <h2>Add Facility in a Room</h2>
            </div>
            <div class="canistercontainer">
                <div class="row">
                    <div class="text-center col-md-4 col-sm-4">
                        <h3 class="minustopmarg">Room Name</h3>
                    </div>
                    <div class="text-center col-md-8 col-sm-8">
                        <asp:TextBox CssClass="form-control" ID="TextBoxRoomName2" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="text-center col-md-4 col-sm-4">
                        <h3 class="minustopmarg">Facility Name</h3>
                    </div>
                    <div class="text-center col-md-8 col-sm-8">
                        <asp:TextBox CssClass="form-control" ID="TextBoxFacilityName2" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="text-center col-md-4 col-sm-4 col-md-offset-2 col-sm-offset-2">
                        <asp:Button CssClass="btn btn-success btn-block full" ID="Button4" runat="server" onclick="Button4_Click" Text="Add" Width="96px" />
                    </div>
                    <div class="text-center col-md-4 col-sm-4">
                        <button class="btn btn-success btn-block">Clear All</button>
                    </div>
                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                </div>
            </div><!-- ./canistercontainer -->
        </div><!-- ./canister -->

        <asp:SqlDataSource ID="SqlDataSource7" runat="server"
        ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
        DeleteCommand="DELETE FROM [RoomFacilities] WHERE [roomID] = @roomID AND [facilityID] = @facilityID"
        InsertCommand="INSERT INTO [RoomFacilities] ([roomID], [facilityID]) VALUES (@roomID, @facilityID)" 
        SelectCommand="SELECT [Room].[roomID], [roomName], [Facility].[facilityID], [Facility].[facilityName] FROM [Room] INNER JOIN [RoomFacilities] ON Room.[roomID] = [RoomFacilities].[roomID] INNER JOIN [Facility] ON [RoomFacilities].[facilityID] = [Facility].[facilityID]" >

            <DeleteParameters>
                <asp:Parameter Name="facilityID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="roomID" Type="Int32" />
                <asp:Parameter Name="facilityID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br/>

        <asp:GridView ID="GridView4" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="facilityID" 
            DataSourceID="SqlDataSource7" ForeColor="#333333" GridLines="None" 
            Width="927px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="roomID" HeaderText="roomID" 
                    SortExpression="roomID" />
                <asp:BoundField DataField="roomName" HeaderText="roomName" 
                    SortExpression="roomName" />
                <asp:BoundField DataField="facilityID" HeaderText="facilityID" 
                    SortExpression="facilityID" />
                <asp:BoundField DataField="facilityName" HeaderText="facilityName" 
                    SortExpression="facilityName" />
            </Columns>
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#CC0066" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <br/>

        <div class="tablecontainer">
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
            InsertCommand="INSERT INTO [RoomFacilities] ([roomID], [facilityID]) VALUES (@roomID, @facilityID)" 
            SelectCommand="SELECT [Room].[roomID], [roomName], [Facility].[facilityID], [Facility].[facilityName] FROM [Room] INNER JOIN [RoomFacilities] ON [Room].[roomID] = [RoomFacilities].[roomID] INNER JOIN [Facility] ON [RoomFacilities].[facilityID] = [Facility].[facilityID]" >

            <InsertParameters>
                <asp:Parameter Name="roomID" Type="Int32" />
                <asp:Parameter Name="facilityID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>

        </div>
    </asp:Panel>
</asp:Content>
