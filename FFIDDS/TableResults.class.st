"
struct ddTableResults
""{""
  int resTable[DDS_STRAINS][DDS_HANDS];
""}"";

"
Class {
	#name : 'TableResults',
	#superclass : 'DDSStructure',
	#classVars : [
		'OFFSET_TABLERESULTS'
	],
	#category : 'FFIDDS',
	#package : 'FFIDDS'
}

{ #category : 'field definition' }
TableResults class >> fieldsDesc [ 
"/
int resTable[DDSSTRAINS][DDSHANDS];
/"
	" self rebuildFieldAccessors."

	^ #( IntTableResults tableResults).
	

]

{ #category : 'accessing - structure variables' }
TableResults >> tableResults [
	"This method was automatically generated"
	^(FFIArray ofType: #FFIInt32 size: 20) fromHandle: (handle copyFrom: OFFSET_TABLERESULTS to: OFFSET_TABLERESULTS + 79)
]

{ #category : 'accessing - structure variables' }
TableResults >> tableResults: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_TABLERESULTS to: OFFSET_TABLERESULTS + 79 with: anObject getHandle startingAt: 1
]
