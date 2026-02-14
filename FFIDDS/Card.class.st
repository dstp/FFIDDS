"
A card is described by its rank and its suit:
The rank can be expressed by its external value (self rank returns a Character) - A,K,Q,J,T,9,8,7,6,5,4,3,2 or by its internal value (self rankValue returns a SmallInteger) - 14,13,12,11,10,9,8,7,6,5,4,3,2.
The suit be expressed by its external value (self suit returns a ByteString) - 's','h','d','c' or by its internal value (self suitValue returns a SmallInteger) - 1,2,3,4 
"
Class {
	#name : 'Card',
	#superclass : 'Bridge',
	#instVars : [
		'suitValue',
		'rankValue'
	],
	#category : 'FFIDDS-Base',
	#package : 'FFIDDS',
	#tag : 'Base'
}

{ #category : 'converting' }
Card >> asMorph [
	"
	"
	^ ImageMorph new image: (GifDict at: self code ).


]

{ #category : 'converting' }
Card >> asMorphImage [
	"
	"

	^ ImageMorph new image: (GifDict at: self code)
]

{ #category : 'converting' }
Card >> asMorphText [
	"
	"

	^ TextMorph new
		  text: self rank;
		  font: Font
]

{ #category : 'accessing' }
Card >> code [
	"
	"
	^ self rank asString, self suit asString
]

{ #category : 'printing' }
Card >> printOn: aStr [
	"
	"

	aStr nextPutAll: 'aCard -> '; nextPutAll: self code
]

{ #category : 'accessing' }
Card >> rank [

	"
	Returns 0 if rankValue is not of type Character.
	          or a character but not one of the allowed ranks.	"
	
	^ '123456789TJQKA' at: self rankValue
]

{ #category : 'accessing' }
Card >> rankPBNToRankValue: anObject [

	"
	1 if anObject is not of type Character.
	  or a character but not one of the allowed ranks.
	"	
	rankValue := ('123456789TJQKA' indexOf: anObject)
]

{ #category : 'accessing' }
Card >> rankValue [
	"
	"
		
	^ rankValue 
]

{ #category : 'accessing' }
Card >> rankValue: anObject [

	rankValue := anObject
]

{ #category : 'accessing' }
Card >> suit [
	"
	"
	^ #( 's' 'h' 'd' 'c') at: self suitValue.
]

{ #category : 'accessing' }
Card >> suitValue [
	"
	"
	^ suitValue.
]

{ #category : 'accessing' }
Card >> suitValue: anObject [

	suitValue := anObject
]
