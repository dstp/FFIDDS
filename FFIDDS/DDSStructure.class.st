"
Je regroupe les structures utilies pour DDS

"
Class {
	#name : 'DDSStructure',
	#superclass : 'FFIStructure',
	#pools : [
		'DDSPool'
	],
	#category : 'FFIDDS-DDS',
	#package : 'FFIDDS',
	#tag : 'DDS'
}

{ #category : 'accessing' }
DDSStructure >> ffiLibrary [

	^ DDSLib
]
