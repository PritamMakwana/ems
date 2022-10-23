<%@ Page Title="" Language="C#" MasterPageFile="~/employee/emp-master.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="employee_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
     <title>Employee | Details </title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
 <div class="d-flex flex-row justify-content-between">
<h4 class="fw-bold py-3 mb-4 align-self-baseline"><span class="text-muted fw-light">Employee Details</span></h4>
</div>


          <!-- Basic Bootstrap Table -->
                <div class="card">
                <h5 class="card-header">Employee Details</h5>
                <div class="table-responsive text-nowrap">
                <asp:Repeater ID="rpt_emp_show" runat="server" OnItemDataBound="rpt_emp_show_ItemDataBound">  
            <HeaderTemplate>  
               <table class="table">
                    <thead>
                      <tr>
                        <th>Show</th>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Division</th>  
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                </HeaderTemplate>
                     <ItemTemplate>  
                <tr>  
                       <td>
                    <img alt="" style="cursor: pointer" src="../resource/img/icons/plus.png" />
                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                        <asp:Repeater ID="rpt_emp_full_show" runat="server" >
                            <HeaderTemplate>
                                <table class="table" >
                                   
                            </HeaderTemplate>
                            <ItemTemplate>
                             
                                     <td >
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
                                     Date of Birth 
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
                </td>
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

