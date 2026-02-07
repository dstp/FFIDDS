"
Les types
"
Class {
	#name : 'DDSPool',
	#superclass : 'SharedPool',
	#classVars : [
		'Char10',
		'Char1024',
		'Char128',
		'Char256',
		'Char32',
		'Char80',
		'IntTableResults'
	],
	#pools : [
		'DDSConstantsPool'
	],
	#category : 'FFIDDS',
	#package : 'FFIDDS'
}

{ #category : 'class initialization' }
DDSPool class >> initialize [


	Char10 := (FFIArray newArrayTypeOf: #char size: 10).
	Char32 := (FFIArray newArrayTypeOf: #char size: 2 * 16).
	Char80 := (FFIArray newArrayTypeOf: #char size: 80).
	Char128 := (FFIArray newArrayTypeOf: #char size: 128).
	Char256 := (FFIArray newArrayTypeOf: #char size: 2 * 128).
	Char1024 := (FFIArray newArrayTypeOf: #char size: 1024).
	IntTableResults := FFIArray ofType: 'int' size: DDS_STRAINS * DDS_HANDS.

]

{ #category : 'initialization' }
DDSPool >> initialize [
	^ self class initialize
]
