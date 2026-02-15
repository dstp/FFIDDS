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
		'club',
		'textMorph'
	],
	#classVars : [
		'WindowMorphV2'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'FFIDDS-Base',
	#package : 'FFIDDS',
	#tag : 'Base'
}

{ #category : 'converting' }
Hand class >> asMorphText: aTable [
	"
	"

	aTable createHands.
	Results := aTable tableResults.
	self windowMorph setLabel: 'dealer : ' , ((Array
			  with: North uniqueInstance
			  with: East uniqueInstance
			  with: South uniqueInstance
			  with: West uniqueInstance) at: ('NESW' indexOf: aTable dealer))
			name.
	"North changeContents.
	East changeContents.
	South changeContents.
	West changeContents."
	self windowMorph openInWorld
]

{ #category : 'converting' }
Hand class >> asTableResultsMorph [
	"
	"
	^ TextMorph new
		  contents: Results asString;
		  font: Font;
		  position: 10 @ 25;
		  overrideExtent: 200 @ 200
]

{ #category : 'converting' }
Hand class >> asTextMorph [
	"
	"
	^ self uniqueInstance asTextMorph 
]

{ #category : 'converting' }
Hand class >> changeContents [
	"
	"

	^ self uniqueInstance changeContents
]

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
Hand class >> windowMorph [

	^ WindowMorphV2 ifNil: [
			  WindowMorphV2 := (SystemWindow labelled: 'a new Deal')
				                   "addMorph: North textMorph;
				                   addMorph: East textMorph;
				                   addMorph: South textMorph;
				                   addMorph: West textMorph;"
			 				 addMorph: North asTextMorph;
				                   addMorph: East asTextMorph;
				                   addMorph: South asTextMorph;
				                   addMorph: West asTextMorph;
							 addMorph: self asTableResultsMorph;extent:  WindowExtent ]

]

{ #category : 'accessing' }
Hand class >> windowMorph: anObject [

	WindowMorphV2 := anObject
]

{ #category : 'converting' }
Hand >> asString [
	"
	"

	| aStr |
	aStr := WriteStream with: String new.
	aStr
		nextPutAll: self name;
		cr;
		nextPutAll: self spade asString;
		cr;
		nextPutAll: self heart asString;
		cr;
		nextPutAll: self diamond asString;
		cr;
		nextPutAll: self club asString;
		cr.
	^ aStr contents
]

{ #category : 'converting' }
Hand >> asTextMorph [
	"
	"

	^ TextMorph new
		  contents: self asString;
		  font: Font;
		  position: self position;
		  overrideExtent:  self extent
]

{ #category : 'converting' }
Hand >> changeContents [ 
	"
	"
	
	self textMorph contents: self asString 
]

{ #category : 'accessing' }
Hand >> club [

	^ club
]

{ #category : 'accessing' }
Hand >> diamond [

	^ diamond
]

{ #category : 'converting' }
Hand >> extent [
	"
	"

	^ 200 @ 150
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

	^ self className
]

{ #category : 'converting' }
Hand >> position [ 
	"
	"
	^ self shouldBeImplemented 

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

{ #category : 'accessing' }
Hand >> tableResults [

	^ Results
]

{ #category : 'accessing' }
Hand >> tableResults: anObject [

	Results := anObject
]

{ #category : 'accessing' }
Hand >> textMorph [
	"
	"

	^ textMorph ifNil: [
			  textMorph := TextMorph new
				               contents: '';
				               font: Font;
				               position: self position;
				               overrideExtent: self extent ]
]

{ #category : 'accessing' }
Hand >> textMorph: anObject [

	textMorph := anObject
]
