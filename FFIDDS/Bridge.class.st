"
I am grouping together the items that make up a bridge table:
– The cards
– The hands
"
Class {
	#name : 'Bridge',
	#superclass : 'Object',
	#classVars : [
		'TextMorphV',
		'WindowMorphV'
	],
	#pools : [
		'ConstantPool'
	],
	#category : 'FFIDDS-Base',
	#package : 'FFIDDS',
	#tag : 'Base'
}

{ #category : 'converting' }
Bridge class >> asMorphText: aTable [
	"
	"
	aTable createHands .
	self textMorph contents: aTable asStringWithDeal.
	self windowMorph setLabel: 'dealer : ' , ((Array
			  with: North uniqueInstance
			  with: East uniqueInstance
			  with: South uniqueInstance
			  with: West uniqueInstance) at: ('NESW' indexOf: aTable dealer))
			name.
	self windowMorph openInWorld
]

{ #category : 'accessing' }
Bridge class >> textMorph [

	^ TextMorphV ifNil: [
			  TextMorphV := TextMorph new
				                contents: '';
				                font: Font;
				                position: 30 @ 30;
				                extent: TextExtent ]
]

{ #category : 'accessing' }
Bridge class >> textMorph: anObject [

	^ TextMorphV := anObject
]

{ #category : 'accessing' }
Bridge class >> windowMorph [

	^ WindowMorphV ifNil: [
			  WindowMorphV := (SystemWindow labelled: 'a new Deal')
				                  addMorphFront: self textMorph;
				                  extent: WindowExtent ]
]

{ #category : 'accessing' }
Bridge class >> windowMorph: anObject [

	^ WindowMorphV := anObject
]

{ #category : 'converting' }
Bridge >> asMorphText [
	^ self class asMorphText
]

{ #category : 'converting' }
Bridge >> asMorphText: aTable [ 
	^ self class asMorphText: aTable 
]
