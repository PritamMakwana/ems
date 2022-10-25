<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_sidebar.master" AutoEventWireup="true" CodeFile="leave.aspx.cs" Inherits="admin_leave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <title>Admin | View Leaves</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="d-flex flex-row justify-content-between">
<h4 class="fw-bold py-3 mb-4 align-self-baseline"><span class="text-muted fw-light">Leave</span></h4>
           <asp:Label ID="lbl_title" Text="" CssClass="text-danger fw-light fs-3" runat="server"  />
</div>

     <!-- Basic Bootstrap Table -->
                <div class="card">
                <h5 class="card-header">Leave List</h5>
                     
                <div class="table-responsive text-nowrap">
                <asp:Repeater ID="rpt_leave_show" runat="server" OnItemDataBound="rpt_leave_show_ItemDataBound" OnItemCommand="rpt_leave_show_ItemCommand" >  
            <HeaderTemplate>  
               <table class="table">
                    <thead>
                      <tr>
                        <th>Show</th>
                        <th>No</th>
                        <th>Name</th>
                        <th>Leave Type</th>
                        <th>Apply Date</th>
                        <th>Status</th>
                        <th>Action</th>
                        <th>Delete</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                </HeaderTemplate>
                     <ItemTemplate>  
                <tr>  
                       <td>
                              <img alt="" style="cursor: pointer" src="../resource/img/icons/plus.png" />
                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                        <asp:Repeater ID="rpt_leave_full_show" runat="server">
                            <HeaderTemplate>
                                <table class="table" >
                                   
                            </HeaderTemplate>
                               <ItemTemplate>
                             
                                     <td class="fw-bold">
                                    Start Date
                                    </td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.lv_start_date")%>  
                                    </td>
                                   <tr/>
                                   <td class="fw-bold">
                                     End Date
                                    </td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.lv_end_date")%>  
                                    </td>
                                   <tr/>
                                   <td class="fw-bold">
                                     Reason 
                                    </td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.lv_reason")%>  
                                    </td>
                                   <tr/>


                                    </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:HiddenField ID="lv_id" runat="server" Value='<%# Eval("lv_id") %>' />
                             </td>
                    <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%#Container.ItemIndex + 1 %></strong></td>
                    <td >  
                       <%#DataBinder.Eval(Container,"DataItem.emp_name")%>  
                    </td>  
                     <td>  
                        <%#DataBinder.Eval(Container,"DataItem.lv_type")%>  
                    </td>
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.lv_apply_date")%>  
                    </td>
                    <td class="fw-bolder">  
                       <%#DataBinder.Eval(Container,"DataItem.lv_status")%>  
                    </td>
                  <td>  
                         <a ID="lv_update"   
                            class="btn btn-primary"
                           href="update-leave.aspx?id=<%# DataBinder.Eval(Container.DataItem, "lv_id") %>"
                            >Update</a>
                                    </td>
                          <td>  
                        <asp:LinkButton ID="lv_delete" 
                            runat="server" 
                            CssClass="btn btn-danger"
                            CommandName="delete" 
                            OnClientClick='javascript:return confirm("Are you sure you want to delete Leave ?")'
   CommandArgument='<%# DataBinder.Eval(Container.DataItem, "lv_id") %>'
                            >Delete</asp:LinkButton>
                    </td>  
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

