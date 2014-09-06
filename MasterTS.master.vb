
Partial Class MasterTS
    Inherits System.Web.UI.MasterPage
    Dim instance As HttpSessionState


    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        user.Text = "Welcome " + Application("username")
        If Not Application("dept") = "ADMIN" Then
            Sidemenu.Items(0).Enabled = False
        Else
            Sidemenu.Items(0).Enabled = True
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.CacheControl = "no-cache"
    End Sub

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Sidemenu.MenuItemClick
        If (sidemenu.SelectedValue = "Log Out") Then
            Application("username") = ""
            Application("password") = ""
            Response.Redirect("~/login.aspx")
        End If
    End Sub

    Public Sub clear()
        Dim keys As List(Of String)
        keys = New List(Of String)
        Dim en As IDictionaryEnumerator
        en = Cache.GetEnumerator
        Dim i As Integer
        While en.MoveNext()
            keys.Add(en.Key.ToString())
        End While
        For i = 0 To keys.Count - 1
            Cache.Remove(keys(i))
        Next
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Application("username") = ""
        Application("dept") = ""
        Response.Redirect("~/login.aspx")
        Session.Abandon()
    End Sub


End Class

