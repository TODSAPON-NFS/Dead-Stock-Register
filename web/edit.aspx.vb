Imports System.Data.SqlClient
Imports System.Data

Partial Class Edit
    Inherits System.Web.UI.Page
    'declarations
    Dim cn As SqlConnection
    Dim adap As SqlDataAdapter
    Dim rdr As SqlDataReader
    Dim cmd As SqlCommand
    Dim ds As DataSet
    Dim qty As Integer
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        For i = 1999 To Now.Year
            YYYY.Items.Add(i)
            yyyyp.Items.Add(i)
        Next
        For i = 1 To 12
            mm.Items.Add(i)
            mmp.Items.Add(i)
        Next
        For i = 1 To 31
            dd.Items.Add(i)
            ddp.Items.Add(i)
        Next
        If Application("dept") = "ADMIN" Then
            Dept_name.Visible = True
            dept.Visible = False
            cn = New SqlConnection()
            cn.ConnectionString = Application("constr")
            cmd = New SqlCommand("select * from DEPARTMENT", cn)
            cn.Open()
            rdr = cmd.ExecuteReader()
            While (rdr.Read())
                Dept_name.Items.Add(rdr.GetString(0))
            End While
            cn.Close()
            cmd = New SqlCommand("select * from component", cn)
            cn.Open()
            cmpnt.Enabled = True
            cmpnt.Items.Clear()
            rdr = cmd.ExecuteReader()
            While (rdr.Read())
                If (rdr.GetString(0) = Dept_name.SelectedValue) Then
                    cmpnt.Items.Add(rdr.GetString(1))
                End If
            End While
            cn.Close()
        Else
            Dept_name.Visible = False
            dept.Visible = True
            dept.Text = Application("dept")
            cn = New SqlConnection(Application("constr"))
            cmd = New SqlCommand("select * from component", cn)
            cn.Open()
            rdr = cmd.ExecuteReader()
            cmpnt.Items.Clear()
            cmpnt.Enabled = True
            While (rdr.Read())
                If (rdr.GetString(0) = Application("dept")) Then
                    cmpnt.Items.Add(rdr.GetString(1))
                End If
            End While
            cn.Close()
        End If
        ddl_dsr.Enabled = False
        cn = New SqlConnection(Application("constr"))
        cmd = New SqlCommand("select group_id,quantity_received from MAIN where group_id in (select max(group_id) from MAIN)", cn)
        cn.Open()
        rdr = cmd.ExecuteReader()
        If (rdr.Read) Then
            If (Val(rdr.GetSqlValue(0).ToString) > Application("group_id")) Then
                quantity_box.Enabled = False
            Else
                qty = Val(rdr.GetSqlValue(1).ToString)
                quantity_box.Enabled = True
            End If
        End If
        cn = New SqlConnection(Application("constr"))
        cmd = New SqlCommand("select * from MAIN where group_id =" + Application("group_id"), cn)
        Dim dte As Date
        cn.Open()
        rdr = cmd.ExecuteReader()
        If rdr.Read Then
            grp_id_box.Text = rdr("group_id")
            dte = rdr("date_of_purchase")
            ddp.SelectedIndex = dte.Day - 1
            mmp.SelectedIndex = dte.Month - 1
            yyyyp.SelectedIndex = dte.Year - 1999
            quantity_box.Text = rdr("quantity_received").ToString
            cmpnt.Text = rdr("component_name").ToString
            details_box.Text = rdr("component_details").ToString
            details_box.TextMode = TextBoxMode.MultiLine
            cmpny_box.Text = rdr("company_name").ToString
            cmpny_add_box.Text = rdr("company_address").ToString
            cmpny_add_box.TextMode = TextBoxMode.MultiLine
            billno_box.Text = rdr("bill_no").ToString
            dte = rdr("bill_date")
            dd.SelectedIndex = dte.Day - 1
            mm.SelectedIndex = dte.Month - 1
            YYYY.SelectedIndex = dte.Year - 1999
            rate_box.Text = rdr("rate").ToString
            excise_box.Text = rdr("excise_duty").ToString
            salestax_box.Text = rdr("sales_tax").ToString
            xtra_box.Text = rdr("extra_charges").ToString
            cost_box.Text = rdr("cost").ToString
            cost_box.Enabled = False
            total_box.Text = rdr("total_cost").ToString
            total_box.Enabled = False
            If (Application("USERNAME") = "ADMIN") Then
                Dept_name.Text = rdr("department").ToString
            Else
                dept.Text = rdr("department").ToString
            End If
        End If
            cn.Close()
            cn = New SqlConnection(Application("constr"))
            cmd = New SqlCommand("select dsr_no from dsr_main where group_id =" + Application("group_id"), cn)
            cn.Open()
            rdr = cmd.ExecuteReader()
            While (rdr.Read)
                ddl_dsr.Items.Add(rdr.GetSqlValue(0).ToString)
            End While
            cn.Close()
    End Sub


    Protected Sub updt_btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updt_btn.Click

            Dim cmdtxt As String
        cn = New SqlConnection(Application("constr"))
        If (rbl_grpind.SelectedIndex = 0) Then
            cmdtxt = "update MAIN set updated_on='" + Date.Now.ToShortDateString.ToString + "',updated_by='" + Application("username") + "'"
            cmdtxt = cmdtxt + ",quantity_received=" + quantity_box.Text
            cmdtxt = cmdtxt + ",component_name = '" + cmpnt.SelectedValue + "'"
            cmdtxt = cmdtxt + ",component_details='" + details_box.Text + "'"
            If (Application("dept") = "ADMIN") Then
                cmdtxt = cmdtxt + ",department='" + Dept_name.SelectedValue + "'"
            Else
                cmdtxt = cmdtxt + ",department='" + dept.Text + "'"
            End If
            cmdtxt = cmdtxt + ",date_of_purchase='" + ddp.Text + "-" + mmp.Text + "-" + yyyyp.Text + "'"
            cmdtxt = cmdtxt + ",company_name='" + cmpny_box.Text + "'"
            cmdtxt = cmdtxt + ",company_address='" + cmpny_add_box.Text + "'"
            cmdtxt = cmdtxt + ",bill_no='" + billno_box.Text + "'"
            cmdtxt = cmdtxt + ",bill_date= '" + dd.Text + "-" + mm.Text + "-" + YYYY.Text + "'"
            cmdtxt = cmdtxt + ",rate=" + rate_box.Text
            cmdtxt = cmdtxt + ",excise_duty=" + excise_box.Text
            cmdtxt = cmdtxt + ",sales_tax=" + salestax_box.Text
            cmdtxt = cmdtxt + ",cost=" + cost_box.Text
            cmdtxt = cmdtxt + " where group_id=" + Application("group_id")
            cn = New SqlConnection(Application("constr"))
            cmd = New SqlCommand(cmdtxt, cn)
            cn.Open()
            cmd.ExecuteNonQuery()
            cn.Close()
            If (Not loctn_box.Text = "" Or Not rmrks_box.Text = "") Then
                cmdtxt = "update dsr_main set updated_on='" + Date.Now.ToShortDateString + "',updated_by='" + Application("username") + "'"
                cmdtxt = cmdtxt + ",location ='" + loctn_box.Text + "'"
                cmdtxt = cmdtxt + ",remarks ='" + rmrks_box.Text + "'"
                cmdtxt = cmdtxt + " where group_id=" + Application("group_id")
                cn = New SqlConnection(Application("constr"))
                cmd = New SqlCommand(cmdtxt, cn)
                cn.Open()
                cmd.ExecuteNonQuery()
                cn.Close()
            End If
            If (quantity_box.Enabled = True) Then
                If (qty > Val(quantity_box.Text)) Then
                    cn = New SqlConnection(Application("constr"))
                    qty = Application("group_id") + Val(quantity_box.Text)
                    cmdtxt = "delete from dsr_main where dsr_no >=" + qty.ToString
                    cmd = New SqlCommand(cmdtxt, cn)
                    cn.Open()
                    cmd.ExecuteNonQuery()
                    cn.Close()
                ElseIf (qty < Val(quantity_box.Text)) Then
                    Dim i As Integer
                    While (qty < Val(quantity_box.Text))
                        i = Application("group_id") + qty
                        cn = New SqlConnection(Application("constr"))
                        cmdtxt = "insert into dsr_main values("
                        cmdtxt = cmdtxt + i.ToString + ","
                        cmdtxt = cmdtxt + "'" + loctn_box.Text + "',"
                        cmdtxt = cmdtxt + "'" + rmrks_box.Text + "',"
                        cmdtxt = cmdtxt + "'" + Date.Now.ToShortDateString.ToString + "',"
                        cmdtxt = cmdtxt + "'" + Application("username") + "',"
                        cmdtxt = cmdtxt + Application("group_id").ToString + ")"
                        cmd = New SqlCommand(cmdtxt, cn)
                        cn.Open()
                        cmd.ExecuteNonQuery()
                        cn.Close()
                        qty = qty + 1
                    End While
                End If
            End If
        Else
            cmdtxt = "update dsr_main set updated_on='" + Date.Now.ToShortDateString.ToString + "',updated_by='" + Application("username") + "'"
            cmdtxt = cmdtxt + ",location ='" + loctn_box.Text + "'"
            cmdtxt = cmdtxt + ",remarks ='" + rmrks_box.Text + "'"
            cmdtxt = cmdtxt + " where dsr_no=" + ddl_dsr.SelectedValue
            cn = New SqlConnection(Application("constr"))
            cmd = New SqlCommand(cmdtxt, cn)
            cn.Open()
            cmd.ExecuteNonQuery()
            cn.Close()
        End If
        Application("msg") = "RECORD UPDATED"
        Response.Redirect("~/Welcome.aspx")

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            cost_box.Text = (Val(quantity_box.Text) * Val(rate_box.Text)).ToString
            total_box.Text = (Val(cost_box.Text) + Val(salestax_box.Text) + Val(excise_box.Text) + Val(xtra_box.Text)).ToString
        End If
    End Sub
    Protected Sub YYYY_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles YYYY.SelectedIndexChanged
        Dim maxdays, a As Integer
        a = dd.SelectedIndex
        If (mm.SelectedValue = 2) Then
            If (YYYY.SelectedValue Mod 4 = 0) Then
                maxdays = 29
            Else
                maxdays = 28
            End If
            dd.Items.Clear()
            For i = 1 To maxdays
                dd.Items.Add(i)
            Next
        Else
            maxdays = dd.Items.Count
        End If
        If (a + 1 > maxdays) Then
            dd.SelectedIndex = maxdays - 1
        Else
            dd.SelectedIndex = a
        End If
    End Sub

    Protected Sub yyyyp_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles yyyyp.SelectedIndexChanged
        Dim maxdays, a As Integer
        a = ddp.SelectedIndex
        If (mmp.SelectedValue = 2) Then
            If (yyyyp.SelectedValue Mod 4 = 0) Then
                maxdays = 29
            Else
                maxdays = 28
            End If
            ddp.Items.Clear()
            For i = 1 To maxdays
                ddp.Items.Add(i)
            Next
        Else
            maxdays = ddp.Items.Count
        End If
        If (a + 1 > maxdays) Then
            ddp.SelectedIndex = maxdays - 1
        Else
            ddp.SelectedIndex = a
        End If
    End Sub

    Protected Sub mm_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles mm.SelectedIndexChanged
        Dim a, maxdays, b As Integer
        b = dd.SelectedIndex
        a = mm.SelectedValue
        If a = 1 Or a = 3 Or a = 5 Or a = 7 Or a = 8 Or a = 10 Or a = 12 Then
            maxdays = 31
        ElseIf a = 4 Or a = 6 Or a = 9 Or a = 11 Then
            maxdays = 30
        Else
            If (YYYY.SelectedValue Mod 4 = 0) Then
                maxdays = 29
            Else
                maxdays = 28
            End If
        End If
        dd.Items.Clear()
        For i = 1 To maxdays
            dd.Items.Add(i)
        Next
        If (b + 1 > maxdays) Then
            dd.SelectedIndex = maxdays - 1
        Else
            dd.SelectedIndex = b
        End If
    End Sub

    Protected Sub mmp_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles mmp.SelectedIndexChanged
        Dim a, maxdays, b As Integer
        b = ddp.SelectedIndex
        a = mmp.SelectedValue
        If a = 1 Or a = 3 Or a = 5 Or a = 7 Or a = 8 Or a = 10 Or a = 12 Then
            maxdays = 31
        ElseIf a = 4 Or a = 6 Or a = 9 Or a = 11 Then
            maxdays = 30
        Else
            If (yyyyp.SelectedValue Mod 4 = 0) Then
                maxdays = 29
            Else
                maxdays = 28
            End If
        End If
        ddp.Items.Clear()
        For i = 1 To maxdays
            ddp.Items.Add(i)
        Next
        If (b + 1 > maxdays) Then
            ddp.SelectedIndex = maxdays - 1
        Else
            dd.SelectedIndex = b
        End If
    End Sub

    Protected Sub rbl_grpind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbl_grpind.SelectedIndexChanged
        If (rbl_grpind.SelectedIndex = 1) Then
            ddl_dsr.Enabled = True
            pdat.Enabled = False
            quantity_box.Enabled = False
            cmpnt.Enabled = False '
            details_box.Enabled = False
            cmpny_box.Enabled = False
            cmpny_add_box.Enabled = False
            billno_box.Enabled = False
            dat.Enabled = False
            rate_box.Enabled = False
            excise_box.Enabled = False
            salestax_box.Enabled = False
            xtra_box.Enabled = False
            If (Application("dept") = "ADMIN") Then
                Dept_name.Enabled = False
            End If
            cn = New SqlConnection(Application("constr"))
            cmd = New SqlCommand("select location,remarks from dsr_main where dsr_no =" + ddl_dsr.SelectedValue, cn)
            cn.Open()
            rdr = cmd.ExecuteReader()
            If (rdr.Read) Then
                loctn_box.Text = rdr.GetSqlString(0)
                rmrks_box.Text = rdr.GetSqlString(1)
            End If
            cn.Close()
        Else
            ddl_dsr.Enabled = False
            pdat.Enabled = True
            quantity_box.Enabled = True
            cmpnt.Enabled = True
            details_box.Enabled = True
            cmpny_box.Enabled = True
            cmpny_add_box.Enabled = True
            billno_box.Enabled = True
            dat.Enabled = True
            rate_box.Enabled = True
            xtra_box.Enabled = True
            excise_box.Enabled = True
            salestax_box.Enabled = True
            If (Application("dept") = "ADMIN") Then
                Dept_name.Enabled = True
            End If
        End If
    End Sub

    Protected Sub ddl_dsr_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddl_dsr.SelectedIndexChanged
        cn = New SqlConnection(Application("constr"))
        cmd = New SqlCommand("select location,remarks from dsr_main where dsr_no =" + ddl_dsr.SelectedValue, cn)
        cn.Open()
        rdr = cmd.ExecuteReader()
        If (rdr.Read) Then
            loctn_box.Text = rdr.GetSqlString(0)
            rmrks_box.Text = rdr.GetSqlString(1)
        End If
        cn.Close()
    End Sub
    Protected Sub Dept_name_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Dept_name.SelectedIndexChanged
        cmd = New SqlCommand("select * from component", cn)
        cn.Open()
        rdr = cmd.ExecuteReader()
        cmpnt.Items.Clear()
        While (rdr.Read())
            If (rdr.GetString(0) = Dept_name.SelectedValue) Then
                cmpnt.Items.Add(rdr.GetString(1))
            End If
        End While
        cn.Close()
    End Sub
End Class
