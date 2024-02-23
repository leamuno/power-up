require "open-uri"

Booking.destroy_all
Power.destroy_all
User.destroy_all

puts "deleting seed"

users = [["Goku", "Goku Son"], ["DrOctopus", "Otto Octavius"], ["Gojo", "Gojo Satoru"], ["Eren", "Eren Yeager"], ["Rick", "Rick Sanchez"], ["Itachi", "Itachi Uchiha"], ["Superman", "Clark Kent"], ["Spider-Man", "Peter Parker"], ["Batman", "Bruce Wayne"], ["Thor", "Thor Odinson"], ["Naruto", "Naruto Uzumaki"], ["Deadpool", "Wade Wilson"], ["Shazam", "Billy Batson"], ["Giorno", "Giorno Giovanna"]]
users_url = [
  "https://wallpapers.com/images/hd/silver-son-goku-ultra-instinct-9udr9mh7j91plb2i.jpg",
  "https://upload.wikimedia.org/wikipedia/en/b/bc/Dr._Octopus_Marvel.jpg",
  "https://i0.wp.com/www.spielanime.com/wp-content/uploads/2023/12/Top-5-Gojo-Satoru-moments-in-Jujutsu-Kaisen-season-1-5.webp?fit=1024%2C576&ssl=1",
  "https://sm.mashable.com/t/mashable_in/photo/default/fecab7d7-3f9d-4bca-bfbd-5e3a9498c035_uace.720.jpg",
  "https://rukminim2.flixcart.com/image/850/1000/kr83ukw0/poster/0/t/s/medium-rick-sanchez-rick-and-morty-newtvps245-original-imag522dghhhj8z5.jpeg?q=20&crop=false",
  "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c95cba7b-4766-47b6-a560-4c82aa88f90e/deykxhi-481bb2d4-7d9b-40d8-bbde-21653ee05752.gif/v1/fill/w_451,h_676,q_85,strp/itachi_uchiha_animated_steamartwork_by_ace3k_deykxhi-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9Njc2IiwicGF0aCI6IlwvZlwvYzk1Y2JhN2ItNDc2Ni00N2I2LWE1NjAtNGM4MmFhODhmOTBlXC9kZXlreGhpLTQ4MWJiMmQ0LTdkOWItNDBkOC1iYmRlLTIxNjUzZWUwNTc1Mi5naWYiLCJ3aWR0aCI6Ijw9NDUxIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.Yje1UEXV2mT-kHEajVELmwWEpRc9ye8-hEQDH_XXFuw",
  "https://assets-prd.ignimgs.com/2022/10/08/action-comics-1051-jack-herbet-1-in-25-variant-cover-1665257755994.png?width=1280",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTLzt20nZbOWU9jnqj95S3WRCf_OpfUwM3EA&usqp=CAU",
  "https://static.tvtropes.org/pmwiki/pub/images/batman_41.png",
  "https://www.gamespot.com/a/uploads/scale_landscape/171/1712892/3311332-thor-facebook.jpg",
  "https://wallpx.com/thumb/2022/03/uzumaki-naruto-smiling-clouds-364.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlu0ptm6uv3qDi_txs98wRlzO2VIBmr0R51g&usqp=CAU",
  "https://www.reddit.com/media?url=https%3A%2F%2Fi.redd.it%2Frwvkvudxxcez.jpg",
  "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/bceadaef-c9f1-43cd-9571-dcc18996830e/db5ys33-d8582704-7c6e-49e2-a447-441f64e99230.jpg/v1/fill/w_1600,h_900,q_75,strp/giorno_giovanna_wallpaper_by_mizoresyo_db5ys33-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvYmNlYWRhZWYtYzlmMS00M2NkLTk1NzEtZGNjMTg5OTY4MzBlXC9kYjV5czMzLWQ4NTgyNzA0LTdjNmUtNDllMi1hNDQ3LTQ0MWY2NGU5OTIzMC5qcGciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.WHfmXlJxl-2LHhmQejHxjQ9XX8bK6AgboALZF_IKV4k",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmpGEOfl3jxS0Csrmz1QWMKSj1M-bgZbx-gg&usqp=CAU",
  "https://www.desktopbackground.org/p/2013/10/29/661640_kurapika_874x815_h.jpg",
  "https://images2.alphacoders.com/134/1342303.jpeg",
  "https://lh3.googleusercontent.com/proxy/E0mCaMJSsk06iOjuL3xIITwf71hCY7Lhexkg_5SPKYvfpaM07T_bF3sM7bdeqt6wmYd0WKHC4XzbW-IHqidiNfG6Kwpy40t-dg",
  "https://c4.wallpaperflare.com/wallpaper/413/747/792/bleach-ichigo-kurosaki-wallpaper-preview.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaWFZeAL1Fty0H5QMM1mgskNiwQYV-SuB6CQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9iyCX9XOeNM6xKuJWXmWWvTWlI5XP1F1Aqw&usqp=CAU",
  "https://www.reddit.com/media?url=https%3A%2F%2Fi.redd.it%2Fbxbh57rj5a251.jpg",
  "https://images4.alphacoders.com/107/1078644.jpg",
  "https://cdn.britannica.com/53/182853-050-D7B30FA6/Aquaman-Justice-League-The-Flashpoint-Paradox-Jay.jpg",
  "https://w.forfun.com/fetch/c1/c1c688851810024ccc91eb0fed477376.jpeg",
  "https://comicvine.gamespot.com/a/uploads/scale_medium/11141/111413247/7267709-e47c719d-a99f-46ef-9379-269760c8b548_rw_1200.jpg",
  "https://i.pinimg.com/originals/93/5f/06/935f0693e1ed58f49f2f322b10b86861.jpg",
  "https://images6.alphacoders.com/901/901586.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUVrpCXQ0C9_LxiP3ArenAVAgCaavM8RKd-Q&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTINESJoeMN159GBKHShS9Ykxf8RLwQ6ltWGw&usqp=CAU"
]

powers = [
  [{name: "Kamehameha", description: "Goku's signature attack. A powerful Ki blast fired with two hands after concentrating a large amount of Ki. Goku first learned this technique after witnessing Roshi use it to extinguish the fire on Fire Mountain. Goku has also invented numerous variations.", category: "magic"}, {name: "Super Saiyan", description: "The Super Saiyan transformation, and all of its variants, drastically increase the Saiyan's speed, strength, and power. The user's fighting strength multiplies by a factor of 50, as shown by Gokū who had a fighting strength of 3,000,000 in his base form, but 150,000,000 upon achieving Super Saiyan for the first time.", category: "transformation"}],
  [{name: "Cybernetic Tentacles", description: "Doctor Octopus' superhuman abilities derive from the four mentally-controlled, electronically-powered, telescoping, prehensile titanium-steel tentacles attached to a stainless steel harness encircling his body from lower chest to waist. Each tentacle, approximately five inches in diameter, terminates in three single-jointed pincers. The pincers are able to rotate in relation to the arm for 360 degrees, in a screwdriver-like twisting motion.", category: "equipment"}, {name: "Genius Intellect", description: "Otto Octavius is a multi-discipline scientist with expertise in various fields of science. Doctor Octopus is one of the world's leading authorities on nuclear radiation and its effect on animal physiology. Doctor Octopus is a brilliant engineer and inventor, due to his own ability and more recently due to having Peter's memories. Doctor Octopus possesses extraordinary mental abilities and concentration, and through years of practice is able to perform two complex and two simple independent actions, simultaneously, one with each arm.", category: "mental"}],
  [{name: "Unlimited Void", description: "Satoru's Domain Expansion. It creates a metaphysical space that causes the victims to receive all kinds of stimuli and information endlessly, restraining their thought processes and actions. In terms of raw strength, Satoru's domain is equal to Sukuna's own Malevolent Shrine on the inside, only losing due to Malevolent Shrine's open domain that allowed Sukuna to destroy the barrier of Unlimited Void. Satoru's skill with his Domain Expansion is so great that he can precisely control the range and time of it's activation for only 0.2 seconds, limiting its lasting effect on those he traps within it, and is able to freely change the conditions of Unlimited Void's barrier. Those he makes physical contact with are also immune to its effect.", category: "magic"}, {name: "Hollow Technique: Purple", description: "An advanced technique that collides the Lapse and Reversal of the Limitless, resulting in an imaginary mass that is launched at the target.", category: "magic"}],
  [{name: "Attack Titan", description: "After the fall of Wall Maria, Grisha found Eren in a refugee camp and brought him into a nearby forest. After giving him the key to the basement, Grisha injected a struggling Eren with a serum, which transformed him into a 4 meter Pure Titan with short rugged hair and a skinny body. This Titan ate Grisha, giving Eren the powers of the Founding Titan and Attack Titan. Years later, during the first Battle of Trost, Eren was eaten alive by a Titan, and inside the stomach-like cavity saw other fellow recruits lying dead/dying, one wanting her mother before sinking in stomach acid. The sight combined with intense feelings of desperation and his drive to exterminate all Titans awoke his ability to transform into his Titan form for the first time.
  ", category: "transformation"}, {name: "Martial Arts", description: "Originally, Eren's only noteworthy trait was his natural physical strength, which stemmed from having to defend his friend Armin from bullies who were bigger and stronger. As he grew and joined the 104th squad, he trained extensively in hand-to-hand combat. After additional training with Reiner and Annie, Eren's prowess and skill set diversified, including the use of punches, throws, grappling and submission locks. He had the best scores for hand-to-hand combat of the entire 104th graduate squad. While hand-to-hand fighting would appear useless due to the massive physical differences between humans and Titans, these skills gave Eren a powerful edge when fighting other Titans in his own Titan form.", category: "strength"}],
  [{name: "Super Human Intelligence", description: "Rick is unspeakably intelligent, and is frequently mentioned to be the smartest being in the universe. He has made numerous discoveries and invented numerous gadgets and substances. He seems to specialize in robotics above all else, and can easily work through or around most obstacles. Long-term planning, deception, and manipulation are effortless tasks for Rick, and he is skilled at recognizing deception, such as when he saw through a three-layered simulation and pretended to fall for it in order to eliminate his captors, or when he simultaneously destroyed the Council of Ricks, collapsed the Federation, and triggered his daughter's divorce in one fell swoop.", category: "mental"}, {name: "Cybernetic Enhancement", description: "Rick was shown to have extensive cybernetic enhancements, however Rick has gone through and swapped multiple bodies, so it is unlikely that they were all enhanced.", category: "equipment"}],
  [{name: "Mangekyō Sharingan", description: "Itachi awakened the Mangekyō Sharingan after witnessing Shisui's suicide. Its design was three spiralling curves around the pupil. With both eyes, he could use Tsukuyomi, a genjutsu that trapped opponents' minds in an illusory world, altering their perception of time. With his right eye he could use Amaterasu, igniting whatever he looked at with black flames that would burn anything, including fire itself. He had the ability to extinguish Amaterasu.", category: "magic"}, {name: "Susanō", description: "With its simplest manifestations, he could produce extra arms or bones to improve his options in a fight. When used in full, Itachi was surrounded by a spectral warrior that would protect him from damage. In addition to the chakra swords and Yasaka Magatama common to all Susanoo, Itachi's Susanoo wielded the Sword of Totsuka an ethereal sword with the ability to seal any person it pierced into its gourd—hilt and the Yata Mirror a shield that was said to reflect any attack by changing its chakra nature to counterbalance an attack. The simultaneous use of both weapons made Itachi's Susanoo essentially invincible.", category: "summon"}],
  [{name: "Super Strength", description: "The character was depicted as having the ability to move large vehicles, including cars, trains, and ships. Later on he was depicted jump on incredible heights holding cars, even before learning to fly", category: "strength"}, {name: "Super Speed", description: "Superman could run faster than an express train. Later on he was able to run at invisible to a human eye speed. In order to avoid creating sonic booms he used vibration-stunt which he was taught by Earth-2 version of The Flash. At certain point in his stories (since Jerry Siegel's part of Superman #48) Superman could travel in time by circling around arbitrary point in space and then entering it as fast or by sprinting or flying in the straight line. In some stories it was shown that Superman couldn't change significant parts of history, either he was obstructed by invisible wall or reality simply shifted in two creating parallel world with changed events, however not writers followed that notion.", category: "agility"}],
  [{name: "Spider Sense", description: "Spider-sense is a precognitive ability that warns them of impending danger. Although it is still mostly a mystery, it has proven effective. It works as a tingling/buzzing in the base of the skull when danger is near.", category: "mental"}, {name: "Organic Webbing", description: "The effectiveness and amount of organic webbing is depended on a person's health and nutrition. However, in the Spider-Man: The New Animated Series episode The Party, Peter spun organic webs from in front of both his wrists below his hands at Electro's hands, temporary blocking his ability to fire electricity, and in the Spider-Man 3 video game, it completely wraped around and smothered the Mad Bomber's small bombs to prevent an explosion from increasing, and only a little bit of the webbing was torn, in the 616 universe where it had so much power that the webbing was able to wrap and completely cover one of Iron Man's armors, catch a crashing helicopter, and was so insulated that it blocked an electrical current attack from Electro. The organic webbing takes a week to dissolve, instead of an hour. Kaine Parker is also seen to have this ability.", category: "equipment"}],
  [{name: "Master Combatant", description: "Batman is arguably the greatest human combatant in the world. He has mastered multiple fighting styles and uses a mix of them all to perfect his hand to hand combat abilities. He has mastered this to a point where he can easily defeat several opponents at once using strong and near lethal singular hits to knock his opponents out and shatter bones.", category: "strength"}, {name: "Utility Belt", description: "Although seemingly unremarkable in appearance, the utility belt is one of Batman's most important tools in fighting crime.[5] Consisting primarily of a strap and buckle, the utility belt houses ten pouches or cylindrical cartridges that are attached to the outside of the belt. The buckle itself typically contains a miniature camera and a tape recorder. A secondary compartment behind the length of the belt houses Batman's supply of batarangs.", category: "equipment"}],
  [{name: "Mjolnir", description: "The magic hammer that grants him many of his powers and abilities. Forged from the mystical ore Uru, Mjolnir can only be wielded by those who are deemed worthy.", category: "equipment"}, {name: "Element and Weather Manipulation", description: "Thor had been commanding the elements long before he ever wielded Mjolnir. He can create and command atmospheric phenomenon even in places that shouldn't allow them to occur, such as outer space. He can release lightning from his hands, exhale with hurricane-force breath, and create fire rain on an extremely harsh planet. Also, as a son of Earth Mother Gaea, Thor can manipulate tectonic plates to create avalanches, earthquakes, landslides and chasms far beyond what natural phenomenon can offer.", category: "magic"}],
  [{name: "Shadow Clone Jutsu", description: "He could use them to outnumber or deceive his enemies, manoeuvre himself in mid-air, transform into weapons, scout areas, or test an opponent's abilities.During his elemental-affinity training, learning that the original will gain all the knowledge and conditioning of a shadow clone right after it dispersed. From this, Naruto can use his mass scale of clones to drastically speed up his training to gain years worth of experience in just days. By the time he became Hokage, Naruto's usage of this technique on mass-scale and prolonged-periods allowed him to constantly perform multiple simultaneous tasks throughout the village daily, although he does have a tendency to overexert himself, leaving him exhausted afterwards.", category: "summon"}, {name: "Rasengan", description: "Naruto's second trademark technique is the Rasengan. Originally, due to his poor chakra control, Naruto had to use a shadow clone to form the spherical shape while he provided the chakra. Over time, Naruto developed larger versions of the Rasengan and learned how to perform it faster. During the Fourth Shinobi World War, he learned to use the Rasengan and its variants unaided with a single hand, or even form one in both hands simultaneously. He also increased the size of his standard Rasengan.[111] Naruto had also shown the ability to release the Rasengan as an energy wave, or as a projectile in the anime.", category: "magic"}],
  [{name: "Healing Factor", description: "Deadpool possesses a superhuman healing factor derived from that of the mutant Wolverine which allows him to regenerate damaged or destroyed bodily tissue with far greater speed and efficiency than an ordinary human. His head or any other limb can be reattached using this ability. While beheaded, Deadpool can still move his body normally. In small doses, Deadpool's blood has demonstrated the ability to heal others and extend their lifespans beyond their natural limits. When combined with Star Cells injected intravenously, it confers immortality.", category: "strength"}, {name: "Super Human Durability", description: "Deadpool's bone and muscle tissues are augmented to levels that are considerably stronger and harder than human and the tissues are impervious to injury to an extraordinary extent. He possesses golden-proportioned body, and even without training his muscles are brawny and his body shape doesn't change no matter how many calories he intakes.", category: "strength"}],
  [{name: "M for the Speed of Mercury", description: "By channeling Mercury's speed, Captain Marvel can easily fly and move at speeds far exceeding Mach 10 (2 miles a second) while in earth's atmosphere. This is far from his limit as the Speed of Mercury allows him to move at speeds faster than light. Just like Black Adam, his reflexes and speed enhance the impact of his uncharted physical strength. Thanks to the power of Mercury, Marvel flies as swiftly as the messenger god of Greek and Roman myth.", category: "agility"}, {name: "S for the Wisdom of Solomon", description: "Solomon was the third king of united Israel in historical times. According to the Bible God blessed him with supernatural wisdom at his request to lead Israel. Captain Marvel has instant access to a vast amount of knowledge. The wisdom of Solomon is sometimes known as the Wisdom of the Ancients. Captain Marvel has superhuman clairvoyance and awareness. He is provided with counsel and advice in times of need. Captain Marvel has knowledge of all languages, ancient and modern warfare, and can hypnotize or enchant people with his power. The power of wisdom lends him knowledge far beyond mortal comprehension.", category: "mental"}],
  [{name: "Golden Experience", description: "Gold Experience is one of the most versatile Stands in the series. It has the ability to create and manipulate life, which Giorno most often uses to produce plants and small animals. Both can be used for a variety of purposes ranging from disguise to tracking origins. As a short-ranged Power-type, it is also capable of unleashing a rapid flurry of punches, which Giorno uses almost exclusively with lethal intent.", category: "summon"}, {name: "Golden Experience Requiem", description: "Gold Experience Requiem is obtained after Giorno pierces Gold Experience with the Stand-creating Arrow. Gold Experience boasts incredible physical power and retains its ability to give life, with a considerable boost. Additionally, it gained the ability to prevent his opponents from reaching the truth. Whoever is killed by Requiem will also never arrive at the truth behind their death forcing them into a death loop for all eternity. Its ability transcends most Stand abilities, due to it being a Requiem Stand.", category: "summon"},
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}],
  [{name: "", description: "", category: ""}, {name: "", description: "", category: ""}]]
]

powers_url = [
  ["https://wpcdn.us-midwest-1.vip.tn-cloud.net/www.honolulumagazine.com/content/uploads/2021/01/s3-kamehameha.jpg", "https://wallpapercave.com/wp/wp11228095.jpg"],
  ["https://foxsuperpowerlist.files.wordpress.com/2016/06/appendages-tentacles-doctor-octopus-marvel.jpg?w=760", "https://pm1.narvii.com/6717/42bd73e811c277eeae8e15f100a87f9bdf1960b0_hq.jpg"],
  ["https://cdna.artstation.com/p/assets/images/images/031/944/736/large/ari-libella-gojocolotwt.jpg?1605037152", "https://i.kym-cdn.com/entries/icons/original/000/046/899/purplecover.jpg"],
  ["https://4kwallpapers.com/images/walls/thumbs_3t/10339.jpg", "https://s1.zerochan.net/Eren.Jaeger.600.1779372.jpg"],
  ["https://i0.wp.com/www.thewrap.com/wp-content/uploads/2017/09/rick-and-morty-ricks-ranked-simple-rick.jpg?resize=618%2C412&ssl=1", "https://static1.srcdn.com/wordpress/wp-content/uploads/2022/10/Ricks-Gadgets-in-Rick-and-Morty-Episode-5.jpg"],
  ["https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7dd72a9d-2319-4f32-a6a5-0278692ccaa2/d52mf68-c8cbd19c-bfed-4452-9065-010687919ea0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzdkZDcyYTlkLTIzMTktNGYzMi1hNmE1LTAyNzg2OTJjY2FhMlwvZDUybWY2OC1jOGNiZDE5Yy1iZmVkLTQ0NTItOTA2NS0wMTA2ODc5MTllYTAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0._seobISO3RI6cqdVsATL7I5o26FT9ZZhbVH1eOOf7P0", "https://i.pinimg.com/originals/de/34/9a/de349a4be99ff3da70e07476abf9f7a3.jpg"],
  ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ05uoYe4bQOm7vtWHBVigADW8haz_KmPTH5urzg_7rmg&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT1-_yLl7ibvZUzun-KpN2Rqv-M2-TCNzJn3DYoreeEw&s"],
  ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6G07RtzJIXUYN6UhqQgY9vVixlTp9kyko4dCDlssAHg&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqRV9DMSdXaTMbjSGVml1fJ1SiNxAhQH_8imMBdi2ZHg&s"],
  ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDBjgMTi-AiHO6yOgMrqZnYLZM2L9P-h9TPeSg_IF4gQ&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSWWOdSOTHqyHF0B6AwCVE_asDZvOzPd3Poh7ktyGs0A&s"],
  ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm7bNN8s5XAxkaan-l8SHPEdClDn5cZuAvgtXX-ME_Og&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT39D1zEzCPsaSCofGazKgOLLB2bLKx2rD7kJLopL-crA&s"],
  ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYZyNF_Oxd5tsnJCRfUbjjrgtVD3nhUJ2-18b711m05g&s", "https://static1.srcdn.com/wordpress/wp-content/uploads/2022/04/Super-Ultra-Big-Ball-Rasengan.jpg"],
  ["https://qph.cf2.quoracdn.net/main-qimg-d954500a19812a339b7512199f7359e0.webp", "https://staticg.sportskeeda.com/editor/2022/12/cab5b-16704077660057-1920.jpg"],
  ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDE-eQSHDaosXz_GLjSF4l6JwG7wYlp5O7nXUoVl9cDw&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzW2KjPQe9uVTGpRqkv1LQnLOgjsLGMYx12ur-7-zIYQ&s"],
  ["https://mrwallpaper.com/images/high/motorcycle-giorno-giovanna-7jvm5mbvm3vu4bte.jpg", "https://i.pinimg.com/originals/b9/ab/ae/b9abaecb43007ed54fe9f84972e782c5.jpg"],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""],
  ["", ""]
]

puts "creating users"
users.each.with_index do |user_names,index|
  user = User.new(email: "#{user_names[0]}@me.com", alias: user_names[0], secret_identity: user_names[1])
  user.password = "123123"
  puts "Creating #{user.alias}"
  file = URI.open(users_url[index])
  user.photo.attach(io: file, filename: "#{user.alias}.png", content_type: "image/png")
  user.save

  puts "creating powers for #{user.alias}"
  count = 0
  2.times do
    power_attributes = powers[index]
    images = powers_url[index]
    power = Power.new(name: power_attributes[count][:name], user: user, description: power_attributes[count][:description], price: rand(100..250), category: power_attributes[count][:category])
    puts "creating #{power.name}"
    file = URI.open(images[count])
    power.photo.attach(io: file, filename: "#{power_attributes[count][:name]}.png", content_type: "image/png")
    power.save
    count += 1
  end
end

puts "creating bookings"
25.times do
  user = User.all.sample
  powers = Power.where.not(user: user)
  power = powers.sample
  Booking.create!(user: user, power: power, start_date: DateTime.now, end_date: DateTime.now + rand(1..7) )
end

puts "complete"
