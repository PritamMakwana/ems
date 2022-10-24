<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_sidebar.master" AutoEventWireup="true" CodeFile="update-employee.aspx.cs" Inherits="admin_update_employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Admin | Update Employee </title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
<div class="d-flex flex-row justify-content-between">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Employee/</span>Update Employee</h4>
<a class="btn btn-primary align-self-baseline" href="employee.aspx">Back</a>
</div>

    <%--form body start--%>
    <div class="row">
    <div class="col-md-12">
    <div class="card mb-4">
     <h5 class="card-header">Add Employee</h5>
      <div class="card-body">

            <%-- emp basic info --%>
           <%-- emp name,mobile --%>
            <div class="col-md-12  d-flex flex-row ">
                  <div class="col-md-5 d-flex flex-column me-2">

                  <label for="defaultSelect" class="form-label">Employee Name</label>
                  <asp:TextBox ID="tb_emp_name"  MaxLength="100" CssClass="form-control" runat="server" placeholder="employee name"
                       data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Employee Name" required/>

                  </div>

                  <div class="col-md-5 d-flex flex-column">

                  <label for="defaultSelect" class="form-label">Mobile No </label>
                   <asp:TextBox ID="tb_emp_mobile"  MaxLength="13"  CssClass="form-control" runat="server" placeholder="employee mobile number"   TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter 10 Number"
                       required />                        
                   <asp:RegularExpressionValidator ID="rev_mobile" runat="server" ControlToValidate="tb_emp_mobile"
                       ErrorMessage="enter 10 digits" ForeColor="Red" ValidationExpression="^[0-9]{10}" />

                    </div>
            </div>


            <%-- emp email,password --%>
            <div class="col-md-12  d-flex flex-row ">
                  <div class="col-md-5 d-flex flex-column me-2">

                   <label for="defaultSelect" class="form-label">Email</label>
                   <asp:TextBox ID="tb_emp_email" MaxLength="100"  CssClass="form-control" runat="server" placeholder="example@email.com"   TextMode="Email"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="this email using employee login"
                       required />                       

                  </div>

                  <div class="col-md-5 d-flex flex-column">

                        <label class="form-label" for="basic-default-password12">Password</label>
                       
                             <asp:TextBox ID="tb_emp_pwd" MaxLength="50"  CssClass="form-control" 
                                 runat="server" 
                                 placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"   
                                  data-bs-toggle="tooltip"
                                  data-bs-offset="0,4" 
                                 data-bs-placement="top" 
                                 data-bs-html="true" 
                                 title="this password using employee login"
                                  required />       
                        </div>
                    </div>

           <%-- emp addresss--%>
            <div class="col-md-12  d-flex flex-row ">
                  <div class="col-md-10 d-flex flex-column ">

                   <label for="defaultSelect" class="form-label mt-3">Address</label>
                   <asp:TextBox ID="tb_emp_address" MaxLength="200"   CssClass="form-control" runat="server" placeholder="enter employee address"   data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="enter 200 maximum length"   TextMode="MultiLine" required />                        

                  </div>
                    </div>
           
           <%-- emp dob,gender,doj--%>
            <div class="col-md-12  d-flex flex-row mt-3">
                  <div class="col-md-3 d-flex flex-column me-2">

                   <label for="defaultSelect" class="form-label">Date of Brith</label>
                   <asp:TextBox ID="tb_emp_dob"  CssClass="form-control" runat="server" TextMode="Date"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Select Employee Brith Date"
                       required />                        

                  </div>

                  <div class="col-md-3 d-flex flex-column me-2 ">

                        <label class="form-label ms-3" for="basic-default-password12">gender</label>
                        <div class="form-check  form-check-inline">
                         <asp:RadioButton ID="rb_emp_male" Checked="true" Text="Male" runat="server" GroupName="gender"
                             CssClass="form-check-label form-control me-3" />
                          <asp:RadioButton ID="rb_emp_female" Text="Female" runat="server" GroupName="gender" CssClass="form-check-label form-control" />
                          </div>
                         
                        </div>

                 <div class="col-md-2 d-flex flex-column me-2">

                   <label for="defaultSelect" class="form-label">Date of Join</label>
                   <asp:TextBox ID="tb_emp_join_date"  CssClass="form-control" runat="server" TextMode="Date"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Employee Join Date "
                       required />                        

                  </div>

                    </div>

            <%-- emp dp,dv --%>
            <div class="col-md-12  d-flex flex-row mt-3">
                 
                  <div class="col-md-5 d-flex flex-column me-2">

                       <label for="defaultSelect" class="form-label">Department</label>
                           <asp:DropDownList  class="form-select" ID="tb_emp_dp" runat="server" AutoPostBack="true" 
                                data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Select Employee Department"
                       OnSelectedIndexChanged="tb_emp_dp_SelectedIndexChanged"
                       required>
                           </asp:DropDownList>       
                        </div>

          
            <div class="col-md-5 d-flex flex-column">

                       <label for="defaultSelect" class="form-label">Division</label>
                           <asp:DropDownList  class="form-select" ID="tb_emp_dv" runat="server" AutoPostBack="true" 
                                data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Department Select After Employee Division Select"
                       required>
                           </asp:DropDownList>       
                        </div>
                    </div>
          <%--  --%>
          <%-- emp type,basic salary  --%>
                      <div class="col-md-12  d-flex flex-row mt-3">
                            <div class="col-md-4 d-flex flex-column">

                       <label for="defaultSelect" class="form-label">Employee Type</label>
                           <asp:DropDownList  class="form-select" ID="tb_emp_type" runat="server" AutoPostBack="true" 
                                data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Select Employee Type"
                       required>
                               <asp:ListItem>Permanent</asp:ListItem>
                               <asp:ListItem>Provision</asp:ListItem>
                           </asp:DropDownList>       
                        </div>
                           
                       <div class="col-md-4 d-flex flex-column  ms-3">
                  <label for="defaultSelect" class="form-label">Basic Salary</label>
                   <asp:TextBox ID="tb_emp_basic_sal"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Employee Basic Salary" placeholder="0"
                       required />                        
                    </div>
                                
                        
                          </div>
          <%--  --%>



             <%-- emp house aw,madical aw,special aw --%>
             <div class="col-md-12  d-flex flex-row mt-3">

                    <div class="col-md-3 d-flex flex-column mt-3 ">
                  <label for="defaultSelect" class="form-label">Houserent Allowance</label>
                   <asp:TextBox ID="tb_emp_house_aw"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Employee Houserent Allowance" placeholder="0"
                       required />                        
                    </div>

          
             <div class="col-md-3 d-flex flex-column mt-3 ms-3">
                  <label for="defaultSelect" class="form-label">Madical Allowance</label>
                   <asp:TextBox ID="tb_emp_madical_aw"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Employee Madical Allowance" placeholder="0"
                       required />                        
                    </div>

                  <div class="col-md-3 d-flex flex-column mt-3 ms-3">
                  <label for="defaultSelect" class="form-label">Special Allowance</label>
                   <asp:TextBox ID="tb_emp_special_aw"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Employee Special Allowance" placeholder="0"
                       required />                        
                    </div>

                   </div>
          <%--  --%>

           <%-- emp fuel aw,phone bill aw,other aw --%>
             <div class="col-md-12  d-flex flex-row mt-3">

                    <div class="col-md-3 d-flex flex-column mt-3 ">
                  <label for="defaultSelect" class="form-label">Fuel Allowance</label>
                   <asp:TextBox ID="tb_emp_fuel_aw"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Employee Fuel Allowance" placeholder="0"
                       required />                        
                    </div>

          
             <div class="col-md-3 d-flex flex-column mt-3 ms-3">
                  <label for="defaultSelect" class="form-label">Phone Bill Allowance</label>
                   <asp:TextBox ID="tb_emp_phone_bill_aw"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Employee Phone Bill Allowance" placeholder="0"
                       required />                        
                    </div>

                  <div class="col-md-3 d-flex flex-column mt-3 ms-3">
                  <label for="defaultSelect" class="form-label">Other Allowance</label>
                   <asp:TextBox ID="tb_other_aw"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Employee Other Allowance" placeholder="0"
                       required />                        
                    </div>

                   </div>
          <%--  --%>

            <%-- emp pf aw,tax dd,other dd --%>
             <div class="col-md-12  d-flex flex-row mt-3">

                    <div class="col-md-3 d-flex flex-column mt-3 ">
                  <label for="defaultSelect" class="form-label">Provident Fund</label>
                  <asp:TextBox ID="tb_emp_tax_pf"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Employee Provident Fund" placeholder="0"
                       required />                     
                    </div>

          
             <div class="col-md-3 d-flex flex-column mt-3 ms-3">
                  <label for="defaultSelect" class="form-label">Tax Deduction</label>
                   <asp:TextBox ID="tb_emp_tax_dd"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Employee Tax Deduction" placeholder="0"
                       required />                        
                    </div>

                  <div class="col-md-3 d-flex flex-column mt-3 ms-3">
                  <label for="defaultSelect" class="form-label">Other Deduction</label>
                  <asp:TextBox ID="tb_emp_other_tax_dd"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Employee Other Deduction" placeholder="0"
                       required />                      
                    </div>

                   </div>
          <%--  --%>
        
            <%-- emp calculate --%>
           <div class="col-md-12  d-flex flex-row mt-3">
                 <div class="d-flex flex-row justify-content-end">
                     <asp:Button runat="server" ID="btn_cal" CssClass="btn btn-primary mt-3" Text="Calculate Salary" OnClick="btn_cal_Click" />
                     </div>
                 </div>

           <%-- emp gross,total,net sal --%>
             <div class="col-md-12  d-flex flex-row mt-3">

                    <div class="col-md-3 d-flex flex-column mt-3 ">
                  <label for="defaultSelect" class="form-label">Gross Salary</label>
                   <asp:TextBox ID="tb_emp_gross_sal"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Show Employee Gross Salary" placeholder="0"
                       ReadOnly="true"
                       required />                        
                    </div>

          
             <div class="col-md-3 d-flex flex-column mt-3 ms-3">
                  <label for="defaultSelect" class="form-label">Total Deduction</label>
                   <asp:TextBox ID="tb_emp_total_dd"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Show Employee Total Deduction" placeholder="0"
                        ReadOnly="true"
                       required />                        
                    </div>

                  <div class="col-md-3 d-flex flex-column mt-3 ms-3">
                  <label for="defaultSelect" class="form-label">Net Salary</label>
                   <asp:TextBox ID="tb_emp_net_sal"  CssClass="form-control" runat="server" TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Show Employee Net Salary" placeholder="0"
                        ReadOnly="true"
                       required />                        
                    </div>

                   </div>
          <%--  --%>

      

            <%-- emp submit form btn--%>
             <div class="col-md-12  d-flex flex-row mt-3 justify-content-between">
                
                     <asp:Button runat="server" ID="btn_emp_submit" CssClass="btn btn-primary mt-3" Text="Update" OnClick="btn_emp_submit_Click" />
                     
                  <asp:Button runat="server" ID="btn_emp_delete" CssClass="btn btn-danger mt-3" Text=" Delete Employee" OnClick="btn_emp_delete_Click"  OnClientClick='javascript:return confirm("Are you sure you want to this employee delete ?")' />
                    
                 </div>
            <%--  --%>

            



              </div>
        </div>
    </div>
        </div>
     <%--form body end--%>


</asp:Content>

