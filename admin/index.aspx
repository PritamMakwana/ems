<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_sidebar.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <title>Admin | Dashboard </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

              <div class="row">
                <div class="col-lg-8 mb-4 order-0">
                  <div class="card">
                      <a href="employee.aspx" >
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-7">
                        <div class="card-body">
                          <h3 class="card-title text-primary">Employees</h3>
                          <p class="mb-4 fs-1 text-primary">
                             <asp:Label CssClass="mb-2" runat="server" ID="lbl_emp_count" Text="" /> 
                          </p>    
                        </div>
                      </div>
                      <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                          <img
                            src="../resource/img/illustrations/man-with-laptop-light.png"
                            height="140"
                            alt="View Badge User"
                            data-app-dark-img="illustrations/man-with-laptop-dark.png"
                            data-app-light-img="illustrations/man-with-laptop-light.png"
                          />
                        </div>
                      </div>
                    </div>
                     </a>
                  </div>
                  </div>
                


                
                    <div class="col-lg-4 md-4 order-1">
                      <div class="card">    
                           <a href="department.aspx" >       
                        <div class="card-body">
                           <h3 class="card-title text-success">Departments</h3>
                             <p class="mb-4 fs-1 text-success">
                             <asp:Label CssClass="mb-2" runat="server" ID="lbl_dp_count" Text="" /> 
                          </p>   
                        </div>
                                 </a>
                      </div>
                    </div>

      </div>
    <%-- second row --%>

      <div class="row">

           <div class="col-lg-4 md-4 order-1">
                      <div class="card">    
                           <a href="leave.aspx" >       
                        <div class="card-body">
                           <h3 class="card-title text-info">Leave Request</h3>
                             <p class="mb-4 fs-1 text-info">
                             <asp:Label CssClass="mb-2" runat="server" ID="lbl_leave_rq" Text="" /> 
                          </p>   
                        </div>
                        </a>
                      </div>
                    </div>

            <div class="col-lg-4 md-4 order-1">
                      <div class="card">    
                           <a href="loan.aspx" >       
                        <div class="card-body">
                           <h3 class="card-title text-warning">Loan Request</h3>
                             <p class="mb-4 fs-1 text-warning">
                             <asp:Label CssClass="mb-2" runat="server" ID="lbl_loan_rq" Text="" /> 
                          </p>   
                        </div>
                        </a>
                      </div>
                    </div>

                 <div class="col-lg-4 md-4 order-1">
                      <div class="card">    
                           <a href="approve-loan.aspx" >       
                        <div class="card-body">
                           <h3 class="card-title text-danger">Loan Approved</h3>
                             <p class="mb-4 fs-1 text-danger">
                             <asp:Label CssClass="mb-2" runat="server" ID="lbl_loan_approved" Text="" /> 
                          </p>   
                        </div>
                        </a>
                      </div>
                    </div>

          </div>



</asp:Content>

