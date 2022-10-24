<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_sidebar.master" AutoEventWireup="true" CodeFile="employee.aspx.cs" Inherits="admin_employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Admin | Employee </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div class="d-flex flex-row justify-content-between">
<h4 class="fw-bold py-3 mb-4 align-self-baseline"><span class="text-muted fw-light">Employee</span></h4>
    <asp:Label ID="lbl_title" Text="" CssClass="text-muted fw-light fs-3" runat="server"  />
<a class="btn btn-primary align-self-baseline" href="add-employee.aspx">Add Employee</a>
</div>


          <!-- Basic Bootstrap Table -->
                <div class="card">
                <h5 class="card-header">Employee List</h5>
                <div class="table-responsive text-nowrap">
                <asp:Repeater ID="rpt_emp_show" runat="server" OnItemDataBound="rpt_emp_show_ItemDataBound">  
            <HeaderTemplate>  
               <table class="table">
                    <thead>
                      <tr>
                        <th>Show</th>
                        <th>No</th>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Division</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                </HeaderTemplate>
                     <ItemTemplate>  
                <tr>  
                       <td>
                    <img alt="" style="cursor: pointer" src="../resource/img/icons/plus.png" />
                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                        <asp:Repeater ID="rpt_emp_full_show" runat="server" OnItemCommand="rpt_emp_full_show_ItemCommand">
                            <HeaderTemplate>
                                <table class="table" >
                                   
                            </HeaderTemplate>
                            <ItemTemplate>
                             
                                     <td>
                                     Mobile 
                                    </td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_mobile")%>  
                                    </td>
                                    
                                          </tr>

                                      <td>
                                     Email 
                                    </td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_email")%>  
                                    </td>
                                    </tr>
                                    <td>
                                    Password 
                                    </td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_pwd")%>  
                                    </td>
                                          </tr>
                                      <td>
                                     Address
                                    </td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_address")%>  
                                    </td>
                                    </tr>
                                    <td>
                                     Date of birth 
                                    </td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_dob")%>  
                                    </td>
                                     
                                          </tr>
                                      <td>
                                     Gender 
                                    </td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_gender")%>  
                                    </td>
                                     </tr>

                                     <td>
                                     Join Date
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_join_date")%>  
                                     </td>
                                     </tr>
                                      <td>
                                     Employee type 
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_type")%>  
                                     </td>
                                     </tr>
                                      <td>
                                     Basic Salary
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_basic_sal")%>  
                                     </td>
                                     </tr>
                                      <td>
                                     Houserent Allowance
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_house_aw")%>  
                                     </td>
                                     </tr>
                                
                                      <td>
                                     Madical Allowance
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_madical_aw")%>  
                                     </td>
                                     </tr>

                                  <td>
                                    Special Allowance
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_special_aw")%>  
                                     </td>
                                     </tr>

                                  <td>
                                     Fuel Allowance
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_fuel_aw")%>  
                                     </td>
                                     </tr>

                                  <td>
                                    Phone Bill Allowance
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_phone_bill_aw")%>  
                                     </td>
                                     </tr>

                                  <td>
                                     Other Allowance
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_other_aw")%>  
                                     </td>
                                     </tr>

                                  <td>
                                     Provident Fund
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_pf")%>  
                                     </td>
                                     </tr>

                                  <td>
                                    Tax Deduction
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_tax_dd")%>  
                                     </td>
                                     </tr>

                                 <td>
                                    Other Deduction
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_other_dd")%>  
                                     </td>
                                     </tr>

                                 <td>
                                    Gross Sarary
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_gross_sal")%>  
                                     </td>
                                     </tr>

                                 <td>
                                   Total Deduction
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_total_dd")%>  
                                     </td>
                                     </tr>

                                <td>
                                   Net Salary
                                     </td>
                                     <td>
                                      <%#DataBinder.Eval(Container,"DataItem.emp_net_sal")%>  
                                     </td>
                                     </tr>



                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:HiddenField ID="emp_id" runat="server" Value='<%# Eval("emp_id") %>' />
                     
                </td>
                    <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%#Container.ItemIndex + 1 %></strong></td>
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.emp_id")%>  
                    </td>  
                     <td>  
                        <%#DataBinder.Eval(Container,"DataItem.emp_name")%>  
                    </td>
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.emp_department")%>  
                    </td>
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.emp_division")%>  
                    </td>
                    <td>
                                      <a ID="emp_update"   
                            class="btn btn-danger"
                           href="update-employee.aspx?id=<%# DataBinder.Eval(Container.DataItem, "emp_id") %>"
                            >Update</a>
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

