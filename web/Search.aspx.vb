Imports System.Data.SqlClient
Imports System.Data

Partial Class Search
    Inherits System.Web.UI.Page
    Dim constr As String
    Dim cn As SqlConnection
    Dim cmd As SqlCommand
    Dim adap As SqlDataAdapter
    Dim rdr As SqlDataReader
    Dim ds As DataSet
    Dim dt As DataTable
    Dim flag As Boolean

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DEPTSEL.SelectedIndexChanged
        DEPTSEL.Items(0).Enabled = False
        cmd = New SqlCommand("select * from component", cn)
        cn.Open()
        rdr = cmd.ExecuteReader()
        compsel.Items.Clear()
        compsel.Enabled = True
        compsel.Items.Add("ALL")
        While (rdr.Read())
            If (DEPTSEL.SelectedValue = "ALL") Then
                compsel.Items.Add(rdr.GetString(1))
            ElseIf (rdr.GetString(0) = DEPTSEL.SelectedValue) Then
                compsel.Items.Add(rdr.GetString(1))
            End If
        End While
        cn.Close()

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        numoprtr.Visible = False
        dat.Visible = False
        TextBox1.Visible = True
        TextBox1.Enabled = False
        dtoprtr.Visible = False
        For i = 1999 To Now.Year
            yyyy.Items.Add(i)
        Next
        For i = 1 To 12
            mm.Items.Add(i)
        Next
        For i = 1 To 31
            dd.Items.Add(i)
        Next
        If Application("username") = "" Then
            Response.Redirect("~/login.aspx")
        End If
        If Application("dept") = "ADMIN" Then
            DEPTSEL.Visible = True
            dept.Visible = False
            cn = New SqlConnection()
            cn.ConnectionString = Application("constr")
            cmd = New SqlCommand("select * from DEPARTMENT", cn)
            cn.Open()
            DEPTSEL.Items.Add("[ SELECT DEPT. ]")
            DEPTSEL.Items.Add("ALL")
            rdr = cmd.ExecuteReader()
            While (rdr.Read())
                DEPTSEL.Items.Add(rdr.GetString(0))
            End While
            cn.Close()
        Else
            DEPTSEL.Visible = False
            dept.Visible = True
            dept.Text = Application("dept")
            cn = New SqlConnection(Application("constr"))
            cmd = New SqlCommand("select * from component", cn)
            cn.Open()
            rdr = cmd.ExecuteReader()
            compsel.Items.Clear()
            compsel.Items.Add("ALL")
            compsel.Enabled = True
            While (rdr.Read())
                If (rdr.GetString(0) = Application("dept")) Then
                    compsel.Items.Add(rdr.GetString(1))
                End If
            End While
            cn.Close()
        End If

        For i = 0 To 12
            selecttyp.Items(i).Selected = True
        Next
        LinkButton1.Text = "+"
        Panel1.Visible = False
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim a As Integer
        a = 0
        If (searchby.SelectedIndex = 1 Or searchby.SelectedIndex = 5) Then
            If Not IsNumeric(TextBox1.Text) Then
                flag = True
                TextBox1.ForeColor = Drawing.Color.Red
                TextBox1.ToolTip = "DIGIT ONLY"
            Else
                flag = False
            End If
        End If
        If Not (DEPTSEL.SelectedValue = "[ SELECT DEPT. ]") And flag = False Then
            Dim cmdstr, field, whr As String
            field = ""
            If (rbl_grpind.SelectedIndex = 1) Then
                cmdstr = "select  B.group_id,A.dsr_no,B.component_name"
            Else
                cmdstr = "select distinct B.group_id,B.component_name"
            End If
            If selecttyp.Items(0).Selected = True Then
                field = field + ",B.bill_no,convert(varchar(10),B.bill_date,105) bill_date"
            End If
            If selecttyp.Items(1).Selected = True Then
                field = field + ",B.component_details"
            End If
            If selecttyp.Items(3).Selected = True Then
                field = field + ",B.rate,B.excise_duty,B.sales_tax,B.extra_charges,B.cost,B.total_cost"
            ElseIf selecttyp.Items(2).Selected = True Then     
                field = field + ",B.rate"
            End If
            If selecttyp.Items(4).Selected = True Then
                field = field + ",convert(varchar(10),B.date_of_purchase,105) AS date_of_purchase"
            End If
            If selecttyp.Items(5).Selected = True Then
                If (rbl_grpind.SelectedIndex = 1) Then
                    field = field + ",convert(varchar(10),A.updated_on,105) AS updated_on"
                Else
                    field = field + ",convert(varchar(10),B.updated_on,105) AS updated_on"
                End If
            End If
            If selecttyp.Items(6).Selected = True Then
                field = field + ",B.department"
            End If
            If selecttyp.Items(7).Selected = True Then
                field = field + ",A.location"
            End If
            If selecttyp.Items(8).Selected = True Then
                field = field + ",B.quantity_received"
            End If
            If selecttyp.Items(9).Selected = True Then
                field = field + ",A.remarks"
            End If
            If selecttyp.Items(10).Selected = True Then
                field = field + ",B.company_address"
            End If
            If selecttyp.Items(11).Selected = True Then
                field = field + ",B.company_name"
            End If
            If selecttyp.Items(12).Selected = True Then
                If rbl_grpind.SelectedIndex = 1 Then
                    field = field + ",A.updated_by"
                Else
                    field = field + ",B.updated_by"
                End If
            End If
            cmdstr = cmdstr + field + " from MAIN AS B,dsr_main AS A "
            whr = " where A.group_id = B.group_id "
            If (Application("dept") = "ADMIN") Then
                If Not (DEPTSEL.SelectedValue = "ALL") Then
                    whr = whr + "and B.department = '" + DEPTSEL.Text + "' "
                End If
            Else
                whr = whr + "and B.department = '" + dept.Text + "' "
            End If
            If Not (compsel.SelectedValue = "ALL") Then
                whr = whr + "and B.component_name = '" + compsel.Text + "' "
            End If
            If Not (searchby.SelectedIndex = 0) Then
                whr = whr + "and "
            End If
            If (searchby.SelectedIndex = 1) Then
                whr = whr + " B.group_id " + oprtr(numoprtr.SelectedIndex) + TextBox1.Text
            ElseIf (searchby.SelectedIndex = 2) Then
                whr = whr + " A.dsr_no " + oprtr(numoprtr.SelectedIndex) + TextBox1.Text
            ElseIf (searchby.SelectedIndex = 3) Then
                whr = whr + " A.location like '%" + TextBox1.Text + "%'"
            ElseIf (searchby.SelectedIndex = 4) Then
                whr = whr + " B.date_of_purchase " + oprtr(dtoprtr.SelectedIndex) + "'" + mm.SelectedValue + "-" + dd.SelectedValue + "-" + YYYY.SelectedValue + "'"
            ElseIf (searchby.SelectedIndex = 5) Then
                whr = whr + " B.component_details like '%" + TextBox1.Text + "%'"
            ElseIf (searchby.SelectedIndex = 6) Then
                whr = whr + " B.bill_no like '%" + TextBox1.Text + "%'"
            ElseIf (searchby.SelectedIndex = 7) Then
                whr = whr + " B.company_name like '%" + TextBox1.Text + "%'"
            ElseIf searchby.SelectedIndex = 8 Then
                If (rbl_grpind.SelectedIndex = 1) Then
                    whr = whr + " A.updated_on" + oprtr(dtoprtr.SelectedIndex) + "'" + mm.SelectedValue + "-" + dd.SelectedValue + "-" + YYYY.SelectedValue + "'"
                Else
                    whr = whr + " B.updated_on" + oprtr(dtoprtr.SelectedIndex) + "'" + mm.SelectedValue + "-" + dd.SelectedValue + "-" + YYYY.SelectedValue + "'"
                End If
            End If
            cmdstr = cmdstr + whr
            Application("sqlcmd") = cmdstr
            Response.Redirect("Showsearch.aspx")
        End If
    End Sub
    Public Function oprtr(ByVal a As Integer) As String
        If (a = 0) Then
            Return "="
        ElseIf a = 1 Then
            Return ">"
        ElseIf a = 2 Then
            Return "<"
        Else
            Return "<>"
        End If
    End Function
   
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        If LinkButton1.Text = "+" Then
            LinkButton1.Text = "-"
            Panel1.Visible = True
        Else
            LinkButton1.Text = "+"
            Panel1.Visible = False
        End If
    End Sub
    Protected Sub selecttyp_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles selecttyp.SelectedIndexChanged
        Label6.Text = ""
        Dim a As Integer
        a = 0
        For i = 0 To 12
            If (selecttyp.Items(i).Selected = True) Then
                If Not (selecttyp.Items(2).Selected = True And i = 1) Then
                    If Not (Label6.Text = "") Then
                        Label6.Text = Label6.Text + ", "
                    End If
                    Label6.Text = Label6.Text + selecttyp.Items(i).Value.ToString
                End If
                a = a + 1
            End If
        Next i
        If rbl_grpind.SelectedIndex = 0 Then
            If a = 13 Or (a = 12 And selecttyp.Items(2).Selected = False) Then
                Label6.Text = "All"
            End If
        Else
            If a = 11 Then
                Label6.Text = "All"
            End If

        End If
    End Sub
    Protected Sub searchby_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles searchby.SelectedIndexChanged
        Dim a As Integer
        a = searchby.SelectedIndex
        If (a = 2 Or a = 3) Then
            rbl_grpind.SelectedIndex = 1
            rbl_grpind.Enabled = False
        Else
            rbl_grpind.Enabled = True
        End If
        If a = 1 Or a = 2 Then
            numoprtr.Visible = True
        Else
            numoprtr.Visible = False
        End If
        If (a = 1 Or a = 2 Or a = 3 Or a = 5 Or a = 6 Or a = 7) Then
            dat.Visible = False
            TextBox1.Visible = True
            TextBox1.Enabled = True
            dtoprtr.Visible = False
        ElseIf a = 4 Or a = 8 Then
            dat.Visible = True
            TextBox1.Visible = False
            dtoprtr.Visible = True
        ElseIf a = 0 Then
            numoprtr.Visible = False
            dat.Visible = False
            TextBox1.Visible = True
            TextBox1.Enabled = False
            dtoprtr.Visible = False
        End If
    End Sub
    Protected Sub yyyy_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles YYYY.SelectedIndexChanged

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

    Protected Sub TextBox1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBox1.TextChanged
        If (searchby.SelectedIndex = 1 Or searchby.SelectedIndex = 2) Then
            If Not IsNumeric(TextBox1.Text) Then
                flag = True
                TextBox1.ForeColor = Drawing.Color.Red
                TextBox1.ToolTip = "DIGITS ONLY"
            Else
                TextBox1.ForeColor = Drawing.Color.Black
                TextBox1.ToolTip = ""
                flag = False
            End If
        End If
    End Sub
    Protected Sub rbl_grpind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbl_grpind.SelectedIndexChanged
        If (rbl_grpind.SelectedIndex = 1) Then
            selecttyp.Items(3).Selected = False
            selecttyp.Items(3).Enabled = False
            selecttyp.Items(8).Selected = False
            selecttyp.Items(8).Enabled = False
        Else
            selecttyp.Items(3).Selected = True
            selecttyp.Items(3).Enabled = True
            selecttyp.Items(8).Selected = True
            selecttyp.Items(8).Enabled = True
        End If
    End Sub
End Class
