"
Peut être simplifié
"
Class {
	#name : 'DDSConstantsPool',
	#superclass : 'SharedPool',
	#classVars : [
		'DDS_HANDS',
		'DDS_STRAINS',
		'DDS_SUITS',
		'DDS_VERSION',
		'MAXNOOFBOARDS',
		'MAXNOOFTABLES',
		'RETURN_CARD_COUNT',
		'RETURN_CHUNK_SIZE',
		'RETURN_DUPLICATE_CARDS',
		'RETURN_FIRST_WRONG',
		'RETURN_MODE_WRONG_HI',
		'RETURN_MODE_WRONG_LO',
		'RETURN_NO_FAULT',
		'RETURN_NO_SUIT',
		'RETURN_PBN_FAULT',
		'RETURN_PLAYED_CARD',
		'RETURN_PLAY_FAULT',
		'RETURN_SOLNS_WRONG_HI',
		'RETURN_SOLNS_WRONG_LO',
		'RETURN_SUIT_OR_RANK',
		'RETURN_TARGET_TOO_HIGH',
		'RETURN_TARGET_WRONG_HI',
		'RETURN_TARGET_WRONG_LO',
		'RETURN_THREAD_CREATE',
		'RETURN_THREAD_INDEX',
		'RETURN_THREAD_MISSING',
		'RETURN_THREAD_WAIT',
		'RETURN_TOO_MANY_BOARDS',
		'RETURN_TOO_MANY_CARDS',
		'RETURN_TOO_MANY_TABLES',
		'RETURN_TRUMP_WRONG',
		'RETURN_UNKNOWN_FAULT',
		'RETURN_ZERO_CARDS',
		'TEXT_CARD_COUNT',
		'TEXT_CHUNK_SIZE',
		'TEXT_DUPLICATE_CARDS',
		'TEXT_FIRST_WRONG',
		'TEXT_MODE_WRONG_HI',
		'TEXT_MODE_WRONG_LO',
		'TEXT_NO_FAULT',
		'TEXT_NO_SUIT',
		'TEXT_PBN_FAULT',
		'TEXT_PLAYED_CARD',
		'TEXT_PLAY_FAULT',
		'TEXT_SOLNS_WRONG_HI',
		'TEXT_SOLNS_WRONG_LO',
		'TEXT_SUIT_OR_RANK',
		'TEXT_TARGET_TOO_HIGH',
		'TEXT_TARGET_WRONG_HI',
		'TEXT_TARGET_WRONG_LO',
		'TEXT_THREAD_CREATE',
		'TEXT_THREAD_INDEX',
		'TEXT_THREAD_MISSING',
		'TEXT_THREAD_WAIT',
		'TEXT_TOO_MANY_BOARDS',
		'TEXT_TOO_MANY_CARDS',
		'TEXT_TOO_MANY_TABLES',
		'TEXT_TRUMP_WRONG',
		'TEXT_UNKNOWN_FAULT',
		'TEXT_ZERO_CARDS'
	],
	#category : 'FFIDDS-DDS',
	#package : 'FFIDDS',
	#tag : 'DDS'
}

{ #category : 'class initialization' }
DDSConstantsPool class >> initialize [ 
DDS_VERSION := 20900      .
DDS_HANDS := 4      .
DDS_SUITS := 4      .
DDS_STRAINS := 5      .
MAXNOOFBOARDS := 200      .
MAXNOOFTABLES := 40      .
RETURN_NO_FAULT := 1      .
TEXT_NO_FAULT := 'Success'      .
RETURN_UNKNOWN_FAULT := -1      .
TEXT_UNKNOWN_FAULT := 'General error'     .
RETURN_ZERO_CARDS := -2      .
TEXT_ZERO_CARDS := 'Zero cards'     .
RETURN_TARGET_TOO_HIGH := -3      .
TEXT_TARGET_TOO_HIGH := 'Target exceeds number of tricks'  .
RETURN_DUPLICATE_CARDS := -4      .
TEXT_DUPLICATE_CARDS := 'Cards duplicated'     .
RETURN_TARGET_WRONG_LO := -5      .
TEXT_TARGET_WRONG_LO := 'Target is less than -1'  .
RETURN_TARGET_WRONG_HI := -7      .
TEXT_TARGET_WRONG_HI := 'Target is higher than 13'  .
RETURN_SOLNS_WRONG_LO := -8      .
TEXT_SOLNS_WRONG_LO := 'Solutions parameter is less than 1' .
RETURN_SOLNS_WRONG_HI := -9      .
TEXT_SOLNS_WRONG_HI := 'Solutions parameter is higher than 3' .
RETURN_TOO_MANY_CARDS := -10      .
TEXT_TOO_MANY_CARDS := 'Too many cards'    .
RETURN_SUIT_OR_RANK := -12      .
TEXT_SUIT_OR_RANK := 'currentTrickSuit or currentTrickRank has wrong data' .
RETURN_PLAYED_CARD := -13      .
TEXT_PLAYED_CARD := 'Played card also remains in a hand'.
RETURN_CARD_COUNT := -14      .
TEXT_CARD_COUNT := 'Wrong number of remaining cards in a hand'.
RETURN_THREAD_INDEX := -15      .
TEXT_THREAD_INDEX := 'Thread index is not 0 .. maximum'.
RETURN_MODE_WRONG_LO := -16      .
TEXT_MODE_WRONG_LO := 'Mode parameter is less than 0' .
RETURN_MODE_WRONG_HI := -17      .
TEXT_MODE_WRONG_HI := 'Mode parameter is higher than 2' .
RETURN_TRUMP_WRONG := -18      .
TEXT_TRUMP_WRONG := 'Trump is not in 0 .. 4'.
RETURN_FIRST_WRONG := -19      .
TEXT_FIRST_WRONG := 'First is not in 0 .. 2'.
RETURN_PLAY_FAULT := -98      .
TEXT_PLAY_FAULT := 'AnalysePlay input error'    .
RETURN_PBN_FAULT := -99      .
TEXT_PBN_FAULT := 'PBN string error'    .
RETURN_TOO_MANY_BOARDS := -101      .
TEXT_TOO_MANY_BOARDS := 'Too many boards requested'   .
RETURN_THREAD_CREATE := -102      .
TEXT_THREAD_CREATE := 'Could not create threads'   .
RETURN_THREAD_WAIT := -103      .
TEXT_THREAD_WAIT := 'Something failed waiting for thread to end'.
RETURN_THREAD_MISSING := -104      .
TEXT_THREAD_MISSING := 'Multi-threading system not present'   .
RETURN_NO_SUIT := -201      .
TEXT_NO_SUIT := 'Denomination filter vector has no entries' .
RETURN_TOO_MANY_TABLES := -202      .
TEXT_TOO_MANY_TABLES := 'Too many DD tables requested'  .
RETURN_CHUNK_SIZE := -301      .
TEXT_CHUNK_SIZE := 'Chunk size is less than 1' .

]

{ #category : 'initialization' }
DDSConstantsPool >> initialize [
	^ self class initialize
]
