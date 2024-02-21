require "open-uri"

Booking.destroy_all
Power.destroy_all
User.destroy_all


users = ["Goku Son", "Doctor Octopus", "Gojo Satoru", "Eren Yeager", "Rick Sanchez", "Itachi Uchiha"]
users_url = [
  "https://wallpapers.com/images/hd/silver-son-goku-ultra-instinct-9udr9mh7j91plb2i.jpg",
  "https://upload.wikimedia.org/wikipedia/en/b/bc/Dr._Octopus_Marvel.jpg",
  "https://i0.wp.com/www.spielanime.com/wp-content/uploads/2023/12/Top-5-Gojo-Satoru-moments-in-Jujutsu-Kaisen-season-1-5.webp?fit=1024%2C576&ssl=1",
  "https://sm.mashable.com/t/mashable_in/photo/default/fecab7d7-3f9d-4bca-bfbd-5e3a9498c035_uace.720.jpg",
  "https://rukminim2.flixcart.com/image/850/1000/kr83ukw0/poster/0/t/s/medium-rick-sanchez-rick-and-morty-newtvps245-original-imag522dghhhj8z5.jpeg?q=20&crop=false",
  "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c95cba7b-4766-47b6-a560-4c82aa88f90e/deykxhi-481bb2d4-7d9b-40d8-bbde-21653ee05752.gif/v1/fill/w_451,h_676,q_85,strp/itachi_uchiha_animated_steamartwork_by_ace3k_deykxhi-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9Njc2IiwicGF0aCI6IlwvZlwvYzk1Y2JhN2ItNDc2Ni00N2I2LWE1NjAtNGM4MmFhODhmOTBlXC9kZXlreGhpLTQ4MWJiMmQ0LTdkOWItNDBkOC1iYmRlLTIxNjUzZWUwNTc1Mi5naWYiLCJ3aWR0aCI6Ijw9NDUxIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.Yje1UEXV2mT-kHEajVELmwWEpRc9ye8-hEQDH_XXFuw"
]

powers = [
  [{name: "Kamehameha", description: "Goku's signature attack. A powerful Ki blast fired with two hands after concentrating a large amount of Ki. Goku first learned this technique after witnessing Roshi use it to extinguish the fire on Fire Mountain. Goku has also invented numerous variations.", category: "magic"}, {name: "Super Saiyan", description: "The Super Saiyan transformation, and all of its variants, drastically increase the Saiyan's speed, strength, and power. The user's fighting strength multiplies by a factor of 50, as shown by Gokū who had a fighting strength of 3,000,000 in his base form, but 150,000,000 upon achieving Super Saiyan for the first time.", category: "transformation"}],
  [{name: "Cybernetic Tentacles", description: "Doctor Octopus' superhuman abilities derive from the four mentally-controlled, electronically-powered, telescoping, prehensile titanium-steel tentacles attached to a stainless steel harness encircling his body from lower chest to waist. Each tentacle, approximately five inches in diameter, terminates in three single-jointed pincers. The pincers are able to rotate in relation to the arm for 360 degrees, in a screwdriver-like twisting motion.", category: "equipment"}, {name: "Genius Intellect", description: "Otto Octavius is a multi-discipline scientist with expertise in various fields of science. Doctor Octopus is one of the world's leading authorities on nuclear radiation and its effect on animal physiology. Doctor Octopus is a brilliant engineer and inventor, due to his own ability and more recently due to having Peter's memories. Doctor Octopus possesses extraordinary mental abilities and concentration, and through years of practice is able to perform two complex and two simple independent actions, simultaneously, one with each arm.", category: "mental"}],
  [{name: "Unlimited Void", description: "Satoru's Domain Expansion. It creates a metaphysical space that causes the victims to receive all kinds of stimuli and information endlessly, restraining their thought processes and actions. In terms of raw strength, Satoru's domain is equal to Sukuna's own Malevolent Shrine on the inside, only losing due to Malevolent Shrine's open domain that allowed Sukuna to destroy the barrier of Unlimited Void. Satoru's skill with his Domain Expansion is so great that he can precisely control the range and time of it's activation for only 0.2 seconds, limiting its lasting effect on those he traps within it, and is able to freely change the conditions of Unlimited Void's barrier. Those he makes physical contact with are also immune to its effect.", category: "magic"}, {name: "Hollow Technique: Purple", description: "An advanced technique that collides the Lapse and Reversal of the Limitless, resulting in an imaginary mass that is launched at the target.", category: "magic"}],
  [{name: "Attack Titan", description: "After the fall of Wall Maria, Grisha found Eren in a refugee camp and brought him into a nearby forest. After giving him the key to the basement, Grisha injected a struggling Eren with a serum, which transformed him into a 4 meter Pure Titan with short rugged hair and a skinny body. This Titan ate Grisha, giving Eren the powers of the Founding Titan and Attack Titan. Years later, during the first Battle of Trost, Eren was eaten alive by a Titan, and inside the stomach-like cavity saw other fellow recruits lying dead/dying, one wanting her mother before sinking in stomach acid. The sight combined with intense feelings of desperation and his drive to exterminate all Titans awoke his ability to transform into his Titan form for the first time.
  ", category: "transformation"}, {name: "Martial Arts", description: "Originally, Eren's only noteworthy trait was his natural physical strength, which stemmed from having to defend his friend Armin from bullies who were bigger and stronger. As he grew and joined the 104th squad, he trained extensively in hand-to-hand combat. After additional training with Reiner and Annie, Eren's prowess and skill set diversified, including the use of punches, throws, grappling and submission locks. He had the best scores for hand-to-hand combat of the entire 104th graduate squad. While hand-to-hand fighting would appear useless due to the massive physical differences between humans and Titans, these skills gave Eren a powerful edge when fighting other Titans in his own Titan form.", category: "strength"}],
  [{name: "Super Human Intelligence", description: "Rick is unspeakably intelligent, and is frequently mentioned to be the smartest being in the universe. He has made numerous discoveries and invented numerous gadgets and substances. He seems to specialize in robotics above all else, and can easily work through or around most obstacles. Long-term planning, deception, and manipulation are effortless tasks for Rick, and he is skilled at recognizing deception, such as when he saw through a three-layered simulation and pretended to fall for it in order to eliminate his captors, or when he simultaneously destroyed the Council of Ricks, collapsed the Federation, and triggered his daughter's divorce in one fell swoop.", category: "mental"}, {name: "Cybernetic Enhancement", description: "Rick was shown to have extensive cybernetic enhancements, however Rick has gone through and swapped multiple bodies, so it is unlikely that they were all enhanced.", category: "equipment"}],
  [{name: "Mangekyō Sharingan", description: "Itachi awakened the Mangekyō Sharingan after witnessing Shisui's suicide. Its design was three spiralling curves around the pupil. With both eyes, he could use Tsukuyomi, a genjutsu that trapped opponents' minds in an illusory world, altering their perception of time. With his right eye he could use Amaterasu, igniting whatever he looked at with black flames that would burn anything, including fire itself. He had the ability to extinguish Amaterasu.", category: "magic"}, {name: "Susanō", description: "With its simplest manifestations, he could produce extra arms or bones to improve his options in a fight. When used in full, Itachi was surrounded by a spectral warrior that would protect him from damage. In addition to the chakra swords and Yasaka Magatama common to all Susanoo, Itachi's Susanoo wielded the Sword of Totsuka an ethereal sword with the ability to seal any person it pierced into its gourd—hilt and the Yata Mirror a shield that was said to reflect any attack by changing its chakra nature to counterbalance an attack. The simultaneous use of both weapons made Itachi's Susanoo essentially invincible.", category: "summon"}]
]

powers_url = [
  ["https://wpcdn.us-midwest-1.vip.tn-cloud.net/www.honolulumagazine.com/content/uploads/2021/01/s3-kamehameha.jpg", "https://wallpapercave.com/wp/wp11228095.jpg"],
  ["https://foxsuperpowerlist.files.wordpress.com/2016/06/appendages-tentacles-doctor-octopus-marvel.jpg?w=760", "https://pm1.narvii.com/6717/42bd73e811c277eeae8e15f100a87f9bdf1960b0_hq.jpg"],
  ["https://cdna.artstation.com/p/assets/images/images/031/944/736/large/ari-libella-gojocolotwt.jpg?1605037152", "https://i.kym-cdn.com/entries/icons/original/000/046/899/purplecover.jpg"],
  ["https://4kwallpapers.com/images/walls/thumbs_3t/10339.jpg", "https://s1.zerochan.net/Eren.Jaeger.600.1779372.jpg"],
  ["https://i0.wp.com/www.thewrap.com/wp-content/uploads/2017/09/rick-and-morty-ricks-ranked-simple-rick.jpg?resize=618%2C412&ssl=1", "https://static1.srcdn.com/wordpress/wp-content/uploads/2022/10/Ricks-Gadgets-in-Rick-and-Morty-Episode-5.jpg"],
  ["https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7dd72a9d-2319-4f32-a6a5-0278692ccaa2/d52mf68-c8cbd19c-bfed-4452-9065-010687919ea0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzdkZDcyYTlkLTIzMTktNGYzMi1hNmE1LTAyNzg2OTJjY2FhMlwvZDUybWY2OC1jOGNiZDE5Yy1iZmVkLTQ0NTItOTA2NS0wMTA2ODc5MTllYTAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0._seobISO3RI6cqdVsATL7I5o26FT9ZZhbVH1eOOf7P0", "https://i.pinimg.com/originals/de/34/9a/de349a4be99ff3da70e07476abf9f7a3.jpg"]
]
users.each.with_index do |user,index|
  user_name = user.split(" ")
  user = User.new(email: "#{user_name[0]}@me.com", first_name: user_name[0], last_name: user_name[1])
  user.password = "123123"
  file = URI.open(users_url[index])
  user.photo.attach(io: file, filename: "#{user_name[0]}.png", content_type: "image/png")
  user.save

  count = 0
  2.times do
    power_attributes = powers[index]
    images = powers_url[index]
    power = Power.create!(user: user, name: power_attributes[count][:name], description: power_attributes[count][:description], price: rand(100..250), category: power_attributes[count][:category])
    file = URI.open(images[count])
    power.photo.attach(io: file, filename: "#{power_attributes[count][:name]}.png", content_type: "image/png")
    power.save
    count += 1
  end
end

10.times do
  user = User.all.sample
  powers = Power.where.not(user: user)
  power = powers.sample
  Booking.create!(user: user, power: power, start_date: DateTime.now, end_date: DateTime.now + rand(1..7) )
end
