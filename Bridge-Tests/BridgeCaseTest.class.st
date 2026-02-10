"
Tests pour le jeu de bridge 
"
Class {
	#name : 'BridgeCaseTest',
	#superclass : 'TestCase',
	#category : 'Bridge-Tests',
	#package : 'Bridge-Tests'
}

{ #category : 'test' }
BridgeCaseTest >> testCarte [
	" je teste une carte "

	self assert: (Card name: 'sA') isGH equals: true.
	self assert: (Card suit: #s val: 7) isPC equals: true.
	self assert: (Card name: 'cT') isH equals: true.
	self assert: (Card suit: #s val: 9) isGC equals: true.
	self assert: (Card suit: #s val: 9) ptH equals: 0.
	self assert: (Card name: 'dK') ptH equals: 3
]

{ #category : 'test' }
BridgeCaseTest >> testCouleur [
	" je teste une couleur "

	| aCoul |
	aCoul := Suit new suit: 's'.
	aCoul cards: (#(11 10 8 2 13 14) collect: [ :aVal | Card suit: #s val: aVal ]).
	self assert: aCoul asLJString equals: 'AKJTxx'.
	self assert: aCoul asLJCle equals: 'AKJ'.
	self assert: aCoul asString equals: 's:AKJT82'.
	self assert: aCoul nb equals: 6.
	self assert: aCoul ptH equals: 8.
	self assert: aCoul ptL equals: 2.
	self assert: aCoul ptHL equals: 10.
	self assert: aCoul ptD equals: 0.
	self assert: aCoul nbLJ equals: 5.5.
	self assert: aCoul nbP equals: 1.
	aCoul cards: (#(13) collect: [ :aVal | Card suit: #s val: aVal ]).
	self assert: aCoul nb equals: 1.
	self assert: aCoul ptH equals: 3.
	self assert: aCoul ptL equals: 0.
	self assert: aCoul ptHL equals: 3.
	self assert: aCoul ptD equals: 2.
	self assert: aCoul nbLJ equals: 0.
	self assert: aCoul nbP equals: 1.
	aCoul cards: #().
	self assert: aCoul nb equals: 0.
	self assert: aCoul ptH equals: 0.
	self assert: aCoul ptL equals: 0.
	self assert: aCoul ptHL equals: 0.
	self assert: aCoul ptD equals: 3.
	self assert: aCoul nbLJ equals: 0.
	self assert: aCoul nbP equals: 0
]

{ #category : 'tests' }
BridgeCaseTest >> testCreationCarte [
	" je crée les 52 cartes "

	self assert: (Card suit: #s val: 14) val equals: 14.
	self assert: (Card suit: #s val: 16) val equals: 0.
	self assert: (Card suit: #S val: 10) val equals: 0.
	self assert: (Card suit: #S val: 16) suit equals: #X
]

{ #category : 'test' }
BridgeCaseTest >> testMain [
	" je teste une main "

	| aMain |
	aMain := Hand new.
	aMain spades: (#(14 13 11 10 8 2) collect: [ :aVal | Card suit: #s val: aVal ]).
	aMain hearts: (#(14 13 5 3) collect: [ :aVal | Card suit: #h val: aVal ]).
	aMain diamonds: (#(13 2) collect: [ :aVal | Card suit: #d val: aVal ]).
	aMain clubs: #().
	self assert: aMain ptH equals: 8 + 7 + 3 + 0.
	self assert: aMain ptL equals: 2 + 0 + 0 + 0.
	self assert: aMain ptD equals: 0 + 0 + 1 + 3.
	self assert: aMain ptHLD equals: 8 + 7 + 3 + 2 + 1 + 3.
	self assert: aMain nbP equals: 1 + 1 + 1 + 0.
	self assert: aMain nbLJ equals: 5.5 + 2.5 + 0.5 + 0.
	self
		assert: aMain asString
		equals:
			's:AKJT82
h:AK53
d:K2
c:
HLD: 24 LJ: 8.5 P: 3
'
]
