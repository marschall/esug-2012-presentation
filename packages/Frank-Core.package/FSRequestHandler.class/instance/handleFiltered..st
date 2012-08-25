handling
handleFiltered: aRequestContext
	aRequestContext consumer atEnd
		ifTrue: [ self listing: aRequestContext ]
		ifFalse: [ self receive: aRequestContext ]