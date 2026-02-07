"
Les types
"
Class {
	#name : 'DDSPool',
	#superclass : 'SharedPool',
	#classVars : [
		'Char10',
		'Char1024',
		'Char128'
	],
	#category : 'FFIDDS',
	#package : 'FFIDDS'
}

{ #category : 'class initialization' }
DDSPool class >> initialize [


	Char10 := (FFIArray newArrayTypeOf: #char size: 10).
	Char128 := (FFIArray newArrayTypeOf: #char size: 128).
	Char1024 := (FFIArray newArrayTypeOf: #char size: 1024).


]

{ #category : 'initialization' }
DDSPool >> initialize [
	^ self class initialize
]
