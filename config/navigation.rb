SimpleNavigation::Configuration.run do |navigation|
  navigation.highlight_on_subpath = true
  navigation.items do |primary|
    primary.item :chateaux_index, 'Châteaux', admin_chateaux_path, { icon: 'fab fa-fort-awesome', highlights_on: %r{chateaux$|chateaux.(?!new)} }
    primary.item :chateau_new, 'Nouveau Château', new_admin_chateau_path, { icon: 'fas fa-plus', highlights_on: %r{chateaux/new} }
  end
end
