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

{ #category : 'as yet unclassified' }
TableResults >> asString [
	" 
	ddTableResults	int resTable[5][4];	Encodes the solution of a deal for combinations of denomination and 	      	declarer.
			  First index is denomination. Suit encoding. 0:Spades	1:Hearts 	2:Diamonds 3:Clubs 4:NT
				Second index is declarer.  Hand encoding. 0:North 1:East 2:South 3:West 	
				Each entry is a number of tricks."

	| resTable i suit |
	i := 1.
	suit := #( 'S    ' 'H    ' 'D    ' 'C    ' 'NT   ' ).
	resTable := self tableResults asArray. " aByteArray size: 20 "
	String streamContents: [ :aStream |
			aStream
				nextPutAll: ' ... ';
				nextPutAll: '     N';
				nextPutAll: '     E';
				nextPutAll: '     S';
				nextPutAll: '     W';
				cr.
			resTable groupsOf: 4 atATimeDo: [ :n :e :s :w |
					aStream
						nextPutAll: (suit at: i);
						nextPutAll: (n asString padLeftTo: 5);
						nextPutAll: (e asString padLeftTo: 5);
						nextPutAll: (s asString padLeftTo: 5);
						nextPutAll: (w asString padLeftTo: 5);
						cr.
					i := i + 1 ].
			^ aStream contents ]
]

{ #category : 'converting' }
TableResults >> asStringTest [
	"
	"
	| str |
	str := WriteStream with: String new.
	(#('NESW' 'ESWN' 'SWNE' 'WNES') detect: [ :s | s first = $N ])
		inject: str
		into: [ :stream :c | 
			stream
				tab;
				nextPut: c;
				yourself ].
	str
		tab;
		cr.
	(self tableResults asArray groupsOf: 4 atATimeCollect: [ :l | l ])
		keysAndValuesDo: [ :i :l | 
			str
				nextPutAll: (#('S' 'H' 'D' 'C' 'NT') at: i);
				tab.
			l
				do: [ :c | 
					str
						nextPutAll: c asString;
						tab ].
			str cr ].
	^ str contents
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
