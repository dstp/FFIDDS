"
Par pour une donne
"
Class {
	#name : 'DDSResults',
	#superclass : 'FFIExternalStructure',
	#instVars : [
		'pbn',
		'par'
	],
	#classVars : [
		'Int20',
		'OFFSET_RESULTS'
	],
	#category : 'Bridge-DDS',
	#package : 'Bridge-DDS'
}

{ #category : 'field definition' }
DDSResults class >> fieldsDesc [
	" self rebuildFieldAccessors "

	^ #(Int20 results #';')
]

{ #category : 'class initialization' }
DDSResults class >> initialize [
	Int20 := FFITypeArray ofType: 'int' size: 20
]

{ #category : 'as yet unclassified' }
DDSResults class >> inspectorClass [
	^ EyeDDSResultsInspector
]

{ #category : 'printing' }
DDSResults >> asString [
	| str |
	str := WriteStream with: String new.
	(#('NESW' 'ESWN' 'SWNE' 'WNES') detect: [ :s | s first = self pbn first ])
		inject: str
		into: [ :stream :c | 
			stream
				tab;
				nextPut: c;
				yourself ].
	str tab; cr.
	(self results asArray groupsOf: 4 atATimeCollect: [ :l | l ])
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

{ #category : 'printing' }
DDSResults >> asStringWithDeal [
	| str dealer mains north east south west lstIdx suit parAr |
	parAr := self asString splitOn: Character cr.
	suit := #('s: ' 'h: ' 'd: ' 'c: ').
	str := WriteStream with: String new.
	dealer := pbn copyFrom: 1 to: 1.
	mains := ((pbn copyFrom: 3 to: pbn size) splitOn: ' ') collect: [ :m | m splitOn: '.' ].
	lstIdx := #(#(1 2 3 4) #(4 1 2 3) #(3 4 1 2) #(2 3 4 1)) at: (#('N' 'E' 'S' 'W') indexOf: dealer).
	north := mains at: (lstIdx at: 1).
	east := mains at: (lstIdx at: 2).
	south := mains at: (lstIdx at: 3).
	west := mains at: (lstIdx at: 4).
	1 to: 12 do: [ :l | 
		l < 7
			ifTrue: [ str
					nextPutAll: (parAr at: l);
					tab ]
			ifFalse: [ str
					tab;
					tab;
					tab;
					tab;
					tab;
					tab ].
		l < 5
			ifTrue: [ str
					tab;
					tab;
					tab;
					nextPutAll: (suit at: l);
					nextPutAll: (north at: l);
					cr ]
			ifFalse: [ l > 8
					ifTrue: [ str
							tab;
							tab;
							tab;
							nextPutAll: (suit at: l - 8);
							nextPutAll: (south at: l - 8);
							cr ]
					ifFalse: [ str
							nextPutAll: (suit at: l - 4);
							nextPutAll: ((west at: l - 4) padRightTo: 15).
						"(west at: l - 4) size < 6
							ifTrue: [ str tab ]."
						str
							tab;
							tab;
							tab;
							nextPutAll: (suit at: l - 4);
							nextPutAll: (east at: l - 4);
							cr ] ] ].
	^ str contents
]

{ #category : 'printing' }
DDSResults >> gtInspectorDetailsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: 'Par';
		display: [ {('par' -> (self asStringWithDeal))	"asTextMorph"} ];
		column: 'Key' evaluated: #key;
		column: 'Value' evaluated: #value;
		send: #value
]

{ #category : 'accessing' }
DDSResults >> par [
	^ par
]

{ #category : 'accessing' }
DDSResults >> par: anObject [
	par := anObject
]

{ #category : 'accessing' }
DDSResults >> pbn [
	^ pbn
]

{ #category : 'accessing' }
DDSResults >> pbn: anObject [
	pbn := anObject
]

{ #category : 'printing' }
DDSResults >> printOn: aStream [
	| res |
	res := self results asArray.
	res printOn: aStream
]

{ #category : 'accessing structure variables' }
DDSResults >> results [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFIInt32 size: 20) fromHandle: (handle copyFrom: OFFSET_RESULTS to: OFFSET_RESULTS + 79)
]

{ #category : 'accessing structure variables' }
DDSResults >> results: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_RESULTS to: OFFSET_RESULTS + 79 with: anObject getHandle startingAt: 1
]
