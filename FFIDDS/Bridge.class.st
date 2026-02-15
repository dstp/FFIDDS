"
I am grouping together the items that make up a bridge table:
– The cards
– The hands
"
Class {
	#name : 'Bridge',
	#superclass : 'Object',
	#classVars : [
		'WindowMorph'
	],
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
	aTxtMorph := self asMorphText.
	aTxtMorph openInWindow.
	aTxtMorph window setLabel: 'dealer : ' , ((Array with: North uniqueInstance with: East uniqueInstance with: South uniqueInstance with: West uniqueInstance ) at: ('NESW' indexOf: aTable dealer)) name.
	aTxtMorph contents: aTable asStringWithDeal
]

{ #category : 'accessing' }
Bridge class >> windowMorph [

	^ WindowMorph ifNil: [ WindowMorph := self asMorphTex openInWindow window hide window ]
]

{ #category : 'accessing' }
Bridge class >> windowMorph: anObject [

	^ WindowMorph := anObject
]

{ #category : 'converting' }
Bridge >> asMorphText [
	^ self class asMorphText
]

{ #category : 'converting' }
Bridge >> asMorphText: aTable [ 
	^ self class asMorphText: aTable 
]
