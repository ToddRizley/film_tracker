

oscar_categories =[ "Picture",
"Director",
"Actor in a Leading Role",
"Actor in a Supporting Role",
"Actress in a Leading Role",
"Actress in a Supporting Role",
"Animated Feature",
"Animated Short Film",
"Cinematography",
"Costume Design",
"Documentary Feature",
"Documentary Short Subject",
"Film Editing",
"Foreign Language Film",
"Live Action Short Film",
"Makeup and Hairstyling",
"Original Score",
"Original Song",
"Production Design",
"Sound Editing",
"Sound Mixing",
"Visual Effects",
"Adapted Screenplay",
"Original Screenplay"
]

oscar_categories.each { |oc| OscarCategory.create(name: oc) }
