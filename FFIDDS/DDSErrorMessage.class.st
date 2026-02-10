"
EXTERN_C DLLEXPORT void STDCALL ErrorMessage(
  int code,
  char line[80]);
"
Class {
	#name : 'DDSErrorMessage',
	#superclass : 'DDSStructure',
	#classVars : [
		'OFFSET_CODE',
		'OFFSET_LINE'
	],
	#category : 'FFIDDS-DDS',
	#package : 'FFIDDS',
	#tag : 'DDS'
}

{ #category : 'field definition' }
DDSErrorMessage class >> fieldsDesc [ 

	" self rebuildFieldAccessors."

	^ #( int code #';' Char80 line).

]

{ #category : 'accessing - structure variables' }
DDSErrorMessage >> code [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CODE
]

{ #category : 'accessing - structure variables' }
DDSErrorMessage >> code: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CODE put: anObject
]

{ #category : 'accessing' }
DDSErrorMessage >> errorMessage [
	"
	"
	self code: RETURN_CARD_COUNT .
	^ self errorMessage: self code.

]

{ #category : 'accessing' }
DDSErrorMessage >> errorMessage: aCode [
	"
	"
	| aLine |
	aLine := Char80 new.
	(self errorMessage: aCode  line: aLine) .
	self line: aLine.

]

{ #category : 'accessing' }
DDSErrorMessage >> errorMessage: aCode line: aLine [
	"
	"
	^ self ffiCall: #(void ErrorMessage #( int aCode, Char80 aLine )).

]

{ #category : 'accessing - structure variables' }
DDSErrorMessage >> line [
	"This method was automatically generated"
	^(FFIArray ofType: #FFICharacterType size: 80) fromHandle: (handle copyFrom: OFFSET_LINE to: OFFSET_LINE + 79)
]

{ #category : 'accessing - structure variables' }
DDSErrorMessage >> line: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_LINE to: OFFSET_LINE + 79 with: anObject getHandle startingAt: 1
]
