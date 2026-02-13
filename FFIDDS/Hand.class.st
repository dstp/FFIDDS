"
A hand in bridge consists of the 13 cards dealt to a player.
The four bridge players are called North, East, South, and West.
"
Class {
	#name : 'Hand',
	#superclass : 'Bridge',
	#instVars : [
		'spade',
		'heart',
		'diamond',
		'club'
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
Hand >> club [

	^ club
]

{ #category : 'accessing' }
Hand >> diamond [

	^ diamond
]

{ #category : 'accessing' }
Hand >> hand: anObject [

	| anArray |
	anArray := Array new: 4.
	anObject asOrderedCollection withIndexCollect: [ :obj :ind |
			anArray at: ind put: (obj asOrderedCollection collect: [ :e |
						 Card new
							 suitValue: ind;
							 rankPBNToRankValue: e;
							 yourself ]) ].
	spade := Spade newWith: anArray first.
	heart := Heart newWith: (anArray at: 2).
	diamond := Diamond newWith: (anArray at: 3).
	club := Club newWith: anArray last
]

{ #category : 'accessing' }
Hand >> heart [

	^ heart
]

{ #category : 'accessing' }
Hand >> name [

	^ self shouldNotImplement 
]

{ #category : 'printing' }
Hand >> printOn: aStr [
	"
	A test
	"

	aStr
		nextPutAll: self name;
		nextPutAll: ': '.
	spade printOn: aStr.
	heart printOn: aStr.
	diamond printOn: aStr.
	club printOn: aStr
]

{ #category : 'accessing' }
Hand >> spade [

	^ spade
]
