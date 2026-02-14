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
		'GifPath'
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
	GifPath := '/home/dsp/Pharo/images/Pharo 13.0 - FFIDDS/pharo-local/iceberg/dstp/FFIDDS/ressources/cards' asFileReference.
	GifDict := Dictionary new.
	gifFiles := GifPath files select: [ :f | f extension = 'gif' ].
	gifFiles do: [ :f |
	GifDict at: f base put: (GIFReadWriter formFromFileNamed: f) ] .
]
