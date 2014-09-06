Imports System.Data.SqlClient

Partial Class Login
    Inherits System.Web.UI.Page
    Dim dept As String
    Dim constr As String
    Dim cn As SqlConnection
    Dim cmd As SqlCommand

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Response.CacheControl.Remove(0, Cache.Count)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cn = New SqlConnection()
        cn.ConnectionString = Application("constr")
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim rdr As sqlDataReader
        Dim flag As Boolean
        'Dim str2 As String
        flag = False
        cmd = New SqlCommand("select * from USERPASS", cn)
        cn.Open()
        rdr = cmd.ExecuteReader()
        While (rdr.Read() And flag = False)
            If txtusername.Text = rdr.GetString(0).Trim And txtpassword.Text = rdr.GetString(1).Trim Then
                Application("dept") = rdr.GetString(2)
                Application("username") = rdr.GetString(0)
                flag = True
            End If
        End While

        If (flag = False) Then
            Label3.text = "* invalid username or password"
        Else
            Application("msg") = "WELCOME TO DSR MANAGEMENT"
            Response.Redirect("~\Welcome.aspx")
        End If
    End Sub
End Class
