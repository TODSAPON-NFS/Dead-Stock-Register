Imports System.Data
Imports System.Data.SqlClient
Partial Class deluser
    Inherits System.Web.UI.Page
    Dim rdr As SqlDataReader
    Dim cn As SqlConnection
    Dim cmd As SqlCommand
    Dim rdr1 As SqlDataReader
    Dim cn1 As SqlConnection
    Dim cmd1 As SqlCommand

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        cn = New SqlConnection()
        cn.ConnectionString = Application("constr")
        cmd = New SqlCommand("select password from USERPASS where username ='" + Application("username") + "'", cn)
        cn.Open()
        rdr = cmd.ExecuteReader()
        invalidmsg.Visible = False
        cn1 = New SqlConnection(Application("constr"))
        cmd1 = New SqlCommand("select * from USERPASS", cn1)
        cn1.Open()
        rdr1 = cmd1.ExecuteReader()
        userddl.Items.Clear()
        userddl.Enabled = True
        userddl.Items.Add("[ Select User ]")
        While (rdr1.Read())
            If Not (rdr1.GetString(0) = Application("username")) Then
                userddl.Items.Add(rdr1.GetString(0))
            End If
        End While
        userddl.Enabled = False
        Button1.Enabled = False
        cn1.Close()
        resultlbl.Visible = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub submitbtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submitbtn.Click
        rdr.Read()
        If rdr.GetString(0) = TextBox1.Text Then
            invalidmsg.Visible = False
            userddl.Enabled = True
            pnl_showuser.Visible = True
            pnl_admin.Visible = False
        Else
            invalidmsg.Visible = True
            userddl.Enabled = False
            Button1.Enabled = False
            pnl_showuser.Visible = False
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim yn As Integer
        'msgbox is not running in IIS so disabled it.

        yn = vbYes
        'MsgBox("ARE YOU SURE YOU WANT TO DELETE USER:" + userddl.SelectedValue.ToString + "?", MsgBoxStyle.YesNo, "Delete User?")
        If (yn = vbYes) Then
            resultlbl.Visible = True
            resultlbl.Text = "User : " + userddl.SelectedValue + " has been deleted Successfully "
            cmd1 = New SqlCommand("delete from USERPASS where username='" + userddl.SelectedValue.ToString + "'", cn1)
            cn1.Open()
            cmd1.ExecuteNonQuery()
            cn1.Close()
            cn1 = New SqlConnection(Application("constr"))
            cmd1 = New SqlCommand("select * from USERPASS", cn1)
            cn1.Open()
            rdr1 = cmd1.ExecuteReader()
            userddl.Items.Clear()
            userddl.Enabled = True
            userddl.Items.Add("[ Select User ]")
            While (rdr1.Read())
                If Not (rdr1.GetString(0) = Application("username")) Then
                    userddl.Items.Add(rdr1.GetString(0))
                End If
            End While
        End If
    End Sub

    Protected Sub userddl_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles userddl.SelectedIndexChanged
        resultlbl.Visible = False
        If (userddl.SelectedIndex <> 0) Then
            Button1.Enabled = True
        Else
            Button1.Enabled = False
        End If
    End Sub
End Class
