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
                <asp:Repeater ID="rpt_dp" runat="server" OnItemDataBound="rpt_dp_ItemDataBound">  
            <HeaderTemplate>  
               <table class="table">
                    <thead>
                      <tr>
                        <th>Show</th>
                        <th>Department</th>
                        <th>Divisions Number</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                </HeaderTemplate>
                     <ItemTemplate>  
                <tr>  
                       <td>
                    <img alt="" style="cursor: pointer" src="../resource/img/icons/plus.png" />
                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                        <asp:Repeater ID="rpt_dv" runat="server" OnItemCommand="rpt_dv_ItemCommand">
                            <HeaderTemplate>
                                <table class="table" >
                                    <tr>
                                        <th>No</th>
                                        <th>Division</th>
                                        <th>Action</th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                  
                                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%#Container.ItemIndex + 1 %></strong></td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.dv_name")%>  
                                    </td>
                                     <td>
                                      <asp:LinkButton ID="dv_delete" 
                            runat="server" 
                            CssClass="btn btn-danger"
                            CommandName="delete" 
                            OnClientClick='javascript:return confirm("Are you sure you want to delete")'
   CommandArgument='<%# DataBinder.Eval(Container.DataItem, "dv_id") %>'
                            >Delete</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:HiddenField ID="hf_dp_id" runat="server" Value='<%# Eval("dp_id") %>' />
                     
                </td>
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.dp_name")%>  
                    </td>  
                     <td>  
                        <%#DataBinder.Eval(Container,"DataItem.dp_division")%>  
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

       <script type="text/javascript" src="../resource/library/jquery-3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        $("body").on("click", "[src*=plus]", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "../resource/img/icons/minus.png");
        });
        $("body").on("click", "[src*=minus]", function () {
            $(this).attr("src", "../resource/img/icons/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>

</asp:Content>

