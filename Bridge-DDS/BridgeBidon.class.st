"
Test 
asString : Transcript (asString sinon printOn:)
printOn: Inspector
Transcript show: aBB (asString sinon printOn:)
Transcript show: aBB asString
aBB inspect
"
Class {
	#name : 'BridgeBidon',
	#superclass : 'Object',
	#category : 'Bridge-DDS',
	#package : 'Bridge-DDS'
}

{ #category : 'printing' }
BridgeBidon >> asString [
	^ 'Et merde
'
]

{ #category : 'printing' }
BridgeBidon >> asString1 [
	^ 'Et merde
'
]

{ #category : 'printing' }
BridgeBidon >> ffiAbs: anInteger [
	^ self ffiCall: #(int abs #(int anInteger)) module: 'libc.so.6'
]

{ #category : 'printing' }
BridgeBidon >> ffiDDSCalc: deal res: tabPar [
	
	^ self ffiCall: #(int CalcDDtablePBN #(DDSDealPBN deal , DDSResults * tabPar)) module: 'libdds.so'
]

{ #category : 'printing' }
BridgeBidon >> ffiDDSInfo [
	| ddsi |
	ddsi := DDSInfoTest new.
	self ffiCall: #(void GetDDSInfo #(#DDSInfoTest * ddsi)) module: 'libdds.so'.
	^ ddsi versionString.
]

{ #category : 'printing' }
BridgeBidon >> ffiDDSInfo: ddsi [
	self ffiCall: #(void GetDDSInfo #(#DDSInfoTest * ddsi)) module: 'libdds.so'.
	^ ddsi versionString 
]

{ #category : 'printing' }
BridgeBidon >> printOn1: aStr [
	aStr
		nextPutAll: 'Coucou';
		cr
]

{ #category : 'printing' }
BridgeBidon >> printOn: aStr [
super printOn: aStr.
	aStr
		nextPutAll: 'Coucou';
		cr
]
