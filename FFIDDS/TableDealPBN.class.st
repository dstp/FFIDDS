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
		'vul'
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

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
TableDealPBN >> loadATableDealPBN: aDealPBN [
	" Je charge ma donne et je calcule le par (variables parResult et tabResul)
		aDealPBN de ce type 'N:QJ6.K652.J85.T98 873.J97.AT764.Q4 5.T83.KQ92.A7652 AKT942.AQ4.3.KJ3'
		aDeal asPBN => FFIArray ofType: #FFICharacterType size: 80"

	self tableDealPBN:  aDealPBN asPBN.

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
