Imports System.Data.SqlClient
Partial Class delcmpnt
    Inherits System.Web.UI.Page
    Dim cn As SqlConnection
    Dim cmd As SqlCommand
    Dim rdr As SqlDataReader

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        cn = New SqlConnection()
        cn.ConnectionString = Application("constr")
        cmd = New SqlCommand("select * from DEPARTMENT", cn)
        cn.Open()
        deptddl.Items.Add("[ SELECT DEPT. ]")
        rdr = cmd.ExecuteReader()
        While (rdr.Read())
            deptddl.Items.Add(rdr.GetString(0))
        End While
        cn.Close()
        cmpntddl.Enabled = False
        delbtn.Enabled = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub cmpntddl_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmpntddl.SelectedIndexChanged
        If (cmpntddl.SelectedIndex <> 0) Then
            delbtn.Enabled = True
        Else
            delbtn.Enabled = False
        End If
    End Sub

    Protected Sub deptddl_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles deptddl.SelectedIndexChanged
        If (deptddl.SelectedIndex <> 0) Then
            cmpntddl.Items.Clear()
            cn = New SqlConnection()
            cn.ConnectionString = Application("constr")
            cmd = New SqlCommand("select * from component where department = " + "'" + deptddl.SelectedValue + "'" + "and component NOT in (select component_name from MAIN) ", cn)
            cn.Open()
            cmpntddl.Items.Add("[SELECT COMPONENT]")
            rdr = cmd.ExecuteReader()
            While (rdr.Read())
                cmpntddl.Items.Add(rdr.GetString(1))
            End While
            cn.Close()
            cmpntddl.Enabled = True
            delbtn.Enabled = False
        Else
            cmpntddl.Enabled = False
            delbtn.Enabled = False
        End If
    End Sub

    Protected Sub delbtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delbtn.Click
        Dim yn As Integer
        yn = MsgBox(" Are you Sure Want to Delete Component-'" + cmpntddl.SelectedValue.ToString + "' From Dept.-'" + deptddl.SelectedValue + "' ?", MsgBoxStyle.YesNo, "Delete Component ?")
        If (yn = vbYes) Then
            cmd = New SqlCommand("delete from component where component='" + cmpntddl.SelectedValue.ToString + "'" + "and department = '" + deptddl.SelectedValue + "'", cn)
            cn.Open()
            cmd.ExecuteNonQuery()
            cn.Close()
            resullbl.Text = " Component-'" + cmpntddl.SelectedValue + "' Department-'" + deptddl.SelectedValue + "' Deleted Successfully "
            deptddl_SelectedIndexChanged(sender, e)
        End If
    End Sub
End Class
