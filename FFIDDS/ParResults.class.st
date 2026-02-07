"
struct parResults
""{""
  /* index = 0 is NS view and index = 1
     is EW view. By 'view' is here meant
     which side that starts the bidding. */
  char parScore[2][16];
  char parContractsString[2][128];
""}"";

"
Class {
	#name : 'ParResults',
	#superclass : 'DDSStructure',
	#classVars : [
		'OFFSET_PARCONTRACTSTRING',
		'OFFSET_PARSCORE'
	],
	#category : 'FFIDDS',
	#package : 'FFIDDS'
}

{ #category : 'field definition' }
ParResults class >> fieldsDesc [ 
"
/ index = 0 is NS view and index = 1
is EW view. By 'view' is here meant
which side that starts the bidding. /
char parScore[2][16];
char parContractsString[2][128];
"
	" self rebuildFieldAccessors."

	^ #( Char32 parScore #';' Char256 parContractString).



]

{ #category : 'converting' }
ParResults >> asString [
	" 
 	parResults	char parScore[2][16];First index is NS/EW.  Side encoding.
							char parContractsString[2][128];	First index is NS/EW.  Side encoding.
	"

	| score contract |
	score := self parScore asArray groupsOf: 16. " aByteArray size: 32 "
	contract := self parContractString asArray groupsOf: 128. "aByteArray size: 256 "
	String streamContents: [ :aStream |
			aStream
				nextPutAll: 'Scores    : ';
				nextPutAll:
					(('' join: (score first select: [ :e | e ~= Character null ]))
						 padRightTo: 40);
				nextPutAll:
					('' join: (score last select: [ :e | e ~= Character null ]));
				cr;
				nextPutAll: 'Contracts : ';
				nextPutAll:
					(('' join: (contract first select: [ :e | e ~= Character null ]))
						 padRightTo: 40);
				nextPutAll:
					('' join: (contract last select: [ :e | e ~= Character null ]));
				cr.
			^ aStream contents ]
]

{ #category : 'accessing - structure variables' }
ParResults >> parContractString [
	"This method was automatically generated"
	^(FFIArray ofType: #FFICharacterType size: 256) fromHandle: (handle copyFrom: OFFSET_PARCONTRACTSTRING to: OFFSET_PARCONTRACTSTRING + 255)
]

{ #category : 'accessing - structure variables' }
ParResults >> parContractString: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_PARCONTRACTSTRING to: OFFSET_PARCONTRACTSTRING + 255 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
ParResults >> parScore [
	"This method was automatically generated"
	^(FFIArray ofType: #FFICharacterType size: 32) fromHandle: (handle copyFrom: OFFSET_PARSCORE to: OFFSET_PARSCORE + 31)
]

{ #category : 'accessing - structure variables' }
ParResults >> parScore: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_PARSCORE to: OFFSET_PARSCORE + 31 with: anObject getHandle startingAt: 1
]
