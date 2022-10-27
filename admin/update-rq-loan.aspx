<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_sidebar.master" AutoEventWireup="true" CodeFile="update-rq-loan.aspx.cs" Inherits="admin_update_rq_loan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
            <title>Admin | Update Loan Request </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div class="d-flex flex-row justify-content-between">
<h4 class="fw-bold py-3 mb-4 align-self-baseline"><span class="text-muted fw-light">Loan/</span>Update Loan Request</h4>
    <asp:Label ID="lbl_title" Text="" CssClass="text-muted fw-light fs-3" runat="server" />
<a class="btn btn-primary align-self-baseline" href="loan.aspx">Back</a>
</div>


            <%--form body start--%>
    <div class="row">
    <div class="col-md-12">
    <div class="card mb-4">
     <h5 class="card-header">Update Leave</h5>
      <div class="card-body">
                    <%-- emp name ,id--%>
          <div class="col-md-12  d-flex flex-row mt-3">
                <div class="col-md-3 d-flex flex-column me-3">
                       <label for="defaultSelect" class="form-label">Employee Id</label>
                  <asp:TextBox ID="tb_emp_id" CssClass="form-control" runat="server" ReadOnly="true"/>    
                        </div>

                            <div class="col-md-5 d-flex flex-column">
                       <label for="defaultSelect" class="form-label">Employee Name</label>
                  <asp:TextBox ID="tb_emp_name" CssClass="form-control" runat="server" ReadOnly="true"/>    
                        </div>
              </div>

          <%-- apply date ,repayment date, amount--%>
                      
                                   <div class="col-md-12  d-flex flex-row mt-3">
  
                       <div class="col-md-3 d-flex flex-column ">
                     <label for="defaultSelect" class="form-label">Apply Date</label>
                  <asp:TextBox ID="tb_ln_apply_date" CssClass="form-control" runat="server" ReadOnly="true"/>                  
                    </div>

                     <div class="col-md-3 d-flex flex-column  ms-3">
                  <label for="defaultSelect" class="form-label">Amount</label>
                   <asp:TextBox ID="tb_ln_amount"  CssClass="form-control" runat="server" ReadOnly="true" />                        
                    </div>
                                 <div class="col-md-3 d-flex flex-column ms-3">
                     <label for="defaultSelect" class="form-label">Repayment Date</label>
                  <asp:TextBox ID="tb_ln_repayment_date" CssClass="form-control" runat="server" ReadOnly="true"/>                  
                    </div>   
                        
                          </div>
          <%--  --%>
         
           <%-- reason--%>
           <div class="col-md-12  d-flex flex-row mt-3">             
                       <div class="col-md-10 d-flex flex-column ">
                     <label for="defaultSelect" class="form-label">Reason</label>
                  <asp:TextBox ID="tb_ln_reason" CssClass="form-control" TextMode="MultiLine" runat="server" ReadOnly="true"/>                  
                    </div>
                </div>
          <%--  --%>

           <%-- status--%>
           <div class="col-md-12  d-flex flex-row mt-3">             
                         <div class="col-md-4 d-flex flex-column">

                       <label for="defaultSelect" class="form-label">Status</label>
                           <asp:DropDownList  class="form-select" ID="ln_status" runat="server" AutoPostBack="true" 
                                data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Select respons your choose"
                       required>
                               <asp:ListItem>Apporve</asp:ListItem>
                               <asp:ListItem>Reject</asp:ListItem>
                           </asp:DropDownList>       
                        </div>
                </div>
          <%--  --%>


            <%-- emp submit form btn--%>
             <div class="col-md-12  d-flex flex-row mt-3">
                 <div class="d-flex flex-row justify-content-end">
                     <asp:Button runat="server" ID="btn_ln_submit" CssClass="btn btn-primary mt-3" Text="Submit" OnClick="btn_ln_submit_Click" />
                     </div>
                 </div>
            <%--  --%>

          </div>
        </div>
        </div>
        </div>

</asp:Content>

