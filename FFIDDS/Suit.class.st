"
A suit in bridge groups together all the cards of the same suit.
"
Class {
	#name : 'Suit',
	#superclass : 'Bridge',
	#instVars : [
		'cards'
	],
	#category : 'FFIDDS-Base',
	#package : 'FFIDDS',
	#tag : 'Base'
}

{ #category : 'instance creation' }
Suit class >> newWith: anOC [
	"
	"

	| aSuit |
	aSuit := self new.
	aSuit cards: anOC.
	^ aSuit
]

{ #category : 'converting' }
Suit >> asString [
	"
	"

	| aStr |
	aStr := WriteStream with: String new.
	aStr
		nextPutAll: self name;
		nextPutAll: ': '.
	cards do: [ :aCard | aStr nextPutAll: aCard rank asString ].
	^ aStr contents
]

{ #category : 'accessing' }
Suit >> cards: anObject [

	cards := anObject
]

{ #category : 'accessing' }
Suit >> name [
	"
	"
	self shouldBeImplemented .
]

{ #category : 'printing' }
Suit >> printOn: aStr [
	"
	"

	aStr
		nextPutAll: self name;
		nextPutAll: '->{'.
	cards do: [ :aCard | aStr nextPutAll: aCard rank asString ].
	aStr nextPutAll: '} '
]
