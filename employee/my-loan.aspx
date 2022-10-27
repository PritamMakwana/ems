<%@ Page Title="" Language="C#" MasterPageFile="~/employee/emp-master.master" AutoEventWireup="true" CodeFile="my-loan.aspx.cs" Inherits="employee_my_loan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
     <title>Employee | My Loan </title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="d-flex flex-row justify-content-between">
<h4 class="fw-bold py-3 mb-4 align-self-baseline"><span class="text-muted fw-light">Loan/</span>My Loan</h4>
                       <asp:Label ID="lbl_title" Text="" CssClass=" text-danger fw-bold fs-3" runat="server"  /> 
<a class="btn btn-primary align-self-baseline" href="loan.aspx">Back</a>
</div>

      <!-- Basic Bootstrap Table -->
                <div class="card">
                <h5 class="card-header">My Loan </h5>
                     
                <div class="table-responsive text-nowrap">
                <asp:Repeater ID="rpt_loan_show" runat="server" OnItemDataBound="rpt_loan_show_ItemDataBound"  >  
            <HeaderTemplate>  
               <table class="table">
                    <thead>
                      <tr>
                        <th>Show</th>
                        <th>No</th>
                        <th>Name</th>
                        <th>Amount</th>
                        <th>Apply Date</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                </HeaderTemplate>
                     <ItemTemplate>  
                <tr>  
                       <td>
                              <img alt="" style="cursor: pointer" src="../resource/img/icons/plus.png" />
                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                        <asp:Repeater ID="rpt_loan_full_show" runat="server">
                            <HeaderTemplate>
                                <table class="table" >
                                   
                            </HeaderTemplate>
                               <ItemTemplate>
                             
                                      <td class="fw-bold">
                                    Repayment Date
                                    </td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.ln_repayment_date")%>  
                                    </td>
                                   <tr/>
                                   <td class="fw-bold">
                                     Reason 
                                    </td>
                                    <td>
                                      <%#DataBinder.Eval(Container,"DataItem.ln_reason")%>  
                                    </td>
                                   <tr/>


                                    </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:HiddenField ID="ln_id" runat="server" Value='<%# Eval("ln_id") %>' />
                             </td>
                    <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%#Container.ItemIndex + 1 %></strong></td>
                    <td >  
                       <%#DataBinder.Eval(Container,"DataItem.emp_name")%>  
                    </td>  
                     <td>  
                        <%#DataBinder.Eval(Container,"DataItem.ln_amount")%>  
                    </td>
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.ln_apply_date")%>  
                    </td>
                    <td class="fw-bolder">  
                       <%#DataBinder.Eval(Container,"DataItem.ln_status")%>  
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

