"
struct ddTableResults
""{""
  int resTable[DDS_STRAINS][DDS_HANDS];
""}"";

"
Class {
	#name : 'TableResults',
	#superclass : 'DDSStructure',
	#instVars : [
		'owner'
	],
	#classVars : [
		'OFFSET_TABLERESULTS'
	],
	#category : 'FFIDDS-DDS',
	#package : 'FFIDDS',
	#tag : 'DDS'
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
TableResults >> asArray [
	"
	"

	| str ar |
	ar := Array new: 6.
	str := WriteStream with: String new.
	str
		nextPutAll: '   N  E  S  W';
		cr.
	ar at: 1 put: str contents.
	(self tableResults asArray groupsOf: 4 atATimeCollect: [ :l | l ])
		keysAndValuesDo: [ :i :l |
				str := str := WriteStream with: String new.
				str nextPutAll: ((#( 'S' 'H' 'D' 'C' 'NT' ) at: i) padRightTo: 3).
				l do: [ :c | str nextPutAll: (c asString padRightTo: 3) ].
				str cr.
				ar at: i + 1 put: str contents ].
	^ ar
]

{ #category : 'converting' }
TableResults >> asArray1 [
	"
	"

	| str ar |
	ar := Array new: 6.
	str := WriteStream with: String new.
	str
		nextPutAll: '   N  E  S  W';
		cr.
	ar at: 1 put: str contents.
	(self tableResults asArray groupsOf: 4 atATimeCollect: [ :l | l ])
		keysAndValuesDo: [ :i :l |
				str := str := WriteStream with: String new.
				str nextPutAll: ((#( 'S' 'H' 'D' 'C' 'NT' ) at: i) padRightTo: 3).
				l do: [ :c | str nextPutAll: (c asString padRightTo: 3) ].
				str cr.
				ar at: i + 1 put: str contents ].
	^ ar
]

{ #category : 'converting' }
TableResults >> asArray2 [
	"
	"

	^ self tableResults asArray groupsOf: 4 atATimeCollect: [ :l | l ]

]

{ #category : 'converting' }
TableResults >> asString [
	"
	"

	| str |
	str := WriteStream with: String new.
	self printOn: str.
	^ str contents
]

{ #category : 'accessing' }
TableResults >> owner [

	^ owner ifNil: [ owner := nil ]
]

{ #category : 'accessing' }
TableResults >> owner: anObject [

	owner := anObject
]

{ #category : 'printing' }
TableResults >> printOn: aStr [
	"
	"

	aStr nextPutAll: '   N  E  S  W'.
	aStr cr.
	(self tableResults asArray groupsOf: 4 atATimeCollect: [ :scores | scores ])
		"
		score anArray (5 items) #(#(10 3 10 3) #(7 5 7 5) #(7 5 7 5) #(6 7 6 7) #(8 5 8 5))
			[ suit 1,2,3,4,5 pour S,H,D,C,NT ]*[score N,E,S,W]
		"
		keysAndValuesDo: [ :idxSuit :scores |
				aStr nextPutAll: ((#( 'S' 'H' 'D' 'C' 'NT' ) at: idxSuit) padRightTo: 3).
				scores do: [ :score | aStr nextPutAll: (score asString padRightTo: 3) ].
				aStr cr ].

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
