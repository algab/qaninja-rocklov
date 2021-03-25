class EquiposPage
    include Capybara::DSL

    def create(equipo)
        page.has_css?("#equipoForm")

        upload(equipo[:thumb]) if equipo[:thumb].length > 0
        find("input[placeholder$=equipamento]").set equipo[:nome]
        select_category(equipo[:categoria]) if equipo[:categoria].length > 0
        find("input[placeholder^=Valor]").set equipo[:preco]

        click_button "Cadastrar"
    end

    def upload(file)
        thumb = Dir.pwd + "/features/support/fixtures/images/" + file
        find("#thumbnail input[type=file]", visible: false).set thumb
    end

    def select_category(option)
        find("#category").find("option", text: option).select_option
    end
end
