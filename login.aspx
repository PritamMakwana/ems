<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>EMS | Log in</title>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="resource/img/logo/EMS-Logo.png" />

    <!-- Fonts -->
    <link
      href="resource/vendor/fonts/googlefont.css"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="resource/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="resource/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="resource/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="resource/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="resource/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="resource/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="resource/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="resource/js/config.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>


         <!-- Content -->

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href="index.html" class="app-brand-link gap-2">
                 <span class="app-brand-logo demo">
                     <asp:Image ID="logo" runat="server" ImageUrl="~/resource/img/logo/EMS-Logo.png" Height="100"  />
                    </span>
                </a>
              </div>
              <!-- /Logo -->
              <h4 class="mb-2">Welcome to ems! 👋</h4>
              <p class="mb-4">Please log-in to your account and start the managment</p>
                <div class="mb-3">
                  <label for="email" class="form-label">Email</label>
                    <asp:TextBox runat="server" 
                        ID="l_email" 
                        CssClass="form-control" 
                        TextMode="Email" 
                        placeholder="Enter your email "
                        autofocus
                        required/>
                </div>
                <div class="mb-3 form-password-toggle">
                  <div class="d-flex justify-content-between">
                    <label class="form-label" for="password">Password</label>
                  </div>
                  <div class="input-group input-group-merge">
                       <asp:TextBox runat="server" 
                        ID="l_pwd" 
                        CssClass="form-control" 
                        TextMode="Password" 
                        placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                        required/>
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                </div>
                <div class="mb-3">
                  <asp:Button ID="log_in" runat="server" CssClass="btn btn-primary d-grid w-100" Text="Log in" OnClick="log_in_Click"  />
                </div>
                 <div class="mb-3" id="err_msg"  runat="server">
                     <%--<asp:Label CssClass="text-danger" ID="lbl_err_msg" runat ="server" />--%>
                 </div>
            </div>
          </div>
          <!-- /Register -->
        </div>
      </div>
    </div>

    <!-- / Content -->



    
    </div>
    </form>
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="resource/vendor/libs/jquery/jquery.js"></script>
    <script src="resource/vendor/libs/popper/popper.js"></script>
    <script src="resource/vendor/js/bootstrap.js"></script>
    <script src="resource/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="resource/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="resource/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="resource/js/button.js"></script>
</body>
</html>
