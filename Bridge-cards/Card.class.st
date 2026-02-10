"
Je represente une carte à jouer (Bridge)
"
Class {
	#name : 'Card',
	#superclass : 'Object',
	#instVars : [
		'val',
		'suit'
	],
	#classInstVars : [
		'cartes'
	],
	#category : 'Bridge-cards',
	#package : 'Bridge-cards'
}

{ #category : 'accessing' }
Card class >> cardNone [
	^ self new
		suit: #X;
		val: 0
]

{ #category : 'accessing' }
Card class >> cards [
	"	cartes
		ifNil: [ cartes := OrderedCollection new.
			#(#P #C #K #T)
				do: [ :coul | 
					#(2 3 4 5 6 7 8 9 10 11 12 13 14)
						do: [ :val | 
							cartes
								add:
									(self new
										coul: coul;
										val: val) ] ] ]."

	"	cartes
		ifNil: [ cartes := #(#P #C #K #T)
				inject: OrderedCollection new
				into: [ :res :c | 
					#(2 3 4 5 6 7 8 9 10 11 12 13 14)
						inject: res
						into: [ :res2 :v | 
							res2
								add:
									(Carte new
										coul: c;
										val: v);
								yourself ] ] ]."

	cartes
		ifNil: [ cartes := (#(#s #h #d #c)
				collect: [ :c | 
					#(2 3 4 5 6 7 8 9 10 11 12 13 14)
						collect: [ :v | 
							Card new
								suit: c;
								val: v ] ]) flattened ].
	^ cartes
]

{ #category : 'accessing' }
Card class >> cards: anObject [
	cartes := anObject.

]

{ #category : 'initialize' }
Card class >> name: aCoulVal [
	^ self cards
		detect: [ :aC | aC asString = aCoulVal ] 
		ifNone: [ self cardNone ]
]

{ #category : 'initialize' }
Card class >> suit: aCoul val: aVal [
	^ cartes
		detect: [ :aC | aC suit = aCoul and: [ aC val = aVal ] ]
		ifNone: [ self cardNone ]
]

{ #category : 'converting' }
Card >> asLJString [
	^ #('?' 'x' 'x' 'x' 'x' 'x' 'x' 'x' 'x' 'T' 'J' 'Q' 'K' 'A') at: self val
]

{ #category : 'converting' }
Card >> asString [
	^ self suit, self asValString 
]

{ #category : 'converting' }
Card >> asValString [
	^ #('?' '2' '3' '4' '5' '6' '7' '8' '9' 'T' 'J' 'Q' 'K' 'A') at: self val
]

{ #category : 'testing' }
Card >> isGC [
	^ self val between: 8 and: 10
]

{ #category : 'testing' }
Card >> isGH [
	^ self val between: 12 and: 14
]

{ #category : 'testing' }
Card >> isH [
	^ self val between: 10 and: 14
]

{ #category : 'testing' }
Card >> isPC [
	^ self val < 8
]

{ #category : 'printing' }
Card >> printOn: aStream [
	aStream nextPutAll: self asString
]

{ #category : 'evaluation' }
Card >> ptH [
	^ self val > 10 ifTrue: [ self val -10 ] ifFalse: [ 0 ]
]

{ #category : 'accessing' }
Card >> suit [
	^ suit
]

{ #category : 'accessing' }
Card >> suit: aCoul [
	suit := aCoul
]

{ #category : 'accessing' }
Card >> val [
	^ val
]

{ #category : 'accessing' }
Card >> val: aVal [
	val := aVal
]
