# Frank

## Load Using Gopher

```Smalltalk
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
((Smalltalk globals at: #AJPPharoAdaptor) port: 8003)
	codec: (Smalltalk globals at: #GRPharoUtf8Codec) new;
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
```

## Load From Github


### Load The Latest Metacello
```Smalltalk
"Get the Metacello configuration"
Gofer new
  gemsource: 'metacello';
  package: 'ConfigurationOfMetacello';
  load.

"Bootstrap Metacello 1.0-beta.32, using mcz files"
((Smalltalk at: #ConfigurationOfMetacello) project 
  version: '1.0-beta.32') load.

"Load the Preview version of Metacello from GitHub"
(Smalltalk at: #Metacello) new
  configuration: 'MetacelloPreview';
  version: #stable;
  repository: 'github://dalehenrich/metacello-work:configuration';
  load.
```

### Clone the Git Repository
```
git clone git@github.com:marschall/esug-2012-presentation.git
```

### Load From the Clone repository 

```Smalltalk
Metacello new
	baseline: 'Frank';
	repository: 'filetree:///path/to/checkout/esug-2012-presentation/packages';
	load.

Metacello image
	baseline: 'Frank';
	load: 'Examples'.
```

