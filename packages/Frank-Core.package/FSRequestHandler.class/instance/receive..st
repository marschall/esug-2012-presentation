private
receive: aRequestContext
	| selector |
	selector := aRequestContext consumer next asSymbol.
	(selector isUnary and: [ (self respondsTo: selector) ])
		ifTrue: [
			self handleSelector: selector context: aRequestContext ]
		ifFalse: [
			aRequestContext responseGenerator
				notFound;
				respond ] 