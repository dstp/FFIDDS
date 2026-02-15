"
East
"
Class {
	#name : 'East',
	#superclass : 'Hand',
	#category : 'FFIDDS-Base',
	#package : 'FFIDDS',
	#tag : 'Base'
}

{ #category : 'converting' }
East >> changeContents [
	"
	"

	self eastMorph contents: self asString
]

{ #category : 'converting' }
East >> position [
	"
	"

	^ 450 @ 135
]
