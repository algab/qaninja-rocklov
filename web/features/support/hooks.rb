Before do
  @alert = Alert.new
  @dash_page = DashPage.new
  @login_page = LoginPage.new
  @signup_page = SignupPage.new
  @equipos_page = EquiposPage.new

  page.current_window.resize_to(1280,800)
end
