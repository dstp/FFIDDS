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
		'tableResult',
		'parResult',
		'vul',
		'futureTricks'
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
	^ parResult asString , tableResult asString
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

	tableResult := TableResults new.
	parResult :=ParResults new. 
	vul := 0.
	^ self ffiCall: #(int CalcParPBN #( TableDealPBN self, TableResults * tableResult, int vul, ParResults * parResult )).
]

{ #category : 'accessing' }
TableDealPBN >> futureTricks [

	^ futureTricks
]

{ #category : 'accessing' }
TableDealPBN >> futureTricks: anObject [

	futureTricks := anObject
]

{ #category : 'as yet unclassified' }
TableDealPBN >> loadATableDealPBN: aDealPBN [
	" Je charge ma donne et je calcule le par (variables parResult et tabResul)
aDealPBN de ce type 'N:QJ6.K652.J85.T98 873.J97.AT764.Q4 5.T83.KQ92.A7652 AKT942.AQ4.3.KJ3'
	"
		^ self tableDealPBN: (Char80 new
		  replaceFrom: 1
		  to: (aDealPBN size min: 80)
		  with: aDealPBN) .

]

{ #category : 'accessing' }
TableDealPBN >> parResult [

	^ parResult
]

{ #category : 'accessing' }
TableDealPBN >> parResult: anObject [

	parResult := anObject
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
TableDealPBN >> tableResult [

	^ tableResult
]

{ #category : 'accessing' }
TableDealPBN >> tableResult: anObject [

	tableResult := anObject
]

{ #category : 'accessing' }
TableDealPBN >> vul [

	^ vul
]

{ #category : 'accessing' }
TableDealPBN >> vul: anObject [

	vul := anObject
]
