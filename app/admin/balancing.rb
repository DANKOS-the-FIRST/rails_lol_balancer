ActiveAdmin.register_page "Balancing" do
  "<link href='https://fonts.googleapis.com/css?family=Rock+Salt' rel='stylesheet' type='text/css'>"
  content do
    div class: 'container-12 justify-content-md-center m-0 p-0', 'font-family': 'Rock Salt' do
      div class: 'row px-5' do
        div class: 'col-3' do
          div class: 'row' do
            render partial: 'players_list'
          end
        end
        div class: 'col-4' do
          div class: 'row' do
            div '############################', align: 'center'
          end
        end
        div class: 'col-5' do
          div class: 'row' do
            render partial: 'minmax_balancing'
          end
        end
      end
    end
  end
end