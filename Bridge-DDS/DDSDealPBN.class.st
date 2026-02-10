"
Une donne PPBN
"
Class {
	#name : 'DDSDealPBN',
	#superclass : 'FFIExternalStructure',
	#classVars : [
		'Char80',
		'OFFSET_CARDS'
	],
	#category : 'Bridge-DDS',
	#package : 'Bridge-DDS'
}

{ #category : 'field definition' }
DDSDealPBN class >> fieldsDesc [
	" self rebuildFieldAccessors "

	^ #(Char80 cards #';')
]

{ #category : 'class initialization' }
DDSDealPBN class >> initialize [
	Char80 := FFITypeArray ofType: 'char' size: 80.

]

{ #category : 'accessing structure variables' }
DDSDealPBN >> cards [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFICharacterType size: 80) fromHandle: (handle copyFrom: OFFSET_CARDS to: OFFSET_CARDS + 79)
]

{ #category : 'accessing structure variables' }
DDSDealPBN >> cards: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_CARDS to: OFFSET_CARDS + 79 with: anObject getHandle startingAt: 1
]

{ #category : 'field definition' }
DDSDealPBN >> ffiDDSCalc: deal res: tabPar [
	^ self
		ffiCall: #(int CalcDDtablePBN #(DDSDealPBN deal , DDSResults * tabPar))
		module: 'libdds.so'
]

{ #category : 'accessing' }
DDSDealPBN >> loadDealPBN: aDealPBN [

	self cards: (FFITypeArray fromHandle: (aDealPBN padRightTo: 80) asByteArray)
]
