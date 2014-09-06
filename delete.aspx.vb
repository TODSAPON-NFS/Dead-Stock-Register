Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Web
Partial Class delete
    Inherits System.Web.UI.Page
    Dim cn As SqlConnection
    Dim cmd As SqlCommand
    Dim adap As SqlDataAdapter
    Dim ds As DataSet
    Dim sqlcn As String
   
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim sqlcmd, sqlcn As String
        sqlcmd = Application("delcmd")
        sqlcn = Application("constr")
        cn = New SqlConnection(sqlcn)
        cmd = New SqlCommand(sqlcmd, cn)
        adap = New SqlDataAdapter(sqlcmd, cn)
        ds = New DataSet
        cn.Open()
        adap.Fill(ds, "Main_table")
        cn.Close()
        DetailsView1.DataSource = ds
        DetailsView1.DataBind()
    End Sub


    Protected Sub btn_delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_delete.Click
        Try
            Dim a As Integer
            sqlcn = Application("constr")
            cn = New SqlConnection(sqlcn)
            cmd = New SqlCommand("delete from MAIN where group_id = " + ds.Tables("MAIN_table").Rows(0).Item(0).ToString, cn)
            cn.Open()
            cmd.ExecuteNonQuery()
            cn.Close()
            cn = New SqlConnection(sqlcn)
            cmd = New SqlCommand("delete from dsr_MAIN where group_id = " + ds.Tables("MAIN_table").Rows(0).Item(0).ToString, cn)
            cn.Open()
            a = cmd.ExecuteNonQuery()
            cn.Close()
            Application("msg") = a.ToString + " RECORDS DELeTED"
            Response.Redirect("~/Welcome.aspx")
        Catch ex As Exception

        End Try
    End Sub
End Class
