Imports System.Data.SqlClient
Partial Class changepass
    Inherits System.Web.UI.Page
    Dim cn As SqlConnection
    Dim cmd As SqlCommand
    Dim rdr As SqlDataReader
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If (Application("dept") = "ADMIN") Then
            Panel1.Visible = True
            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim rdr As SqlDataReader
            cn = New SqlConnection()
            cn.ConnectionString = Application("constr")
            cmd = New SqlCommand("select * from USERPASS where not department='ADMIN'", cn)
            cn.Open()
            userddl.Items.Add("[ SELECT USER ]")
            userddl.Items.Add(Application("username"))
            rdr = cmd.ExecuteReader()
            While (rdr.Read())
                userddl.Items.Add(rdr.GetString(0))
            End While
            cn.Close()
            seluserlbl.Visible = False
            oldpasspnl.Visible = False
            userddl.Visible = False
            newpass1txt.Visible = False
            newpasstxt.Visible = False
            Label1.Visible = False
            Label2.Visible = False
            Button1.Visible = False
            unamelbl.Visible = False
            Button1.Enabled = False
        Else
            Panel1.Visible = False
            seluserlbl.Text = Application("username")
            userddl.Visible = False
            Button1.Enabled = True
        End If


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Application("username") = "") Then
            Response.Redirect("~/login.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim user As String
        Dim flag As Boolean
        flag = 0
        If Application("dept") = "ADMIN" Then
            user = userddl.SelectedValue
            flag = 1
        Else
            user = Application("username")
            cn = New SqlConnection(Application("constr"))
            cmd = New SqlCommand("select * from USERPASS", cn)
            cn.Open()
            rdr = cmd.ExecuteReader()
            While (rdr.Read() And flag = False)
                If user = rdr.GetString(0).Trim And oldpasstxt.Text = rdr.GetString(1).Trim Then
                    flag = 1
                End If
            End While
            cn.Close()
        End If
        If flag = 0 Then
            resultlbl.Text = "Old Password Incorrect "
            resultlbl.Visible = True
            Exit Sub
        Else
            cn = New SqlConnection(Application("constr"))
            cmd = New SqlCommand("update USERPASS set password = '" + newpass1txt.Text + "' where username = '" + user + "';", cn)
            cn.Open()
            cmd.ExecuteNonQuery()
            resultlbl.Text = " User : " + user + " Password has been Changed Successfully"
            resultlbl.Visible = True
            cn.Close()

        End If

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim user As String
        Dim flag As Boolean
        flag = 0
        user = Application("username")
        cn = New SqlConnection(Application("constr"))
        cmd = New SqlCommand("select * from USERPASS", cn)
        cn.Open()
        rdr = cmd.ExecuteReader()
        While (rdr.Read() And flag = False)
            If user = rdr.GetString(0).Trim And adminpasstxt.Text = rdr.GetString(1).Trim Then
                flag = True
                Exit While
            End If
        End While
        If flag = True Then
            Panel1.Visible = False
            userddl.Visible = True
            newpass1txt.Visible = True
            newpasstxt.Visible = True
            Label1.Visible = True
            Label2.Visible = True
            Button1.Visible = True
            unamelbl.Visible = True
        Else
            adresl.Text = "Invalid Admin Password"
        End If
    End Sub

    Protected Sub userddl_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles userddl.SelectedIndexChanged
        If userddl.SelectedIndex <> 0 Then
            Button1.Enabled = True
        Else
            Button1.Enabled = False
        End If
    End Sub

    Protected Sub oldpasstxt_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles oldpasstxt.TextChanged
    End Sub
End Class
