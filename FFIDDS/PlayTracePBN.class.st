"
struct playTracePBN
""{"" 
  int number				Number of cards in the play trace, starting from the first card in the trace (so excluding any cards in deal in currentTrickSuit and currentTrickRank)
  char cards[106]			String of cards with no space in between, also not between tricks. Each card consists of a suit (C/D/H/S) and then a rank (2 .. A). The string must be null-terminated.
""}""
"
Class {
	#name : 'PlayTracePBN',
	#superclass : 'DDSStructure',
	#classVars : [
		'OFFSET_CARDS',
		'OFFSET_NUMBER'
	],
	#category : 'FFIDDS',
	#package : 'FFIDDS'
}

{ #category : 'field definition' }
PlayTracePBN class >> fieldsDesc [ 
	"
	int number;
	char cards[106];
	"
	" self rebuildFieldAccessors."

	^ #( int number #';' Char106 cards)
]

{ #category : 'accessing - structure variables' }
PlayTracePBN >> cards [
	"This method was automatically generated"
	^(FFIArray ofType: #FFICharacterType size: 106) fromHandle: (handle copyFrom: OFFSET_CARDS to: OFFSET_CARDS + 105)
]

{ #category : 'accessing - structure variables' }
PlayTracePBN >> cards: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_CARDS to: OFFSET_CARDS + 105 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
PlayTracePBN >> number [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUMBER
]

{ #category : 'accessing - structure variables' }
PlayTracePBN >> number: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUMBER put: anObject
]
