"Initialize Image Building"
MCCacheRepository instVarNamed: 'default' put: nil.
Deprecation raiseWarning: false.

"Seaside"
Gofer new
	squeaksource: 'Seaside31';
	package: 'Grease-Core';
	package: 'Grease-Pharo-Core';
	package: 'Seaside-Core';
	package: 'Seaside-Pharo-Core';
	package: 'Seaside-Tools-Core';
	load.

"AJP Server"
Gofer new
	squeaksource: 'ajp';
	package: 'YBuffer-Core';
	package: 'YBuffer-Pharo-Core';
	package: 'AJP-Core';
	package: 'AJP-Pharo-Core';
	load.

"Start AJP"
(AJPPharoAdaptor port: 8003)
	codec: GRPharoUtf8Codec new;
	start.

"Frank"
Gofer new
	url: 'http://ss3.gemstone.com/ss/frank';
	package: 'Frank-Core';
	package: 'Frank-Examples';
	load.


"Clear Monticello Caches"
MCCacheRepository instVarNamed: 'default' put: nil.
MCFileBasedRepository flushAllCaches.
MCMethodDefinition shutDown.
MCDefinition clearInstances.

"Cleanup Smalltalk"
Smalltalk flushClassNameCache.
Smalltalk organization removeEmptyCategories.
Smalltalk allClassesAndTraitsDo: [ :each |
	each organization removeEmptyCategories; sortCategories.
	each class organization removeEmptyCategories; sortCategories ].

"Cleanup System Memory"
Author reset.
Smalltalk garbageCollect.
Symbol compactSymbolTable.
Deprecation raiseWarning: true.
