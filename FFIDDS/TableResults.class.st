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

{ #category : 'converting' }
TableResults >> asStringTest: aDeal [
	"
	"
	| str  |
	
	str := WriteStream with: String new.
	(#(' NESW' ' ESWN' ' SWNE' ' WNES') detect: [ :s | (s at: 2)  = aDeal first ])
		inject: str
		into: [ :stream :c | 
			stream
				nextPutAll: (c asString padRightTo: 3);
				yourself ].
	str
		cr.
	(self tableResults asArray groupsOf: 4 atATimeCollect: [ :l | l ])
		keysAndValuesDo: [ :i :l | 
			str
				nextPutAll: ((#('S' 'H' 'D' 'C' 'NT') at: i) padRightTo: 3).
			l
				do: [ :c | 
					str
						nextPutAll: (c asString padRightTo: 3)
 				].
			str cr ].
	^ str contents
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
