"
ffiDDSInfo 
"
Class {
	#name : 'DDSInfoTest',
	#superclass : 'FFIExternalStructure',
	#classVars : [
		'Char10',
		'Char1024',
		'Char128',
		'OFFSET_COMPILER',
		'OFFSET_CONSTRUCTOR',
		'OFFSET_MAJOR',
		'OFFSET_MINOR',
		'OFFSET_NUMBITS',
		'OFFSET_PATCH',
		'OFFSET_SYSTEM',
		'OFFSET_SYSTEMSTRING',
		'OFFSET_THREADSIZES',
		'OFFSET_VERSIONSTRING'
	],
	#category : 'Bridge-DDS',
	#package : 'Bridge-DDS'
}

{ #category : 'class initialization' }
DDSInfoTest class >> fieldsDesc [
	" self rebuildFieldAccessors "

	^ #(int major #';' int minor #';' int patch #';' Char10 versionString #';' int system #';' int numBits #';' int compiler #';' int constructor #';' Char128 threadSizes #';' Char1024 systemString #';')
]

{ #category : 'class initialization' }
DDSInfoTest class >> initialize [
	Char10 := FFITypeArray ofType: 'char' size: 10.
	Char128 := FFITypeArray ofType: 'char' size: 128.
	Char1024 := FFITypeArray ofType: 'char' size: 1024.
	^ self
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> compiler [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_COMPILER
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> compiler: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_COMPILER put: anObject
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> constructor [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CONSTRUCTOR
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> constructor: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CONSTRUCTOR put: anObject
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> major [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MAJOR
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> major: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MAJOR put: anObject
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> minor [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MINOR
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> minor: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MINOR put: anObject
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> numBits [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUMBITS
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> numBits: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUMBITS put: anObject
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> patch [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PATCH
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> patch: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PATCH put: anObject
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> system [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SYSTEM
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> system: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SYSTEM put: anObject
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> systemString [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFICharacterType size: 1024) fromHandle: (handle copyFrom: OFFSET_SYSTEMSTRING to: OFFSET_SYSTEMSTRING + 1023)
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> systemString: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_SYSTEMSTRING to: OFFSET_SYSTEMSTRING + 1023 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> threadSizes [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFICharacterType size: 128) fromHandle: (handle copyFrom: OFFSET_THREADSIZES to: OFFSET_THREADSIZES + 127)
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> threadSizes: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_THREADSIZES to: OFFSET_THREADSIZES + 127 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> versionString [
	"This method was automatically generated"
	^(FFITypeArray ofType: #FFICharacterType size: 10) fromHandle: (handle copyFrom: OFFSET_VERSIONSTRING to: OFFSET_VERSIONSTRING + 9)
]

{ #category : 'accessing structure variables' }
DDSInfoTest >> versionString: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_VERSIONSTRING to: OFFSET_VERSIONSTRING + 9 with: anObject getHandle startingAt: 1
]
