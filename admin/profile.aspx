<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_sidebar.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="admin_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <title>Admin | Profile </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
<div class="d-flex flex-row justify-content-between">
<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Profile</h4>

<a class="btn btn-primary align-self-baseline" href="index.aspx">Back</a>
</div>

    <%--form body start--%>
    <div class="row">
    <div class="col-md-12">
    <div class="card mb-4">
     <h5 class="card-header">Profile Update</h5>
      <div class="card-body">

            <%-- emp basic info --%>
           <%-- emp name,mobile --%>
            <div class="col-md-12  d-flex flex-row ">
                  <div class="col-md-5 d-flex flex-column me-2">

                  <label for="defaultSelect" class="form-label">Name</label>
                  <asp:TextBox ID="tb_ad_name" CssClass="form-control" MaxLength="50" runat="server" placeholder="admin name"
                       data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter Admin Name" required/>

                  </div>

                  <div class="col-md-5 d-flex flex-column">

                  <label for="defaultSelect" class="form-label">Mobile No </label>
                   <asp:TextBox ID="tb_ad_mobile"  CssClass="form-control" MaxLength="13" runat="server" placeholder="Admin mobile number"   TextMode="Number"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Enter 10 Number"
                       required />                        
                   <asp:RegularExpressionValidator ID="rev_mobile" runat="server" ControlToValidate="tb_ad_mobile"
                       ErrorMessage="enter 10 digits" ValidationExpression="^[0-9]{10}" />

                    </div>
            </div>


            <%-- emp email,password --%>
            <div class="col-md-12  d-flex flex-row ">
                  <div class="col-md-5 d-flex flex-column me-2">

                   <label for="defaultSelect" class="form-label">Email</label>
                   <asp:TextBox ID="tb_ad_email" MaxLength="100"  CssClass="form-control" runat="server" placeholder="example@email.com"   TextMode="Email"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="this email using admin login"
                       required />                        

                  </div>

                  <div class="col-md-5 d-flex flex-column">

                        <label class="form-label" for="basic-default-password12">Password</label>
                       
                             <asp:TextBox ID="tb_ad_pwd" MaxLength="50"  CssClass="form-control" 
                                 runat="server" 
                                 placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"   
                                  data-bs-toggle="tooltip"
                                  data-bs-offset="0,4" 
                                 data-bs-placement="top" 
                                 data-bs-html="true" 
                                 title="this password using admin login"
                                  required />       
                        </div>
                    </div>
          <%--  --%>
            <%-- emp submit form btn--%>
             <div class="col-md-12  d-flex flex-row mt-3">
                 <div class="d-flex flex-row justify-content-end">
                     <asp:Button runat="server" ID="btn_ad_submit" CssClass="btn btn-primary mt-3" Text="Update" OnClick="btn_ad_submit_Click" />
                     </div>
                 </div>
            <%--  --%>
              </div>
        </div>
    </div>
     <%--form body end--%>


</asp:Content>

