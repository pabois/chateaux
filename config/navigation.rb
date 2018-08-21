SimpleNavigation::Configuration.run do |navigation|
  navigation.highlight_on_subpath = true
  navigation.items do |primary|
    primary.item :dashboard, 'Dashboard', admin_root_path, { icon: :dashboard, highlights_on: %r{admin$} }
    primary.item :chateaux, 'Châteaux', nil, { icon: 'university' } do |secondary|
      secondary.item :list, 'Tous les Châteaux', admin_chateaux_path, highlights_on: %r{chateaux$|chateaux.(?!new)}
      secondary.item :new, 'Nouveau Château', new_admin_chateau_path, highlights_on: %r{chateaux/new}
    end
  end
end
