"
A hand in bridge consists of the 13 cards dealt to a player.
The four bridge players are called North, East, South, and West.
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
Hand class >> initializeUniqueInstance [
	self = Hand
		ifTrue: [ self error: 'I''m an abstract class, use one of my children.' ].
	^ uniqueInstance := super new.
]

{ #category : 'accessing' }
Hand class >> uniqueInstance [
	self = Hand
		ifTrue: [ self error: 'I''m an abstract class, use one of my children.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]

{ #category : 'accessing' }
Hand >> clubs [
	"
	"
	^ self hand last
]

{ #category : 'accessing' }
Hand >> diamonds [
	"
	"
	^ self hand at: 3
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
			Card new suitValue: ind; rankPBNToRankValue: e; yourself.
		])
	] .
	hand := anArray .
]

{ #category : 'accessing' }
Hand >> hearts [
	"
	"
	^ self hand at: 2
]

{ #category : 'accessing' }
Hand >> name [

	^ self className 
]

{ #category : 'printing' }
Hand >> printOn: aStr [
	"
	A test
	"

	aStr
		nextPutAll: self name;
		nextPutAll: ':'.
	self hand ifNotNil: [
			self hand doWithIndex: [ :aSuit :idx |
					aStr
						nextPutAll: aSuit first suit;
						nextPutAll: '->{'.
					aSuit do: [ :aC | aStr nextPutAll: aC rank asString].
					aStr nextPutAll: '} ' ] ]
]

{ #category : 'accessing' }
Hand >> spades [
	"
	"
	^ self hand first
]
