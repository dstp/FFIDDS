"
Façade sur la librairie DDS
EXTERN_C DLLEXPORT void STDCALL GetDDSInfo(
  struct DDSInfo * info);
Pour l'objet DDSInfo qui hérite de FFIStructure :
getDDSInfo [
	self ffiCall: #(void GetDDSInfo( DDSInfo * self)) ]
+
ffiLibrary [
	^ DDSLib ]
Pour l'objet DDSLib qui hérite de FFILibrary
getDDSInfo [
	ddsInfo := DDSInfo new . ""ddsInfo est une variable d'instance""
	^ self ffiCall: #(void GetDDSInfo( DDSInfo * ddsInfo )) ]
+
unix64LibraryName [
	^ '/usr/local/lib/libdds.so' ]

Ex nihilo :
	info := DDSInfo new.
	arr := Array new: 3.
	arr at: 1 put: 'void' asSymbol.
	arr at: 2 put: 'GetDDSInfo' asSymbol.
	arr3 := Array new: 3.
	arr3 at: 1 put: 'DDSInfo' asSymbol.
	arr3 at: 2 put: '*' asSymbol.
	arr3 at: 3 put: info.
	arr at: 3 put: arr3.
DDSLib uniqueInstance ffiCall: arr.


"
Class {
	#name : 'DDSLib',
	#superclass : 'FFILibrary',
	#instVars : [
		'ddsInfo'
	],
	#pools : [
		'DDSConstantsPool',
		'DDSPool'
	],
	#category : 'FFIDDS',
	#package : 'FFIDDS'
}

{ #category : 'as yet unclassified' }
DDSLib >> accessAuxPools [
	^ RETURN_CARD_COUNT, Char80 
]

{ #category : 'as yet unclassified' }
DDSLib >> getDDSInfo [
	"
	"
	ddsInfo := DDSInfo new .
	^ self ffiCall: #(void GetDDSInfo( DDSInfo * ddsInfo )).
	
]

{ #category : 'accessing - platform' }
DDSLib >> unix64LibraryName [

	^ '/usr/local/lib/libdds.so'
]
