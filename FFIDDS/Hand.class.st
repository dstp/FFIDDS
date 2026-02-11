"
La main du jouer
"
Class {
	#name : 'Hand',
	#superclass : 'Bridge',
	#instVars : [
		'hand'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'FFIDDS-Base',
	#package : 'FFIDDS',
	#tag : 'Base'
}

{ #category : 'accessing' }
Hand class >> uniqueInstance [
	self = Hand
		ifTrue: [ self error: 'I''m an abstract class, use one of my children.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : 'accessing' }
Hand >> hand [

	^ hand
]

{ #category : 'accessing' }
Hand >> hand: anObject [

	| anArray |
	anArray := Array new: 4.
	anObject asOrderedCollection withIndexCollect: [ :obj : ind |
		anArray at: ind put: (obj asOrderedCollection collect: [ :e | 
			Card new suit: ind; rank: e; yourself.
		])
	] .
	hand := anArray .
]

{ #category : 'accessing' }
Hand >> name [

	^ self className 
]

{ #category : 'printing' }
Hand >> printOn: aStr [
	"
	"

	aStr
		nextPutAll: self name;
		nextPutAll: ':'.
	self hand doWithIndex: [ :suit :idx |
			aStr
				nextPutAll: suit first printSuit;
				nextPutAll: '->{'.
			suit do: [ :aC |
					aStr
						nextPutAll: aC printRank ].
				aStr	nextPutAll: '} ' ] 
]
