"
struct futureTricks
""{"" 
  int nodes;
  int cards;
  int suit[13];
  int rank[13];
  int equals[13];
  int score[13];
""}""
"
Class {
	#name : 'FutureTricks',
	#superclass : 'DDSStructure',
	#classVars : [
		'OFFSET_CARDS',
		'OFFSET_EQUALS',
		'OFFSET_NODES',
		'OFFSET_RANK',
		'OFFSET_SCORE',
		'OFFSET_SUIT'
	],
	#category : 'FFIDDS-DDS',
	#package : 'FFIDDS',
	#tag : 'DDS'
}

{ #category : 'field definition' }
FutureTricks class >> fieldsDesc [ 
	" 
 	int nodes;
  	int cards;
 	int suit[13];
  	int rank[13];
  	int equals[13];
  	int score[13];
"
	" self rebuildFieldAccessors."
	^ #( int nodes #';' int cards #';' Int_13 suit #';' Int_13 rank #';' Int_13 equals #';' Int_13 score)
]

{ #category : 'accessing - structure variables' }
FutureTricks >> cards [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CARDS
]

{ #category : 'accessing - structure variables' }
FutureTricks >> cards: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CARDS put: anObject
]

{ #category : 'accessing - structure variables' }
FutureTricks >> equals [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt32 size: 13) fromHandle: (handle copyFrom: OFFSET_EQUALS to: OFFSET_EQUALS + 51)
]

{ #category : 'accessing - structure variables' }
FutureTricks >> equals: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_EQUALS to: OFFSET_EQUALS + 51 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
FutureTricks >> nodes [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NODES
]

{ #category : 'accessing - structure variables' }
FutureTricks >> nodes: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NODES put: anObject
]

{ #category : 'accessing - structure variables' }
FutureTricks >> rank [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt32 size: 13) fromHandle: (handle copyFrom: OFFSET_RANK to: OFFSET_RANK + 51)
]

{ #category : 'accessing - structure variables' }
FutureTricks >> rank: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_RANK to: OFFSET_RANK + 51 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
FutureTricks >> score [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt32 size: 13) fromHandle: (handle copyFrom: OFFSET_SCORE to: OFFSET_SCORE + 51)
]

{ #category : 'accessing - structure variables' }
FutureTricks >> score: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_SCORE to: OFFSET_SCORE + 51 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
FutureTricks >> suit [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt32 size: 13) fromHandle: (handle copyFrom: OFFSET_SUIT to: OFFSET_SUIT + 51)
]

{ #category : 'accessing - structure variables' }
FutureTricks >> suit: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_SUIT to: OFFSET_SUIT + 51 with: anObject getHandle startingAt: 1
]
