"
struct DDSInfo

  // Version 2.8.0 has 2, 8, 0 and a string of 2.8.0
  int major, minor, patch;
  char versionString[10];

  // Currently 0 = unknown, 1 = Windows, 2 = Cygwin, 3 = Linux, 4 = Apple
  int system;

  // We know 32 and 64-bit systems.
  int numBits;

  // Currently 0 = unknown, 1 = Microsoft Visual C++, 2 = mingw,
  // 3 = GNU g++, 4 = clang
  int compiler;

  // Currently 0 = none, 1 = DllMain, 2 = Unix-style
  int constructor;

  int numCores;

  // Currently
  // 0 = none,
  // 1 = Windows (native),
  // 2 = OpenMP,
  // 3 = GCD,
  // 4 = Boost,
  // 5 = STL,
  // 6 = TBB,
  // 7 = STLIMPL (for_each), experimental only
  // 8 = PPLIMPL (for_each), experimental only
  int threading;

  // The actual number of threads configured
  int noOfThreads;

  // This will break if there are > 128 threads...
  // The string is of the form LLLSSS meaning 3 large TT memories
  // and 3 small ones.
  char threadSizes[128];

  char systemString[1024];


"
Class {
	#name : 'DDSInfo',
	#superclass : 'DDSStructure',
	#classVars : [
		'OFFSET_COMPILER',
		'OFFSET_CONSTRUCTOR',
		'OFFSET_MAJOR',
		'OFFSET_MINOR',
		'OFFSET_NOOFTHREADS',
		'OFFSET_NUMBITS',
		'OFFSET_NUMCORES',
		'OFFSET_PATCH',
		'OFFSET_SYSTEM',
		'OFFSET_SYSTEMSTRING',
		'OFFSET_THREADING',
		'OFFSET_THREADSIZES',
		'OFFSET_VERSIONSTRING'
	],
	#category : 'FFIDDS-DDS',
	#package : 'FFIDDS',
	#tag : 'DDS'
}

{ #category : 'field definition' }
DDSInfo class >> fieldsDesc [
	"
struct DDSInfo
int major, minor, patch;
char versionString[10];
int system; 0 = unknown, 1 = Windows, 2 = Cygwin, 3 = Linux, 4 = Apple
int numBits; 32 and 64-bit systems
int compiler; 0 = unknown, 1 = Microsoft Visual C++, 2 = mingw, 3 = GNU g++, 4 = clang
int constructor; 0 = none, 1 = DllMain, 2 = Unix-style
int numCores;
int threading;  0 = none, 1 = Windows (native), 2 = OpenMP, 3 = GCD, 4 = Boost, 5 = STL, 6 = TBB, 7 = STLIMPL (foreach), 8 = PPLIMPL
int noOfThreads; The actual number of threads configured
char threadSizes[128]; The string is of the form LLLSSS meaning 3 large TT memories and 3 small ones
char systemString[1024];
"

	" self rebuildFieldAccessors."

	^ #( int major #';' int minor #';' int patch #';' Char10 versionString
	     #';' int system #';' int numBits #';' int compiler #';' int constructor
	     #';' int numCores #';' int threading #';' int noOfThreads
	     #';' Char128 threadSizes #';' Char1024 systemString )
]

{ #category : 'accessing - structure variables' }
DDSInfo >> compiler [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_COMPILER
]

{ #category : 'accessing - structure variables' }
DDSInfo >> compiler: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_COMPILER put: anObject
]

{ #category : 'accessing - structure variables' }
DDSInfo >> constructor [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CONSTRUCTOR
]

{ #category : 'accessing - structure variables' }
DDSInfo >> constructor: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CONSTRUCTOR put: anObject
]

{ #category : 'ffi-calls' }
DDSInfo >> getDDSInfo [
	"
	"
	self ffiCall: #(void GetDDSInfo( DDSInfo * self))
]

{ #category : 'accessing - structure variables' }
DDSInfo >> major [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MAJOR
]

{ #category : 'accessing - structure variables' }
DDSInfo >> major: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MAJOR put: anObject
]

{ #category : 'accessing - structure variables' }
DDSInfo >> minor [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MINOR
]

{ #category : 'accessing - structure variables' }
DDSInfo >> minor: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MINOR put: anObject
]

{ #category : 'accessing - structure variables' }
DDSInfo >> noOfThreads [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NOOFTHREADS
]

{ #category : 'accessing - structure variables' }
DDSInfo >> noOfThreads: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NOOFTHREADS put: anObject
]

{ #category : 'accessing - structure variables' }
DDSInfo >> numBits [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUMBITS
]

{ #category : 'accessing - structure variables' }
DDSInfo >> numBits: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUMBITS put: anObject
]

{ #category : 'accessing - structure variables' }
DDSInfo >> numCores [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUMCORES
]

{ #category : 'accessing - structure variables' }
DDSInfo >> numCores: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUMCORES put: anObject
]

{ #category : 'accessing - structure variables' }
DDSInfo >> patch [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PATCH
]

{ #category : 'accessing - structure variables' }
DDSInfo >> patch: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PATCH put: anObject
]

{ #category : 'accessing - structure variables' }
DDSInfo >> system [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SYSTEM
]

{ #category : 'accessing - structure variables' }
DDSInfo >> system: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SYSTEM put: anObject
]

{ #category : 'accessing - structure variables' }
DDSInfo >> systemString [
	"This method was automatically generated"
	^(FFIArray ofType: #FFICharacterType size: 1024) fromHandle: (handle copyFrom: OFFSET_SYSTEMSTRING to: OFFSET_SYSTEMSTRING + 1023)
]

{ #category : 'accessing - structure variables' }
DDSInfo >> systemString: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_SYSTEMSTRING to: OFFSET_SYSTEMSTRING + 1023 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
DDSInfo >> threadSizes [
	"This method was automatically generated"
	^(FFIArray ofType: #FFICharacterType size: 128) fromHandle: (handle copyFrom: OFFSET_THREADSIZES to: OFFSET_THREADSIZES + 127)
]

{ #category : 'accessing - structure variables' }
DDSInfo >> threadSizes: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_THREADSIZES to: OFFSET_THREADSIZES + 127 with: anObject getHandle startingAt: 1
]

{ #category : 'accessing - structure variables' }
DDSInfo >> threading [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_THREADING
]

{ #category : 'accessing - structure variables' }
DDSInfo >> threading: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_THREADING put: anObject
]

{ #category : 'accessing - structure variables' }
DDSInfo >> versionString [
	"This method was automatically generated"
	^(FFIArray ofType: #FFICharacterType size: 10) fromHandle: (handle copyFrom: OFFSET_VERSIONSTRING to: OFFSET_VERSIONSTRING + 9)
]

{ #category : 'accessing - structure variables' }
DDSInfo >> versionString: anObject [
	"This method was automatically generated"
	handle replaceFrom: OFFSET_VERSIONSTRING to: OFFSET_VERSIONSTRING + 9 with: anObject getHandle startingAt: 1
]
