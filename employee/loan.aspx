<%@ Page Title="" Language="C#" MasterPageFile="~/employee/emp-master.master" AutoEventWireup="true" CodeFile="loan.aspx.cs" Inherits="employee_loan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
     <title>Employee | Loan </title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="d-flex flex-row justify-content-between">
<h4 class="fw-bold py-3 mb-4 align-self-baseline"><span class="text-muted fw-light">Loan</span></h4>
<asp:Label ID="lbl_title" Text="" CssClass="text-danger fw-bold fs-3" runat="server"  />
<div class="d-flex flex-row justify-content-between">
<a class="btn btn-primary align-self-baseline me-3" href="add-rq-loan.aspx">Add Loan Request</a>
<a class="btn btn-primary align-self-baseline" href="my-loan.aspx">My Loan</a>
</div>
</div>

     <!-- Basic Bootstrap Table -->
                <div class="card">
                <h5 class="card-header">Loan Request</h5>
                     
                <div class="table-responsive text-nowrap">
                <asp:Repeater ID="rpt_loan_show" runat="server" OnItemDataBound="rpt_loan_show_ItemDataBound" OnItemCommand="rpt_loan_show_ItemCommand" >  
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
                  <td>  
                        <asp:LinkButton ID="ln_delete" 
                            runat="server" 
                            CssClass="btn btn-danger"
                            CommandName="delete" 
                            OnClientClick='javascript:return confirm("Are you sure you want to delete Loan Request ?")'
   CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ln_id") %>'
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

