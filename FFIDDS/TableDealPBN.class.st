"
struct ddTableDealPBN
""{""
  char cards[80];
""}"";

"
Class {
	#name : 'TableDealPBN',
	#superclass : 'DDSStructure',
	#instVars : [
		'vul',
		'futureTricks',
		'deal',
		'parResults',
		'tableResults'
	],
	#classVars : [
		'OFFSET_TABLEDEALPBN'
	],
	#category : 'FFIDDS',
	#package : 'FFIDDS'
}

{ #category : 'field definition' }
TableDealPBN class >> fieldsDesc [ 

	" self rebuildFieldAccessors."

	^ #( Char80 tableDealPBN)
]

{ #category : 'converting' }
TableDealPBN >> asString [
	"
	"
	^ parResults asString , tableResults asString
]

{ #category : 'converting' }
TableDealPBN >> asStringWithDeal [
	| str dealer mains north east south west lstIdx suit parAr nSpaces |
	parAr := (tableResults asStringTest: deal) splitOn: Character cr.
	nSpaces := 21.
	suit := #('s: ' 'h: ' 'd: ' 'c: ').
	str := WriteStream with: String new.
	dealer := deal copyFrom: 1 to: 1.
	mains := ((deal copyFrom: 3 to: deal size) splitOn: ' ') collect: [ :m | m splitOn: '.' ].
	lstIdx := #(#(1 2 3 4) #(4 1 2 3) #(3 4 1 2) #(2 3 4 1)) at: (#('N' 'E' 'S' 'W') indexOf: dealer).
	north := mains at: (lstIdx at: 1).
	east := mains at: (lstIdx at: 2).
	south := mains at: (lstIdx at: 3).
	west := mains at: (lstIdx at: 4).
	1 to: 12 do: [ :l | 
		l < 5
			ifTrue: [ 
				str
					nextPutAll: ((parAr at: l) padRightTo: 30);
					nextPutAll: (suit at: l);
					nextPutAll: (north at: l);
					cr	]		
			ifFalse: [
					l < 7
					ifTrue: [ 
						str
							nextPutAll: ((parAr at: l) padRightTo: 20);
							nextPutAll: (suit at: l - 4);
							nextPutAll: ((west at: l - 4) padRightTo: 20);
							nextPutAll: (suit at: l - 4);
							nextPutAll: (east at: l - 4);
							cr ]
					ifFalse: [ 
						l < 9
							ifTrue: [ 
								str
									nextPutAll: ((suit at: l - 4) padLeftTo: 23);
									nextPutAll: ((west at: l - 4) padRightTo: 20);
									nextPutAll: (suit at: l - 4);
									nextPutAll: (east at: l - 4);
									cr ]
							ifFalse: [ 
								str
									nextPutAll: ((suit at: l - 8) padLeftTo: 33);
									nextPutAll: (south at: l - 8);
									cr ] ] ] ].

	^ str contents, self parResults asString 
]

{ #category : 'ffi' }
TableDealPBN >> calcParPBN [
	" 
EXTERN_C DLLEXPORT int STDCALL CalcParPBN(
  struct ddTableDealPBN tableDealPBN,
  struct ddTableResults * tablep,
  int vulnerable,
  struct parResults * presp);
	"

	"self tableResults: TableResults new.
	self parResults: ParResults new. "
	vul := 0.
	^ self ffiCall: #(int CalcParPBN #( TableDealPBN self, TableResults * tableResults, int vul, ParResults * parResults )).
]

{ #category : 'accessing' }
TableDealPBN >> deal [

	^ deal
]

{ #category : 'accessing' }
TableDealPBN >> deal: anObject [

	deal := anObject
]

{ #category : 'accessing' }
TableDealPBN >> futureTricks [

	^ futureTricks
]

{ #category : 'accessing' }
TableDealPBN >> futureTricks: anObject [

	futureTricks := anObject
]

{ #category : 'accessing' }
TableDealPBN >> loadATableDealPBN: aDealPBN [
	" Je charge ma donne et je calcule le par (variables parResult et tabResul)
aDealPBN de ce type 'N:QJ6.K652.J85.T98 873.J97.AT764.Q4 5.T83.KQ92.A7652 AKT942.AQ4.3.KJ3'
	"
		self deal: aDealPBN .
		self tableResults: TableResults new.
		self parResults: ParResults new. 
		self futureTricks: FutureTricks new.
		self vul: 0.
		^ self tableDealPBN: (Char80 new
		  replaceFrom: 1
		  to: (aDealPBN size min: 80)
		  with: aDealPBN) .

]

{ #category : 'accessing' }
TableDealPBN >> parResults [

	^ parResults
]

{ #category : 'accessing' }
TableDealPBN >> parResults: anObject [

	parResults := anObject
]

{ #category : 'accessing - structure variables' }
TableDealPBN >> tableDealPBN [
	"This method was automatically generated"
	^(FFIArray ofType: #FFICharacterType size: 80) fromHandle: (handle copyFrom: OFFSET_TABLEDEALPBN to: OFFSET_TABLEDEALPBN + 79)
]

{ #category : 'accessing - structure variables' }
TableDealPBN >> tableDealPBN: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_TABLEDEALPBN to: OFFSET_TABLEDEALPBN + 79 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing' }
TableDealPBN >> tableResults [

	^ tableResults
]

{ #category : 'accessing' }
TableDealPBN >> tableResults: anObject [

	tableResults := anObject
]

{ #category : 'accessing' }
TableDealPBN >> vul [

	^ vul
]

{ #category : 'accessing' }
TableDealPBN >> vul: anObject [

	vul := anObject
]
