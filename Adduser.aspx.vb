Imports System.Data.SqlClient

Partial Class Adduser
    Inherits System.Web.UI.Page
    Dim cn As SqlConnection
    Dim cmd As SqlCommand
    Dim rdr As SqlDataReader

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        cn = New SqlConnection()
        cn.ConnectionString = Application("constr")
        cmd = New SqlCommand("select * from department", cn)
        cn.Open()
        DEPTSEL.Items.Add("[ SELECT DEPT. ]")
        DEPTSEL.Items.Add("ADMIN")
        rdr = cmd.ExecuteReader()
        While (rdr.Read())
            DEPTSEL.Items.Add(rdr.GetString(0))
        End While
        cn.Close()
        Button1.Enabled = False
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        cn = New SqlConnection()
        cn.ConnectionString = Application("constr")
        cn.open()
        cmd = New SqlCommand("Select * from USERPASS where username = '" + usertxt.Text + "'", cn)
        rdr = cmd.ExecuteReader()
        If (rdr.Read()) Then
            Label3.Text = "Username Already Exists"
            Label3.Visible = True
        Else
            cn = New SqlConnection()
            cn.ConnectionString = Application("constr")
            Dim str As String
            str = "insert into USERPASS values ('" + usertxt.Text + "','" + passtxt.Text + "','" + DEPTSEL.SelectedValue + "')"
            cmd = New SqlCommand(str, cn)
            cn.Open()
            cmd.ExecuteNonQuery()
            cn.Close()
            pnl_ack.Visible = True
            lbl_uadded.Text = " USER : " + usertxt.Text + " Added Successfully."
            pnl_main.Visible = False
        End If
    End Sub

    Protected Sub DEPTSEL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DEPTSEL.SelectedIndexChanged
        If (DEPTSEL.SelectedIndex = 0) Then
            Button1.Enabled = False
        Else
            Button1.Enabled = True
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label3.Visible = False
    End Sub

    Protected Sub btn_ok_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_ok.Click
        pnl_ack.Visible = False
        pnl_main.Visible = True
    End Sub

    Protected Sub usertxt_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles usertxt.TextChanged
        cn = New SqlConnection()
        cn.ConnectionString = Application("constr")
        cn.Open()
        cmd = New SqlCommand("Select * from USERPASS where username = '" + usertxt.Text + "'", cn)
        rdr = cmd.ExecuteReader()
        If (rdr.Read()) Then
            Label3.Text = "Username Already Exists"
            Label3.Visible = True
        Else
            Label3.Visible = False
        End If


    End Sub
End Class
