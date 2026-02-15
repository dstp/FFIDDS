"
North
"
Class {
	#name : 'North',
	#superclass : 'Hand',
	#category : 'FFIDDS-Base',
	#package : 'FFIDDS',
	#tag : 'Base'
}

{ #category : 'converting' }
North >> changeContents [
	"
	"

	self northMorph contents: self asString
]

{ #category : 'converting' }
North >> position [
	"
	"

	^ 316 @ 25
]
