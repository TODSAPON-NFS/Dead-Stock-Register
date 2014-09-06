Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Web

Partial Class Showsearch
    Inherits System.Web.UI.Page
    Dim cn As SqlConnection
    Dim cmd As SqlCommand
    Dim adap As SqlDataAdapter
    Dim ds As DataSet
    Dim dt As DataTable
    Dim dr As DataRow
    Dim a, b As Integer
    Dim k As Integer
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim sqlcmd, sqlcn As String
        sqlcmd = Application("sqlcmd")
        nodata.Visible = False
        sqlcn = Application("constr")
        cn = New SqlConnection(sqlcn)
        cmd = New SqlCommand(sqlcmd, cn)
        adap = New SqlDataAdapter(sqlcmd, cn)
        ds = New DataSet
        cn.Open()
        adap.Fill(ds, "Main_table")
        cn.Close()
        dtgrd.DataSource = ds
        dtgrd.DataBind()
        If (ds.Tables("MAIN_table").Rows.Count = 0) Then
            nodata.Text = "------------- No Match Found -------------"
            nodata.Visible = True
        End If
    End Sub

    Public Sub btn_del_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_del.Click
        a = dtgrd.SelectedIndex + (dtgrd.PageIndex + 1) * dtgrd.PageCount
        If a >= 0 Then
            Dim str As String
            str = "select group_id,convert(varchar(10),date_of_purchase,105)as date_of_purchase"
            str = str + ",quantity_received,component_name,component_details,company_name,company_address"
            str = str + ",bill_no,convert(varchar(10),bill_date,105) as bill_date,rate,excise_duty,sales_tax,extra_charges,cost,total_cost,department"
            str = str + ",convert(varchar(10),updated_on,105) as updated_on,updated_by"
            str = str + " from MAIN  where group_id = " + ds.Tables("MAIN_table").Rows(a).Item(0).ToString
            Application("delcmd") = str
            Response.Redirect("~/delete.aspx")
        Else
            lbl_err.Text = "SELECT THE ROW TO DELETE"
        End If
    End Sub

    Protected Sub btn_updt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_updt.Click
        Try

            Application("group_id") = ds.Tables("Main_table").Rows(dtgrd.SelectedIndex + (dtgrd.PageIndex + 1) * dtgrd.PageCount).Item(0).ToString
            Response.Redirect("~/edit.aspx")
        Catch ex As Exception
            If dtgrd.SelectedIndex = -1 Then
                lbl_err.Text = "SELECT THE ROW TO BE UPDATED"
            End If
        End Try

    End Sub
    
    Protected Sub dtgrd_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles dtgrd.PageIndexChanging
        dtgrd.PageIndex = e.NewPageIndex
        dtgrd.DataBind()
    End Sub

  Protected Sub dtgrd_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles dtgrd.Sorting
        ds.Tables("MAIN_table").DefaultView.Sort = e.SortExpression
        dtgrd.DataSource = ds.Tables("MAIN_table")
        dtgrd.DataBind()
    End Sub


    Protected Sub btn_prnt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_prnt.Click
        dtgrd.AllowPaging = False
        dtgrd.DataBind()
    End Sub

    Protected Sub btn_prnt_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs) Handles btn_prnt.Command
        dtgrd.AllowPaging = True
        dtgrd.DataBind()
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btn_prnt.OnClientClick = "javascript:CallPrint('divprint')"
    End Sub
End Class
