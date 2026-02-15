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

"	| aTextMorph |
	aTextMorph := self asMorphText.
	aTextMorph openInWindow.
	aTextMorph window setLabel: 'dealer : ' , ((Array
			  with: North uniqueInstance
			  with: East uniqueInstance
			  with: South uniqueInstance
			  with: West uniqueInstance) at: ('NESW' indexOf: aTable dealer))
			name.
	aTextMorph contents: aTable asStringWithDeal"
	"(self windowMorph submorphsSatisfying: [ :m | m class = TextMorph ]) first  contents: aTable asStringWithDeal"
	self textMorph contents: aTable asStringWithDeal.
	self windowMorph setLabel: 'dealer : ' , ((Array
			  with: North uniqueInstance
			  with: East uniqueInstance
			  with: South uniqueInstance
			  with: West uniqueInstance) at: ('NESW' indexOf: aTable dealer))
			name.
	self windowMorph openInWorld.


]

{ #category : 'accessing' }
Bridge class >> textMorph [

	^ TextMorphV ifNil: [
			  TextMorphV := TextMorph new
				                contents: '';
				                font: Font;
				                overrideExtent: 580 @ 320 ]
]

{ #category : 'accessing' }
Bridge class >> textMorph: anObject [

	^ TextMorphV := anObject
]

{ #category : 'accessing' }
Bridge class >> windowMorph [

	^ WindowMorphV ifNil: [
		  WindowMorphV := self textMorph openInWindow window hide ]
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
