private
handleSelector: aSymbol context: aRequestContext
	| content |
	content := [ self perform: aSymbol ]
		on: Error
		do: [ :error | 
			^ aRequestContext responseGenerator
					internalError: error;
					respond ].
			
	aRequestContext respond: [ :response | 
		response
			contentType: WAMimeType textHtml;
			nextPutAll: content ]