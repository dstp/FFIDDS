"
Je represente une main composée de 13 cartes regroupées par couleur
"
Class {
	#name : 'Hand',
	#superclass : 'Object',
	#instVars : [
		'suits',
		'name',
		'index'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Bridge-cards',
	#package : 'Bridge-cards'
}

{ #category : 'accessing' }
Hand class >> uniqueInstance [
	self = Hand
		ifTrue: [ self error: 'I''m an abstract class, use one of my children.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : 'conversion' }
Hand >> asString [ 
 | aStream |
aStream := WriteStream with: ByteString new.
	self suits
		inject: aStream
		into: [ :str :aCoul | 
			str
				nextPutAll: aCoul asString;
				cr;
				yourself ].
	aStream
		nextPutAll: 'HLD: ';
		nextPutAll: self ptHLD asString;
		space;
		nextPutAll: 'LJ: ';
		nextPutAll: self nbLJ asString;
		space;
		nextPutAll: 'P: ';
		nextPutAll: self nbP asString;
		cr.
		^ aStream contents
]

{ #category : 'accessing' }
Hand >> clubs [
	^ self suits at: 4
]

{ #category : 'accessing' }
Hand >> clubs: anObject [
	self clubs cards: anObject
]

{ #category : 'accessing' }
Hand >> diamonds [
	^ self suits at: 3
]

{ #category : 'accessing' }
Hand >> diamonds: anObject [
	self diamonds cards: anObject
]

{ #category : 'accessing' }
Hand >> hearts [
	^ self suits at: 2
]

{ #category : 'accessing' }
Hand >> hearts: anObject [
	self hearts cards: anObject
]

{ #category : 'accessing' }
Hand >> index [

	^ index
]

{ #category : 'accessing' }
Hand >> index: anObject [

	index := anObject
]

{ #category : 'accessing' }
Hand >> name [
	^ name
]

{ #category : 'accessing' }
Hand >> name: anObject [
	name := anObject
]

{ #category : 'evaluation' }
Hand >> nbLJ [
	"^ self piques nbLJ + self coeurs nbLJ + self carreaux nbLJ + self trefles nbLJ"

	^ self suits inject: 0 into: [ :sum :aC | sum + aC nbLJ ]
]

{ #category : 'evaluation' }
Hand >> nbP [
	"^ self piques nbP + self coeurs nbP + self carreaux nbP + self trefles nbP"
	^ self suits inject: 0 into: [ :sum :aC | sum + aC nbP ]
]

{ #category : 'evaluation' }
Hand >> ptD [
	"^ self piques ptD + self coeurs ptD + self carreaux ptD + self trefles ptD"

	^ self suits inject: 0 into: [ :sum :aC | sum + aC ptD ]
]

{ #category : 'evaluation' }
Hand >> ptH [
	"^ self piques ptH + self coeurs ptH + self carreaux ptH + self trefles ptH"
	
	^ self suits inject: 0 into: [ :sum :aC | sum + aC ptH ]
]

{ #category : 'evaluation' }
Hand >> ptHL [
	^ self ptH + self ptL
]

{ #category : 'evaluation' }
Hand >> ptHLD [ 
	^ self ptHL + self ptD
]

{ #category : 'evaluation' }
Hand >> ptL [
	"^ self piques ptL + self coeurs ptL + self carreaux ptL + self trefles ptL"
	^ self suits inject: 0 into: [ :sum :aC | sum + aC ptL ]	
]

{ #category : 'accessing' }
Hand >> spades [
	^ (self suits at: 1)
]

{ #category : 'accessing' }
Hand >> spades: anObject [
	self spades cards: anObject
]

{ #category : 'accessing' }
Hand >> suits [
	"test"

	^ suits
		ifNil: [ suits := Array
				with: (Suit new suit: 's')
				with: (Suit new suit: 'h')
				with: (Suit new suit: 'd')
				with: (Suit new suit: 'c') ]
]

{ #category : 'accessing' }
Hand >> suits: anObject [

	suits := anObject
]
