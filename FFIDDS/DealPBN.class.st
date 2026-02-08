"
""{""
  int trump;
  int first;
  int currentTrickSuit[3];
  int currentTrickRank[3];
  unsigned int remainCards[DDS_HANDS][DDS_SUITS];
""}""
"
Class {
	#name : 'DealPBN',
	#superclass : 'DDSStructure',
	#instVars : [
		'futureTricks',
		'target',
		'solutions',
		'mode',
		'thrId',
		'playTracePBN',
		'solvedPlay'
	],
	#classVars : [
		'OFFSET_CURRENTTRICKRANK',
		'OFFSET_CURRENTTRICKSUIT',
		'OFFSET_FIRST',
		'OFFSET_REMAINCARDS',
		'OFFSET_TRUMP'
	],
	#category : 'FFIDDS',
	#package : 'FFIDDS'
}

{ #category : 'field definition' }
DealPBN class >> fieldsDesc [ 
	
	" 
	int trump;
  	int first;
  	int currentTrickSuit[3];
  	int currentTrickRank[3];
  	char remainCards[80];
	"
	" self rebuildFieldAccessors."
	^ #( int trump #';' int first #';' Int_3 currentTrickSuit #';' Int_3 currentTrickRank #';' Char80 remainCards)

]

{ #category : 'ffi' }
DealPBN >> analysePlayPBN [
	" 
EXTERN_C DLLEXPORT int STDCALL AnalysePlayPBN(
  struct dealPBN dlPBN,
  struct playTracePBN playPBN,
  struct solvedPlay * solvedp,
  int thrId);
"
	^ self ffiCall: #(int AnalysePlayPBN( DealPBN self, PlayTracePBN playTracePBN, SolvedPlay * solvedPlay,  int thrId)).
]

{ #category : 'accessing - structure variables' }
DealPBN >> currentTrickRank [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt32 size: 3) fromHandle: (handle copyFrom: OFFSET_CURRENTTRICKRANK to: OFFSET_CURRENTTRICKRANK + 11)
]

{ #category : 'accessing - structure variables' }
DealPBN >> currentTrickRank: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_CURRENTTRICKRANK to: OFFSET_CURRENTTRICKRANK + 11 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
DealPBN >> currentTrickSuit [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt32 size: 3) fromHandle: (handle copyFrom: OFFSET_CURRENTTRICKSUIT to: OFFSET_CURRENTTRICKSUIT + 11)
]

{ #category : 'accessing - structure variables' }
DealPBN >> currentTrickSuit: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_CURRENTTRICKSUIT to: OFFSET_CURRENTTRICKSUIT + 11 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
DealPBN >> first [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FIRST
]

{ #category : 'accessing - structure variables' }
DealPBN >> first: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FIRST put: anObject
]

{ #category : 'accessing' }
DealPBN >> futureTricks [

	^ futureTricks
]

{ #category : 'accessing' }
DealPBN >> futureTricks: anObject [

	futureTricks := anObject
]

{ #category : 'accessing' }
DealPBN >> mode [

	^ mode
]

{ #category : 'accessing' }
DealPBN >> mode: anObject [

	mode := anObject
]

{ #category : 'accessing' }
DealPBN >> playTracePBN [

	^ playTracePBN
]

{ #category : 'accessing' }
DealPBN >> playTracePBN: anObject [

	playTracePBN := anObject
]

{ #category : 'accessing - structure variables' }
DealPBN >> remainCards [
	"This method was automatically generated"
	^(FFIArray ofType: #FFICharacterType size: 80) fromHandle: (handle copyFrom: OFFSET_REMAINCARDS to: OFFSET_REMAINCARDS + 79)
]

{ #category : 'accessing - structure variables' }
DealPBN >> remainCards: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_REMAINCARDS to: OFFSET_REMAINCARDS + 79 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing' }
DealPBN >> solutions [

	^ solutions
]

{ #category : 'accessing' }
DealPBN >> solutions: anObject [

	solutions := anObject
]

{ #category : 'ffi' }
DealPBN >> solveBoardPBN [
	" 
EXTERN_C DLLEXPORT int STDCALL SolveBoardPBN(
  struct dealPBN dlpbn,
  int target,
  int solutions,
  int mode,
  struct futureTricks * futp,
  int thrId);

	"
	futureTricks := FutureTricks new.
	^ self ffiCall: #(int SolveBoardPBN #( DealPBN self, int target, int solutions, int mode, FutureTricks * futureTricks , int thrId )).
]

{ #category : 'accessing' }
DealPBN >> solvedPlay [

	^ solvedPlay
]

{ #category : 'accessing' }
DealPBN >> solvedPlay: anObject [

	solvedPlay := anObject
]

{ #category : 'accessing' }
DealPBN >> target [

	^ target
]

{ #category : 'accessing' }
DealPBN >> target: anObject [

	target := anObject
]

{ #category : 'accessing' }
DealPBN >> thrId [

	^ thrId
]

{ #category : 'accessing' }
DealPBN >> thrId: anObject [

	thrId := anObject
]

{ #category : 'accessing - structure variables' }
DealPBN >> trump [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TRUMP
]

{ #category : 'accessing - structure variables' }
DealPBN >> trump: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TRUMP put: anObject
]
