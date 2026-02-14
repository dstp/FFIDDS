"
I am grouping together the items that make up a bridge table:
– The cards
– The hands
"
Class {
	#name : 'Bridge',
	#superclass : 'Object',
	#pools : [
		'ConstantPool'
	],
	#category : 'FFIDDS-Base',
	#package : 'FFIDDS',
	#tag : 'Base'
}

{ #category : 'converting' }
Bridge class >> asMorphText [
	"
	"

	^ TextMorph new
		  contents: '';
		  font: Font;
		  overrideExtent: 580 @ 320
]

{ #category : 'converting' }
Bridge class >> asMorphText: aTable [
	"
	"

	| aTxtMorph |
	aTxtMorph := self asMorphText .
	aTxtMorph openInWindow.
	aTxtMorph window setLabel: aTable dealer asString.
	aTxtMorph contents: aTable asStringWithDeal
]

{ #category : 'converting' }
Bridge >> asMorphText [
	^ self class asMorphText
]

{ #category : 'converting' }
Bridge >> asMorphText: aTable [ 
	^ self class asMorphText: aTable 
]
