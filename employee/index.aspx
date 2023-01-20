<%@ Page Title="" Language="C#" MasterPageFile="~/employee/emp-master.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="employee_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
      <title>Employee | Dashboard </title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="row">
                <div class="col-lg-6 mb-4 order-0">
                  <div class="card">
                      <a href="detail.aspx" >
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-7">
                        <div class="card-body"> 
                            <div class="d-flex flex-column ">

                                <div class="d-flex flex-row">
                                     <p class="fs-5 card-title text-primary"> Id : </p>
                                     <asp:Label CssClass=" fs-5 ms-3 text-primary" runat="server" ID="lbl_emp_id" Text="" />
                                </div>

                                 <div class="d-flex flex-row">
                                     <p class="fs-5 card-title text-primary"> Name : </p>
                                     <asp:Label CssClass=" fs-5 ms-3 text-primary" runat="server" ID="lbl_emp_name" Text="" />
                                </div>

                                 <div class="d-flex flex-row">
                                     <p class="fs-5 card-title text-primary"> Email : </p>
                                     <asp:Label CssClass=" fs-5 ms-3 text-primary" runat="server" ID="lbl_emp_email" Text="" />
                                </div>

                            </div>
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
                


                
                    <div class="col-lg-6 md-4 order-1 ">
                      <div class="card">    
                           <a href="detail.aspx" >       
                        <div class="card-body mt-3 mb-3">
                             <div class="d-flex flex-column ">

                                <div class="d-flex flex-row">
                                     <p class="fs-4 card-title text-success"> Department : </p>
                                     <asp:Label CssClass=" fs-4 ms-3 text-success" runat="server" ID="lbl_dp" Text="" />
                                </div>

                                 <div class="d-flex flex-row">
                                     <p class="fs-4 card-title text-success"> Division : </p>
                                     <asp:Label CssClass=" fs-4 ms-3 text-success" runat="server" ID="lbl_dv" Text="" />
                                </div>
                            </div>   
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
                           <h3 class="card-title text-info">Leave </h3>
                             <p class="mb-4 fs-1 text-info">
                             <asp:Label CssClass="mb-2" runat="server" ID="lbl_leave" Text="" /> 
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
                           <a href="my-loan.aspx" >       
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

