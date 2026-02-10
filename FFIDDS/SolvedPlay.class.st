"
""{""
  int number;
  int tricks[53]; 
""}""
"
Class {
	#name : 'SolvedPlay',
	#superclass : 'DDSStructure',
	#classVars : [
		'OFFSET_NUMBER',
		'OFFSET_TRICKS'
	],
	#category : 'FFIDDS-DDS',
	#package : 'FFIDDS',
	#tag : 'DDS'
}

{ #category : 'field definition' }
SolvedPlay class >> fieldsDesc [ 
	"
	int number;
	int tricks[53];
	"
	" self rebuildFieldAccessors."

	^ #( int number #';' Int_53 tricks)
]

{ #category : 'accessing - structure variables' }
SolvedPlay >> number [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUMBER
]

{ #category : 'accessing - structure variables' }
SolvedPlay >> number: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUMBER put: anObject
]

{ #category : 'accessing - structure variables' }
SolvedPlay >> tricks [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt32 size: 53) fromHandle: (handle copyFrom: OFFSET_TRICKS to: OFFSET_TRICKS + 211)
]

{ #category : 'accessing - structure variables' }
SolvedPlay >> tricks: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_TRICKS to: OFFSET_TRICKS + 211 with: anObject getHandle startingAt: 1
]
