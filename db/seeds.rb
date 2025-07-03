# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.first || User.create!(email: 'demo@example.com', password: 'password', password_confirmation: 'password')
puts "Utilisateur pour les seeds : #{user.email}"

puts 'Création des articles de blog...'

Post.destroy_all # Optionnel: Supprime tous les articles existants avant d'en créer de nouveaux

# Post 1
post1 = Post.create!(
  title: "Aventure en Patagonie : Randonnée au Fitz Roy",
  content: "Un voyage inoubliable au cœur de la Patagonie argentine, avec des vues époustouflantes sur le mont Fitz Roy. Nous avons passé plusieurs jours à randonner à travers des paysages grandioses, des forêts millénaires aux glaciers scintillants. Chaque lever de soleil était un spectacle de couleurs sur les montagnes emblématiques. Préparez-vous pour des vents forts et des températures fraîches, même en été !",
  location: "El Chaltén, Argentine",
  image_url: "https://source.unsplash.com/random/800x600?patagonia,fitzroy",
  published_at: 3.months.ago, # Publié il y a 3 mois
  user: user # Associe l'article à l'utilisateur
)
puts "Créé: '#{post1.title}'"

# Post 2
post2 = Post.create!(
  title: "Les saveurs de la Thaïlande : Un voyage culinaire à Bangkok",
  content: "Bangkok est une ville qui éveille tous les sens, surtout le goût ! Des marchés de rue animés où les arômes de curry et de citronnelle flottent dans l'air, aux restaurants branchés proposant une cuisine fusion innovante, chaque repas est une découverte. Ne manquez pas le Pad Thai de rue et les currys verts épicés. Le street food est une expérience en soi.",
  location: "Bangkok, Thaïlande",
  image_url: "https://source.unsplash.com/random/800x600?bangkok,food",
  published_at: 2.months.ago, # Publié il y a 2 mois
  user: user
)
puts "Créé: '#{post2.title}'"

# Post 3
post3 = Post.create!(
  title: "Immersion dans la culture japonaise : Temples et jardins de Kyoto",
  content: "Kyoto, l'ancienne capitale impériale, est un véritable trésor de la culture japonaise. Chaque temple, chaque jardin zen raconte une histoire. Nous avons visité le Kinkaku-ji (Pavillon d'Or), le Fushimi Inari-taisha avec ses milliers de torii rouges, et nous nous sommes perdus dans les ruelles du quartier de Gion. Une expérience paisible et spirituelle.",
  location: "Kyoto, Japon",
  image_url: "https://source.unsplash.com/random/800x600?kyoto,temple",
  published_at: 1.month.ago, # Publié il y a 1 mois
  user: user
)
puts "Créé: '#{post3.title}'"

# Post 4
post4 = Post.create!(
  title: "Randonnée dans les Dolomites : Beauté alpine en Italie",
  content: "Les Dolomites, en Italie, offrent des paysages montagneux à couper le souffle. Des sommets déchiquetés aux lacs turquoise, c'est un paradis pour les randonneurs. Nous avons exploré des sentiers bien balisés et découvert des panoramas incroyables à chaque détour. L'air pur des montagnes et la cuisine locale ont rendu ce voyage inoubliable.",
  location: "Dolomites, Italie",
  image_url: "https://source.unsplash.com/random/800x600?dolomites,mountains",
  published_at: 2.weeks.ago, # Publié il y a 2 semaines
  user: user
)
puts "Créé: '#{post4.title}'"

# Post 5
post5 = Post.create!(
  title: "Découverte des îles grecques : Charme de Santorin et Mykonos",
  content: "Un rêve devenu réalité : les îles grecques ! Santorin, avec ses maisons blanches et bleues accrochées à la falaise, offre des couchers de soleil légendaires. Mykonos, plus festive, nous a séduits avec ses plages magnifiques et sa vie nocturne animée. Entre baignades dans des eaux cristallines et dégustation de feta, c'était la parfaite évasion estivale.",
  location: "Santorin, Grèce",
  image_url: "https://source.unsplash.com/random/800x600?santorini,greece",
  published_at: 1.week.ago, # Publié il y a 1 semaine
  user: user
)
puts "Créé: '#{post5.title}'"

puts 'Articles de blog créés avec succès !'

# Optionnel: Créer quelques commentaires pour les posts (si vous avez le modèle Comment)
puts 'Création de commentaires...'

Comment.destroy_all # Optionnel: Supprime tous les commentaires existants

Comment.create!(post: post1, author: "Voyageur Curieux", body: "La Patagonie est sur ma liste ! Des conseils pour les équipements ?")
Comment.create!(post: post1, author: "Aventurier Du Dimanche", body: "Magnifiques photos, ça donne envie !")
Comment.create!(post: post2, author: "Foodie Lover", body: "Le Pad Thai de rue est effectivement le meilleur ! J'ai adoré les marchés flottants aussi.")
Comment.create!(post: post3, author: "Zen Wanderer", body: "Kyoto est d'une beauté apaisante. Avez-vous visité les jardins Ryoan-ji ?")
Comment.create!(post: post5, author: "Sunseeker", body: "Santorin est magique ! Les couchers de soleil sont vraiment incroyables.")

puts 'Commentaires créés avec succès !'
