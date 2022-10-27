<%@ Page Title="" Language="C#" MasterPageFile="~/employee/emp-master.master" AutoEventWireup="true" CodeFile="add-rq-loan.aspx.cs" Inherits="employee_add_rq_loan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
     <title>Admin | Add Loan Request </title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="d-flex flex-row justify-content-between">
<h4 class="fw-bold py-3 mb-4 align-self-baseline"><span class="text-muted fw-light">Loan/</span>Add Loan Request</h4>
    <asp:Label ID="lbl_title" Text="" CssClass="text-muted fw-light fs-3" runat="server" />
<a class="btn btn-primary align-self-baseline" href="loan.aspx">Back</a>
</div>
        <%--form body start--%>
    <div class="row">
    <div class="col-md-12">
    <div class="card mb-4">
     <h5 class="card-header">Add Loan Request</h5>
      <div class="card-body">


          <%-- emp leave type category,start date ,end date --%>
                      <div class="col-md-12  d-flex flex-row mt-3">                           
                       <div class="col-md-4 d-flex flex-column  me-3">
                  <label for="defaultSelect" class="form-label">Loan Amount</label>
                   <asp:TextBox ID="tb_ln_amount"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Loan Amount" 
                       required />                        
                    </div>

                               <div class="col-md-4 d-flex flex-column  ms-3">
                  <label for="defaultSelect" class="form-label">Repayment Date</label>
                   <asp:TextBox ID="tb_ln_repayment_date"  CssClass="form-control" runat="server" TextMode="Date"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Select Repayment Date" 
                       required />                        
                    </div>
                                
                        
                          </div>
          <%--  --%>
             <%-- emp addresss--%>
            <div class="col-md-12  d-flex flex-row ">
                  <div class="col-md-10 d-flex flex-column ">

                   <label for="defaultSelect" class="form-label mt-3">Reason</label>
                   <asp:TextBox ID="tb_ln_reason" MaxLength="100"  CssClass="form-control" runat="server" placeholder="enter reason for loan"  data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="enter maximum 100 length"   TextMode="MultiLine" required />      

                  </div>
                    </div>
          <%--  --%>
            <%-- emp submit form btn--%>
             <div class="col-md-12  d-flex flex-row mt-3">
                 <div class="d-flex flex-row justify-content-end">
                     <asp:Button runat="server" ID="btn_ln_rq_submit" CssClass="btn btn-primary mt-3" Text="Submit" OnClick="btn_ln_rq_submit_Click" />
                     </div>
                 </div>
            <%--  --%>

          </div>
        </div>
        </div>
        </div>

</asp:Content>

