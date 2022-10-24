<%@ Page Title="" Language="C#" MasterPageFile="~/employee/emp-master.master" AutoEventWireup="true" CodeFile="add-leave.aspx.cs" Inherits="employee_add_leave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
        <title>Admin | Add Leave </title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="d-flex flex-row justify-content-between">
<h4 class="fw-bold py-3 mb-4 align-self-baseline"><span class="text-muted fw-light">Leave/</span>Add Leave</h4>
    <asp:Label ID="lbl_title" Text="" CssClass="text-muted fw-light fs-3" runat="server" />
<a class="btn btn-primary align-self-baseline" href="leave.aspx">Back</a>
</div>
        <%--form body start--%>
    <div class="row">
    <div class="col-md-12">
    <div class="card mb-4">
     <h5 class="card-header">Add Leave</h5>
      <div class="card-body">


          <%-- emp leave type category,start date ,end date --%>
                      <div class="col-md-12  d-flex flex-row mt-3">
                            <div class="col-md-4 d-flex flex-column">

                       <label for="defaultSelect" class="form-label">Leave Type</label>
                           <asp:DropDownList  class="form-select" ID="tb_lv_type" runat="server" AutoPostBack="true" 
                                data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Select Leave Type"
                       required>
                               <asp:ListItem>Holidays</asp:ListItem>
                               <asp:ListItem>Casual Leave</asp:ListItem>
                                <asp:ListItem>Sick Leave</asp:ListItem>
                                <asp:ListItem>Maternity Leave</asp:ListItem>
                                <asp:ListItem>Quarantine Leave</asp:ListItem>
                           </asp:DropDownList>       
                        </div>
                           
                       <div class="col-md-3 d-flex flex-column  ms-3">
                  <label for="defaultSelect" class="form-label">Start Date</label>
                   <asp:TextBox ID="tb_lv_start_date"  CssClass="form-control" runat="server" TextMode="Date"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Select Leave Start Date" 
                       required />                        
                    </div>

                               <div class="col-md-3 d-flex flex-column  ms-3">
                  <label for="defaultSelect" class="form-label">End Date</label>
                   <asp:TextBox ID="tb_lv_end_date"  CssClass="form-control" runat="server" TextMode="Date"
                     data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="Select Leave End Date" 
                       required />                        
                    </div>
                                
                        
                          </div>
          <%--  --%>
             <%-- emp addresss--%>
            <div class="col-md-12  d-flex flex-row ">
                  <div class="col-md-10 d-flex flex-column ">

                   <label for="defaultSelect" class="form-label mt-3">Reason</label>
                   <asp:TextBox ID="tb_lv_reason" MaxLength="100"  CssClass="form-control" runat="server" placeholder="enter reason for Leave"  data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" 
                       title="enter maximum 100 length"   TextMode="MultiLine" required />      

                  </div>
                    </div>
          <%--  --%>
            <%-- emp submit form btn--%>
             <div class="col-md-12  d-flex flex-row mt-3">
                 <div class="d-flex flex-row justify-content-end">
                     <asp:Button runat="server" ID="btn_lv_submit" CssClass="btn btn-primary mt-3" Text="Submit" OnClick="btn_lv_submit_Click" />
                     </div>
                 </div>
            <%--  --%>

          </div>
        </div>
        </div>
        </div>

</asp:Content>

