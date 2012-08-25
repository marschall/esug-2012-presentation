baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
					spec configuration: 'Seaside30' with: [
						spec version: #stable;
						loads: #( 'Seaside-Core');
						repository: 'http://www.squeaksource.com/Seaside30'].
					spec project: 'Seaside Tests' copyFrom: 'Seaside30' with: [ spec loads: #('Seaside-Tests-Core') ].
					spec package: 'Frank-Core' with: [ spec requires: 'Seaside30' ].
					spec package: 'Frank-Tests-Core' with: [ spec requires: #('Frank-Core' 'Seaside Tests')].
					spec package: 'Frank-Examples' with: [ spec requires: 'Frank-Core' ].
					spec
                group: 'default' with: #('Frank-Core');
                group: 'Tests' with: #('Frank-Tests-Core');
                group: 'Examples' with: #('Frank-Examples') ]