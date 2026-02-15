"
I contain the directories and other constants used
GifPath directory where are the images of card
GifDic dictionnary 'As' -> Form 
"
Class {
	#name : 'ConstantPool',
	#superclass : 'SharedPool',
	#classVars : [
		'Font',
		'GifDict',
		'GifPath',
		'TextExtent',
		'WindowExtent'
	],
	#category : 'FFIDDS-Base',
	#package : 'FFIDDS',
	#tag : 'Base'
}

{ #category : 'class initialization' }
ConstantPool class >> initialize [
	"
	"

	| gifFiles |
	GifPath := '/home/dsp/Pharo/images/Pharo 13.0 - FFIDDS/pharo-local/iceberg/dstp/FFIDDS/ressources/cards'
		           asFileReference.
	GifDict := Dictionary new.
	gifFiles := GifPath files select: [ :f | f extension = 'gif' ].
	gifFiles do: [ :f |
		GifDict at: f base put: (GIFReadWriter formFromFileNamed: f) ].
	Font := LogicalFont familyName: 'Source Code Pro' pointSize: 12.
	TextExtent := 580 @ 320.
	WindowExtent := TextExtent + (50 @ 50)
]
