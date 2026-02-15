"
West
"
Class {
	#name : 'West',
	#superclass : 'Hand',
	#category : 'FFIDDS-Base',
	#package : 'FFIDDS',
	#tag : 'Base'
}

{ #category : 'converting' }
West >> changeContents [
	"
	"

	self westMorph contents: self asString
]

{ #category : 'converting' }
West >> position [
	"
	"

	^ 220 @ 135
]
