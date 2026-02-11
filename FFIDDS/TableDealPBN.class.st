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
		'parResults',
		'tableResults'
	],
	#classVars : [
		'OFFSET_TABLEDEALPBN'
	],
	#category : 'FFIDDS-DDS',
	#package : 'FFIDDS',
	#tag : 'DDS'
}

{ #category : 'field definition' }
TableDealPBN class >> fieldsDesc [ 

	" self rebuildFieldAccessors."

	^ #( Char80 tableDealPBN)
]

{ #category : 'accessing' }
TableDealPBN class >> loadATableDeal: aDealPBN [
	" Je charge ma donne et je calcule le par (variables parResult et tabResul)
aDealPBN de ce type 'N:QJ6.K652.J85.T98 873.J97.AT764.Q4 5.T83.KQ92.A7652 AKT942.AQ4.3.KJ3'
	"

	| aTableDealPBN |
	aTableDealPBN := self new.

	aTableDealPBN tableResults: TableResults new.
	aTableDealPBN parResults: ParResults new.
	aTableDealPBN futureTricks: FutureTricks new.
	aTableDealPBN vul: 0.
	^ aTableDealPBN tableDealPBN:
		  (Char80 new
			   replaceFrom: 1
			   to: (aDealPBN size min: 80)
			   with: aDealPBN)
]

{ #category : 'converting' }
TableDealPBN >> asByteString [ 
	^ (handle inject: (WriteStream with: String new) into: [ :s :c | s nextPut: c asCharacter ; yourself ]) contents trimRight: [ :char | char = Character null ]
]

{ #category : 'converting' }
TableDealPBN >> asStringWithDeal [

	| str north east south west lstIdx suit parAr nSpaces mains|
	parAr := self tableResults asString splitOn: Character cr.
	nSpaces := 21.
	suit := #( 's: ' 'h: ' 'd: ' 'c: ' ).
	str := WriteStream with: String new.
	mains := (self cards splitOn: ' ') collect: [ :m | m splitOn: '.' ].
	lstIdx := #( '1234' '4123' '3412' '2341' ) at: ('NESW' indexOf: self dealer).
	north := mains at: lstIdx first asciiValue - 48.
	east := mains at: (lstIdx at: 2) asciiValue - 48.
	south := mains at: (lstIdx at: 3) asciiValue -48.
	west := mains at: (lstIdx at: 4) asciiValue -48.
	1 to: 12 do: [ :l |
			l < 5
				ifTrue: [
						str
							nextPutAll: ((parAr at: l) padRightTo: 30);
							nextPutAll: (suit at: l);
							nextPutAll: (north at: l);
							cr ]
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

	^ str contents , self parResults asString
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
TableDealPBN >> cards [
	^(self asByteString copyFrom:3 to: self asByteString size) trimRight .
]

{ #category : 'private' }
TableDealPBN >> createHands [
	"
	"
	| mains lstIdx |
	mains := (self cards splitOn: ' ') collect: [ :m | m splitOn: '.' ].
	lstIdx := #(#(1 2 3 4) #(4 1 2 3) #(3 4 1 2) #(2 3 4 1)) at: ('NESW' indexOf: self dealer).
	North uniqueInstance hand: (mains at: (lstIdx at: 1)).
	East uniqueInstance hand: (mains at: (lstIdx at: 2)) . 
	South uniqueInstance hand: (mains at: (lstIdx at: 3)) . 
	West uniqueInstance hand: (mains at: (lstIdx at: 4)) . 
	^ self
	
]

{ #category : 'accessing' }
TableDealPBN >> dealer [
	^self asByteString first.
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
TableDealPBN >> loadATableDeal: aDealPBN [ 
	^ self class loadATableDeal: aDealPBN 
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
TableDealPBN >> tableResults: aTableR [
	"
	"
	aTableR owner: self.
	tableResults := aTableR
]

{ #category : 'accessing' }
TableDealPBN >> vul [

	^ vul
]

{ #category : 'accessing' }
TableDealPBN >> vul: anObject [

	vul := anObject
]
