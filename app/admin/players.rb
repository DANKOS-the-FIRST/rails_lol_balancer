ActiveAdmin.register Player do

  permit_params :username, :strength, :rank

  show do
    player_rank = player.rank.to_s
    player_rank = 'No info' if player_rank.empty?

    panel 'Username info :' do
      h3 "Username : #{player.username.to_s}"
      h3 "Strength : #{player.strength.to_s}"
      h3 "Rank : #{player_rank}"
    end
  end

  index do
    selectable_column
    id_column
    column :username
    column :strength
    column :rank
    actions
  end

  filter :username
  filter :strength
  filter :rank

  form do |f|
    f.inputs do
      f.input :username
      f.input :strength
      f.input :rank
    end
    f.actions
  end

  batch_action :calculate_team do |ids|
    if ids.count.between?(3, 10)
      session[:players_ids] = ids
      redirect_to admin_balancing_path
    else
      redirect_to collection_path, alert: "You need to choose items in range of [3;10]"
    end
  end
end
