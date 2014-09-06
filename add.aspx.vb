
Imports System.Data
Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim adap As SqlDataAdapter
    Dim cn As SqlConnection
    Dim cmd As SqlCommand
    Dim ds As DataSet
    Dim dt As DataTable
    Dim str, constr As String
    Dim rdr As SqlDataReader
    Dim errmsg As String
    Dim erflag As Boolean

    Protected Sub Wizard1_FinishButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.FinishButtonClick
        If (dsr_no1.Visible = True) Then
            cn = New SqlConnection(Application("constr"))
            Dim i As Integer
            i = dsr_no.Text
            While (i < Val(dsr_no.Text) + Val(Quantity.Text))
                cn = New SqlConnection(Application("constr"))
                str = "insert into dsr_main values (" + i.ToString + ","
                str = str + "'" + Location.Text + "',"
                str = str + "'" + Remarks.Text + "',"
                str = str + "'" + Date.Now.ToShortDateString.ToString + "',"
                str = str + "'" + Application("username") + "',"
                str = str + Val(dsr_no.Text).ToString + ")"
                i = i + 1
                cmd = New SqlCommand(str, cn)
                cn.Open()
                cmd.ExecuteNonQuery()
                cn.Close()
            End While
            cn = New SqlConnection(Application("constr"))
            str = "insert into Main values (" + dsr_no.Text + ","
            str = str + "'" + dd.Text + "-" + mm.Text + "-" + YYYY.Text + "',"
            str = str + Quantity.Text + ","
            str = str + "'" + cmpnt.Text + "',"
            str = str + "'" + Component_Detail.Text + "',"
            str = str + "'" + Supplier_Name.Text + "',"
            str = str + "'" + Supplier_Address.Text + "',"
            str = str + "'" + Invoice_Bill_no.Text + "',"
            str = str + "'" + dd0.Text + "-" + mm0.Text + "-" + YYYY0.Text + "',"
            str = str + Val(Rate.Text).ToString + ","
            str = str + Val(Excise_duty.Text).ToString + ","
            str = str + Val(Sales_Tac.Text).ToString + ","
            str = str + Val(Extra_Charges.Text).ToString + ","
            str = str + Val(cost.Text).ToString + ","
            str = str + Val(Total_cost.Text).ToString + ","
            If (Not Application("dept") = "ADMIN") Then
                str = str + "'" + dept.Text + "',"
            Else
                str = str + "'" + Dept_name.Text + "',"
            End If
            str = str + "'" + Now.Day.ToString + "-" + Now.Month.ToString + "-" + Now.Year.ToString + "',"
            str = str + "'" + Application("username") + "')"
            cmd = New SqlCommand(str, cn)
            cn.Open()
            cmd.ExecuteNonQuery()
            cn.Close()
            Application("msg") = "RECORD ADDED"
            Response.Redirect("~/welcome.aspx")
        End If
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Wizard1.ActiveStepIndex = 0
        dsr_no1.Visible = False
        dsr2.Visible = False
        Panel1.Visible = False
        For i = 1999 To Now.Year
            YYYY.Items.Add(i)
            YYYY0.Items.Add(i)
        Next
        For i = 1 To 12
            mm.Items.Add(i)
            mm0.Items.Add(i)
        Next
        For i = 1 To 31
            dd.Items.Add(i)
            dd0.Items.Add(i)
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

        cn = New SqlConnection()
        cn.ConnectionString = Application("constr")
        cmd = New SqlCommand("select dsr_no + 1  from dsr_main where dsr_no in(select max(dsr_no) from dsr_main)", cn)
        cn.Open()
        rdr = cmd.ExecuteReader()
        If (rdr.Read()) Then
            Dsr_no.Text = rdr.GetSqlValue(0).ToString
            cn.Close()
        Else
            Dsr_no.Text = 1
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Application("username") = "" Then
            Response.Redirect("~/login.aspx")
        End If
        Wizard1.ToolTip = ""
        erflag = False
        If IsPostBack = True Then
              cost.Text = (Val(Quantity.Text) * Val(Rate.Text)).ToString
            Total_cost.Text = (Val(cost.Text) + Val(Sales_Tac.Text) + Val(Excise_duty.Text) + Val(Extra_Charges.Text)).ToString
        End If
    End Sub

    Protected Sub Dept_name_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Dept_name.SelectedIndexChanged
        cmd = New SqlCommand("select * from component", cn)
        cn.Open()
        rdr = cmd.ExecuteReader()
        cmpnt.Items.Clear()
        addcmpnt.Enabled = True
        While (rdr.Read())
            If (rdr.GetString(0) = Dept_name.SelectedValue) Then
                cmpnt.Items.Add(rdr.GetString(1))
            End If
        End While
        cn.Close()
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        Panel1.Visible = False
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        TextBox1.Text = TextBox1.Text.ToUpper()
        Dim cnt As Integer
        cnt = cmpnt.Items.Count - 1
        While cnt >= 0
            If (TextBox1.Text = cmpnt.Items(cnt).Value.ToString) Then
                cnt = -99
                Exit While
            End If
            cnt = cnt - 1
        End While
        If Not (TextBox1.Text = "" Or cnt = -99) Then
            Dim deptstr As String
            cn = New SqlConnection(Application("constr"))
            If Not Application("dept") = "ADMIN" Then
                deptstr = dept.Text
            Else
                deptstr = Dept_name.SelectedValue.ToString
                Label2.Text = Dept_name.SelectedValue.ToString
            End If
            cmd = New SqlCommand("Insert into component values ('" + deptstr + "','" + TextBox1.Text + "')", cn)
            cn.Open()
            cmd.ExecuteNonQuery()
            cn.Close()
            cmpnt.Items.Add(TextBox1.Text)
            Panel1.Visible = False
        Else
            Label25.Text = "Enter Valid Component Name"
            TextBox1.Text = ""
        End If
        TextBox1.Text = ""
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles rmvcmpnt.Click
        Response.Redirect("delcmpnt.aspx")
    End Sub

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addcmpnt.Click
        If Panel1.Visible = True Then
            Panel1.Visible = False
        Else
            Panel1.Visible = True
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

    Protected Sub YYYY0_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles YYYY0.SelectedIndexChanged
        Dim maxdays, a As Integer
        a = dd0.SelectedIndex
        If (mm0.SelectedValue = 2) Then
            If (YYYY0.SelectedValue Mod 4 = 0) Then
                maxdays = 29
            Else
                maxdays = 28
            End If
            dd0.Items.Clear()
            For i = 1 To maxdays
                dd0.Items.Add(i)
            Next
        Else
            maxdays = dd0.Items.Count
        End If
        If (a + 1 > maxdays) Then
            dd0.SelectedIndex = maxdays - 1
        Else
            dd0.SelectedIndex = a
        End If
    End Sub

    Protected Sub mm0_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles mm0.SelectedIndexChanged
        Dim a, maxdays, b As Integer
        b = dd0.SelectedIndex
        a = mm0.SelectedValue
        If a = 1 Or a = 3 Or a = 5 Or a = 7 Or a = 8 Or a = 10 Or a = 12 Then
            maxdays = 31
        ElseIf a = 4 Or a = 6 Or a = 9 Or a = 11 Then
            maxdays = 30
        Else
            If (YYYY0.SelectedValue Mod 4 = 0) Then
                maxdays = 29
            Else
                maxdays = 28
            End If
        End If
        dd0.Items.Clear()
        For i = 1 To maxdays
            dd0.Items.Add(i)
        Next
        If (b + 1 > maxdays) Then
            dd0.SelectedIndex = maxdays - 1
        Else
            dd0.SelectedIndex = b
        End If
    End Sub


    Public Function isAlpha(ByVal str As String) As Boolean
        Dim iPos As Integer
        Dim bolValid As Boolean
        iPos = 1
        bolValid = True
        While iPos <= Len(str) And bolValid
            If Asc(UCase(Mid(str, iPos, 1))) < Asc("A") Or _
            Asc(UCase(Mid(str, iPos, 1))) > Asc("Z") Then _
                bolValid = False
            iPos = iPos + 1
        End While
        isAlpha = bolValid
    End Function

    Public Sub onlyNum(ByVal source As Object, ByVal a As ServerValidateEventArgs) Handles cv_pincode.ServerValidate, cv_quan.ServerValidate, cv_rate.ServerValidate, cv_extra_charges.ServerValidate
        If IsNumeric(a.Value) Then
            a.IsValid = True
        Else
            a.IsValid = False
        End If
    End Sub

    Public Sub onlyText(ByVal source As Object, ByVal a As ServerValidateEventArgs) Handles cv_city.ServerValidate
        a.IsValid = isAlpha(a.Value)
    End Sub
   
   
    Protected Sub Wizard1_NextButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.NextButtonClick
        If WizardStep3.Visible = True And Not Quantity.Text = "" And Not isAlpha(Quantity.Text) Then
            dsr_no1.Text = Val(dsr_no.Text) + Val(Quantity.Text) - 1
            If (Quantity.Text <= 1) Then
                dsr_no1.Visible = False
                dsr2.Visible = False
            Else
                dsr_no1.Visible = True
                dsr2.Visible = True
            End If
        End If
    End Sub


    Protected Sub Wizard1_SideBarButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.SideBarButtonClick
        If WizardStep3.Visible = True And Not Quantity.Text = "" And Not isAlpha(Quantity.Text) Then
            dsr_no1.Text = Val(dsr_no.Text) + Val(Quantity.Text) - 1
            If (Quantity.Text <= 1) Then
                dsr_no1.Visible = False
                dsr2.Visible = False
            Else
                dsr_no1.Visible = True
                dsr2.Visible = True
            End If
        End If
    End Sub

End Class


