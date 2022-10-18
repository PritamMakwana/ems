<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_sidebar.master" AutoEventWireup="true" CodeFile="division.aspx.cs" Inherits="admin_division" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>Admin | Division</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <!-- Content wrapper -->
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Division</span></h4>

              <!-- Basic Layout & Basic with Icons -->
              <div class="row">

     <!-- Basic Layout -->
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0">Division From</h5>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">

                          <div class="col-sm-10 d-flex flex-row">

                           <div class="col-sm-5 d-flex flex-column me-3">
                           <label for="defaultSelect" class="form-label">Select Department</label>
                           <asp:DropDownList  class="form-select" ID="select_dp" runat="server" AutoPostBack="true">
                           </asp:DropDownList>
                           </div>

                            <div class="col-sm-5 d-flex flex-column">
                            <label for="defaultSelect" class="form-label">Division name </label>
                            <asp:TextBox ID="tb_dv_name" CssClass="form-control" runat="server" placeholder="Division Name" />
                            </div>

                          </div>
                        </div>    
                        <div class="row justify-content-end">
                          <div class="col-sm-1">
                            <asp:Button runat="server" CssClass="btn btn-primary" ID="btn_add_dv" Text="Add" OnClick="btn_add_dv_Click"/>
                          </div>
                        </div>
                    </div>
                  </div>
                </div>
                  
                  </div>
                   <!-- Basic Layout end -->
                   <!-- Basic Bootstrap Table -->
                <div class="card">
                <h5 class="card-header">Departments List</h5>
                <div class="table-responsive text-nowrap">
                <asp:Repeater ID="rp_dp_with_dv_list" runat="server">  
            <HeaderTemplate>  
               <table class="table">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Department</th>
                        <th>Number of Divisions</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                </HeaderTemplate>
                     <ItemTemplate>  
                <tr>  
                     <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%#Container.ItemIndex + 1 %></strong></td>
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.dp_name")%>  
                    </td>  
                     <td>  
                        <%#DataBinder.Eval(Container,"DataItem.dp_division")%>  
                    </td>  
                    <td>  
                        <asp:LinkButton ID="dp_delete" 
                            runat="server" 
                            CssClass="btn btn-danger"
                            CommandName="delete" 
                            OnClientClick='javascript:return confirm("Are you sure you want to delete")'
   CommandArgument='<%# DataBinder.Eval(Container.DataItem, "dp_id") %>'
                            >Delete</asp:LinkButton>
                    </td>  
                </tr>  
            </ItemTemplate> 
                      <FooterTemplate>   
                </tbody>
                  </table>  
            </FooterTemplate>
                </asp:Repeater>
                </div>
                    </div>


              <!--/ Basic Bootstrap Table -->





                </div>

</asp:Content>

