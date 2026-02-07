"
Je regroupe les structures utilies pour DDS

"
Class {
	#name : 'DDSStructure',
	#superclass : 'FFIStructure',
	#pools : [
		'DDSPool'
	],
	#category : 'FFIDDS',
	#package : 'FFIDDS'
}

{ #category : 'accessing' }
DDSStructure >> ffiLibrary [

	^ DDSLib
]
