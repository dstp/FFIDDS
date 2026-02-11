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

{ #category : 'printing' }
Card >> printOn: aStr [
	"
	"
	aStr "nextPutAll: 'aCard -> ';"
			nextPutAll: self printRank ;
			nextPutAll: self printSuit.
]

{ #category : 'converting' }
Card >> printRank [
	"
	"
	^ rank asString.
]

{ #category : 'converting' }
Card >> printString [ 
	"
	"
	^ rank asString
]

{ #category : 'converting' }
Card >> printSuit [
	"
	"
	^ #( 'p' 'h' 'd' 'c') at: suit.
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
