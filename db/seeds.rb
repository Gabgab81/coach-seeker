require 'faker'

puts "Creating 40 users"

10.times do
  user = User.new(
    username: Faker::FunnyName.name,
    email: Faker::Internet.email,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    birth_date: Faker::Date.birthday,
    presentation: Faker::Movie.quote,
    password: "123456"
    )
  user.save!
  puts "Creating 3 offer"
  2.times do
  offer = Offer.new(
    title: Faker::Game.title,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    localisation: Faker::Address.city,
    discipline: ["Accrobranche", "Acrosport", "Aérobic", "Agility", "Aîkido", "Airsoft", "Alpinisme", "Aquabiking", "Aquajogging", "Aquarunning", "Aquathlon", "Aquatriathlon", "Athlétisme", "Aviation", "Aviron", "Apnée", "Baby-foot", "Badminton", "Base-jump", "Baseball", "Basket-ball", "Bateau-Dragon", "Biathlon", "Belotte", "Billard", "Bloc (escalade)", "BMX", "Boardercross", "Bobsleigh", "Boccia", "Bodyboard", "Boomerang", "Bowling", "boxe anglaise", "boxe birmane", "boxe française", "boxe thaîlandaise", "Bras de fer", "Bridge (jeu de carte)", "Canicross", "Canoé", "Canoé-kayak", "Canyoning", "Capoeira", "Carrom", "Catch", "Cheerleading", "Coasteering", "Combat", "Compétition automobile", "Course à pied", "Course camarguaise", "Course d'orientation", "Cricket", "Croquet", "Cross (équitation)", "Cross-country", "Cross triathlon", "Crosse", "CrossFit", "Culturisme", "Curling", "Cyclisme", "Cyclo-cross", "Danse (Danse sportive)", "Dames", "Décathlon", "Deltaplane", "Duathlon", "Dodgeball", "Double Dutch", "Drift", "Echecs", "Equitation", "Escalade", "Escrime", "Esports", "Floorball", "Folkrace", "Football", "Football américain", "Football australien", "Football gaélique", "Footing", "Futsal", "Glisse", "Golf", "Gouren", "Grappling", "Gymnastique", "Gymnastique rythmique", "Haka pei", "Hakko-Ryu", "Haltérophilie", "Handball", "Hockey", "Hockey sur gazon", "Hockey sur glace", "Horse-ball", "Hurling", "Hapkido", "Jeu de paume", "Ju-Jitsu", "Joutes nautiques", "Judo", "Javelot tir sur cible", "Jiu-jitsu brésilien", "Jet ski", "Kaninhop", "Karaté", "Karting", "Kayak", "Kempo", "Kendo", "Kenjutsu", "Kick-boxing (Kick-boxing américain et Kick-boxing japonais)", "Kitesurfing", "Kin-ball", "Kobudo", "Kung fu", "Krav maga", "Kyudo", "Lancer de disque", "Lancer de javelot", "Lancer de marteau", "Lancer de poids", "Luge de course", "Lutte", "Moto (vitesse)", "Moto (endurance)", "Moto (cross)", "Moto (trial)", "Moto (enduro)", "Musculation", "Marathon", "MMA", "Naban", "Natation", "Natation synchronisée", "Nautisme", "Netball", "Omnikin", "Paddle", "Padel", "Paintball", "Parachutisme", "Parapente", "Parkour", "Patin à glace", "Patinage", "Patinage artistique", "Patinage de vitesse", "Patinage synchronisé", "Pèche sportive", "Pelote basque", "Pentathlon moderne", "Pétanque", "Pilates", "Ping-Pong", "Planche à voile", "Planeur (ou vol à voile)", "Plongée en apnée", "Plongée", "Plongeon", "Plumfoot", "Poker", "Polo", "Qi gong", "Quad", "Quidditch", "Qwan Ki Do", "Rafting", "Rallye automobile", "Raquette à neige", "Régate", "Ringuette", "Rink hockey", "Roller", "Roller in line hockey", "Rugby à sept", "Rugby à XIII", "Rugby à XV", "Roller derby", "Sambo", "Savate (boxe française)", "Saut à la perche", "Saut à ski", "Saut en hauteur", "Saut en longueur", "Shinty", "Skateboard", "Skater hockey", "Skeleton", "Ski", "Ski alpin", "Ski de fond", "Ski nordique", "Ski nautique", "Slamball", "Snowboard", "Snowscoot", "Snowskate", "Softball", "Spéléologie", "Squash", "Step", "Sumo", "Supermotard", "Surf", "Tae Bo", "Taekwondo", "Tai-chi-chuan", "Taihojutsu", "Taîso", "Tambourin", "Tango", "Tau'a rapa nui", "Tchoukball", "Tennis", "Tennis de table", "Tir à l'arc", "Tir sportif", "Trampoline", "Triathlon", "Tricking", "Triple saut", "Trottinette freestyle", "Twirling", "ULM", "Ultimate", "Unihockey", "Varappe", "Vélocross", "Voile", "Volata", "Volley", "Voltige aérienne", "Voltige en cercle", "Wakeboard", "Water-polo", "Wing chun", "Waveboard", "Yoga", "Yoseikan Budo", "Zen Hakko Kaî", "Zumba"].sample,
    user_id: user.id
    )
  offer.save!
  end
end

puts "Creating review"
100.times do
  review = Review.new(
    content: Faker::Lorem.paragraph,
    content: Faker::Lorem.paragraph(sentence_count: 2),
    rating: (1..10).to_a.sample,
    user_id: (1..20).to_a.sample,
    offer_id: (1..60).to_a.sample
  )
  review.save!
end
