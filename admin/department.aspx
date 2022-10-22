<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_sidebar.master" AutoEventWireup="true" CodeFile="department.aspx.cs" Inherits="admin_department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>Admin | Department</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Department</span></h4>

              <!-- Basic Layout & Basic with Icons -->
              <div class="row">

     <!-- Basic Layout -->
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0">Department From</h5>
                    </div>
                    <div class="card-body">

                        <div class="row mb-3">

                          <div class="col-sm-10">
                            <%--<input type="text" class="form-control" id="basic-default-name" placeholder="Department Name" />--%>
                            <asp:TextBox ID="dp_name" CssClass="form-control" runat="server" placeholder="Department Name" required/>
                          </div>
                        </div>    
                        <div class="row justify-content-start">
                          <div class="col-sm-10">
                            <%--<button type="submit" class="btn btn-primary">Add</button>--%>
                            <asp:Button runat="server" CssClass="btn btn-primary" ID="btn_add_dp" Text="Add" OnClick="btn_add_dp_Click"/>
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
                <asp:Repeater ID="rp_dp_list" runat="server" OnItemCommand="rp_dp_list_ItemCommand">  
            <HeaderTemplate>  
               <table class="table">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Department</th>
                        <th>Number of Divisions</th>
                        <th>Employees</th>
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
                                      <a ID="emp_show"   
                            class="btn btn-primary"
                           href="employee.aspx?dp=<%# DataBinder.Eval(Container.DataItem, "dp_name") %>"
                            >Show</a>
                                    </td> 
                    <td>  
                        <asp:LinkButton ID="dp_delete" 
                            runat="server" 
                            CssClass="btn btn-danger"
                            CommandName="delete" 
                            OnClientClick='javascript:return confirm("Are you sure you want to delete Department ?")'
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





</asp:Content>

