Age.create!(name: 'pour tout petits')
Age.create!(name:  'pour enfants')
Age.create!(name:  'pour ados')
Age.create!(name:  'pour adultes')

Ambiance.create!(name: 'jeux d\'ambiance')
Ambiance.create!(name:  'jeux de plateau')
Ambiance.create!(name:  'jeux familiaux')
Ambiance.create!(name: ' jeux de cartes classiques')
Ambiance.create!(name:   'jeux en bois')

Complexite.create!(name: 'simple')
Complexite.create!(name: 'moyen')
Complexite.create!(name: 'complexe')

Duree.create!(name: '< 30 mn')
Duree.create!(name: 'entre 30 min et 1H')
Duree.create!(name: 'entre 1 et 2h')
Duree.create!(name: 'entre 2 et 4h')
Duree.create!(name: '> 4h')

NbJoueur.create!(number: 1)
NbJoueur.create!(number: 2)
NbJoueur.create!(number: 3)
NbJoueur.create!(number: 4)
NbJoueur.create!(number: 5)
NbJoueur.create!(number: 6)
NbJoueur.create!(number: 7)
NbJoueur.create!(number: 8)
NbJoueur.create!(number: 9)

Style.create!(name: 'collaboratif')
Style.create!(name: 'semi-collaboratif')
Style.create!(name: 'diplomacie/trahison')
Style.create!(name: 'deck building/combinaison de cartes')
Style.create!(name: 'trading')
Style.create!(name: 'draft')
Style.create!(name: 'gestion de ressources')
Style.create!(name: 'parcours')
Style.create!(name: 'guerres/invasions')
Style.create!(name: 'impro/jeu de r&ocirc;le')
Style.create!(name: 'apprendre des choses sur les autres')
Style.create!(name: 'd&eacute;fis/actions physiques')
Style.create!(name: 'rapidit&eacute;')
Style.create!(name: 'Hazard (chance importante)')
Style.create!(name: 'Questions / culture G')
Style.create!(name: 'Pourissage')
Style.create!(name: 'Exploration')
Style.create!(name: 'bluff')
Style.create!(name: 'jeu simultan&eacute; / programmation')
Style.create!(name: 'd&eacute;duction')

Thematique.create!(name: 'sans')
Thematique.create!(name: 'pirates / naval')
Thematique.create!(name: 'immobilier')
Thematique.create!(name: 'mythes')
Thematique.create!(name: 'conqu&eacute;rant')
Thematique.create!(name: 'virus')
Thematique.create!(name: 'policier')
Thematique.create!(name: 'histoire')
Thematique.create!(name: 'temps')
Thematique.create!(name: 'amour')
Thematique.create!(name: 'transports terrestres')
Thematique.create!(name: 'espace')

Version.create!(name: 'tout public')
Version.create!(name: 'a boire')
Version.create!(name: '-18')
