
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        lbl_msg.Text = Application("msg")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Application("username") = "") Then
            Response.Redirect("~/login.aspx")
        End If
    End Sub
End Class
