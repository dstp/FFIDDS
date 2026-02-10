"
Je regroupe des cartes de la mêmecouleur
"
Class {
	#name : 'Suit',
	#superclass : 'Object',
	#instVars : [
		'cards',
		'suit'
	],
	#classInstVars : [
		'dictLJ'
	],
	#category : 'Bridge-cards',
	#package : 'Bridge-cards'
}

{ #category : 'accessing' }
Suit class >> dictLJ [
	^ dictLJ
		ifNil: [ dictLJ := {(#AQ -> 1.5).
			(#AQT -> 2).
			(#AQJ -> 2.5).
			(#AQx -> 1.5).
			(#AK -> 2).
			(#AKQ -> 3).
			(#AKT -> 2.25).
			(#AKJ -> 2.5).
			(#AKx -> 2).
			(#AT -> 1).
			(#ATx -> 1).
			(#AJ -> 1).
			(#AJT -> 1.75).
			(#AJx -> 1.25).
			(#Ax -> 1).
			(#Axx -> 1).
			(#Q -> 0).
			(#QT -> 0).
			(#QTx -> 0.5).
			(#QJ -> 0).
			(#QJT -> 1).
			(#QJx -> 0.75).
			(#Qx -> 0).
			(#Qxx -> 0.25).
			(#K -> 0).
			(#KQ -> 1).
			(#KQT -> 1.5).
			(#KQJ -> 2).
			(#KQx -> 1).
			(#KT -> 0.5).
			(#KTx -> 0.5).
			(#KJ -> 0.5).
			(#KJT -> 1.5).
			(#KJx -> 0.5).
			(#Kx -> 0.5).
			(#Kxx -> 0.5).
			(#T -> 0).
			(#Tx -> 0).
			(#Txx -> 0).
			(#J -> 0).
			(#JT -> 0).
			(#JTx -> 0).
			(#Jx -> 0).
			(#Jxx -> 0).
			(#x -> 0).
			(#xx -> 0).
			(#xxx -> 0)} asDictionary ]
]

{ #category : 'accessing' }
Suit class >> dictLJ: anObject [
	dictLJ := anObject.
]

{ #category : 'evaluation' }
Suit >> ace [
	^ (self cards select: [ :aC | aC val = 14 ]) size
]

{ #category : 'converting' }
Suit >> asLJCle [
	^ (self asLJString copyFrom: 1 to: (self nb min: 3)) asSymbol
]

{ #category : 'converting' }
Suit >> asLJString [
	^ ((self cards sort: [ :a :b | a val > b val])
		inject: (WriteStream with: String new)
		into: [ :str :aC | 
			str
				nextPutAll: aC asLJString;
				yourself ]) contents
]

{ #category : 'converting' }
Suit >> asString [
	^ ((self cards sort: [ :a :b | a val > b val ])
		inject: (WriteStream with: self suit , ':')
		into: [ :str :aC | 
			str
				nextPutAll: aC asValString;
				yourself ]) contents
]

{ #category : 'accessing' }
Suit >> cards [
	^ cards
]

{ #category : 'accessing' }
Suit >> cards: anObject [
	cards := anObject
]

{ #category : 'testing' }
Suit >> isChicane [
	^ self nb = 0
]

{ #category : 'testing' }
Suit >> isDoubleton [
	^ self nb = 2
]

{ #category : 'testing' }
Suit >> isSingleton [
	^ self nb = 1
]

{ #category : 'evaluation' }
Suit >> king [
	^ (self cards select: [ :aC | aC val = 13 ]) size
]

{ #category : 'evaluation' }
Suit >> nb [
	^ self cards size
]

{ #category : 'evaluation' }
Suit >> nbGH [
	^ self cards inject: 0 into:  [ :sum :aC | sum + aC isGH ifTrue: [1] ifFalse:[0]]
]

{ #category : 'evaluation' }
Suit >> nbLJ [
	^ self nb = 0
		ifTrue: [ 0 ]
		ifFalse: [ (self class dictLJ at: self asLJCle) + self ptLLJ ]
]

{ #category : 'evaluation' }
Suit >> nbP [
	| l |
	l := self nb.
	l > 2
		ifTrue: [ ^ 3 - self ace - self king - self queen ].
	l = 2
		ifTrue: [ ^ 2 - self ace - self king ].
	l = 1
		ifTrue: [ ^ 1 - self ace ].
	^ 0
]

{ #category : 'printing' }
Suit >> printOn: aStream [
	aStream
		nextPutAll: self asString

]

{ #category : 'evaluation' }
Suit >> ptD [
	^ #(3 2 1 0) at: (self nb + 1 min: 4)
]

{ #category : 'evaluation' }
Suit >> ptH [
	^ self cards inject: 0 into:  [ :sum :aC | sum + aC ptH ]
]

{ #category : 'evaluation' }
Suit >> ptHL [
	^ self ptH + self ptL
]

{ #category : 'evaluation' }
Suit >> ptL [
	^ self nb > 4
		ifTrue: [ self nb - 4 ]
		ifFalse: [ 0 ]
]

{ #category : 'evaluation' }
Suit >> ptLLJ [
	^ #(0 0 0 0 0.5 1.5 3 4 5 6 7 8 9 10) at: self nb + 1
]

{ #category : 'evaluation' }
Suit >> queen [
	^ (self cards select: [ :aC | aC val = 12 ]) size
]

{ #category : 'accessing' }
Suit >> suit [
	^ suit
]

{ #category : 'accessing' }
Suit >> suit: anObject [
	suit := anObject
]
