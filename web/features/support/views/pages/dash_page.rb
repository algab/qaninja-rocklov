class DashPage
  include Capybara::DSL

  def goto_equipo_form
    click_button "Criar anúncio"
  end

  def equipo_list
    return find(".equipo-list")
  end

  def on_dash?
    return page.has_css?(".dashboard")
  end

  def has_no_equipo?(name)
    page.has_no_css?(".equipo-list li", text: name)
  end

  def request_remove(name)
    equipo = find(".equipo-list li", text: name)
    equipo.find(".delete-icon").click
  end

  def confirm_remove
    click_on "Sim"
  end

  def confirm_cancel
    click_on "Não"
  end

  def order
    return find(".notifications p")
  end

  def order_actions(button)
    return page.has_css?(".notifications button", text: button)
  end
end
