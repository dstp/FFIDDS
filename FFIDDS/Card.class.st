"
Carte : value, suit
"
Class {
	#name : 'Card',
	#superclass : 'Bridge',
	#instVars : [
		'suit',
		'rank'
	],
	#category : 'FFIDDS-Base',
	#package : 'FFIDDS',
	#tag : 'Base'
}

{ #category : 'converting' }
Card >> printString [ 
	"
	"
	^ rank asString
]

{ #category : 'accessing' }
Card >> rank [

	^ rank
]

{ #category : 'accessing' }
Card >> rank: anObject [

	rank := anObject
]

{ #category : 'accessing' }
Card >> suit [

	^ suit
]

{ #category : 'accessing' }
Card >> suit: anObject [

	suit := anObject
]
