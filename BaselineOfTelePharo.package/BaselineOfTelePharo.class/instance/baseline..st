baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
 			   package: 'Calypso-NavigationModel-Tests'
  				with: [ spec repository: 'github://oliveiraallex/Calypso:dev13-1' ].
			spec
				package: 'Calypso-SystemTools-Debugger'
				with: [ spec repository: 'github://oliveiraallex/Calypso:dev13-1' ].
			spec
				package: 'Calypso-ProcessQueries'
				with: [ spec repository: 'github://oliveiraallex/Calypso:dev13-1' ].
			spec
   			   package: 'Calypso-ProcessQueries-Tests'
  			   with: [ spec
    	      repository: 'github://oliveiraallex/Calypso:dev13-1';
      		   requires: #('Calypso-NavigationModel-Tests') ].
			spec
				package: 'Calypso-SystemTools-ProcessBrowser'
				with: [ spec repository: 'github://oliveiraallex/Calypso:dev13-1';
        		requires: #('Calypso-Browser') ].
			spec
 			   package: 'Calypso-Browser'
   				 with: [ spec repository: 'github://oliveiraallex/Calypso:dev13-1' ].
			spec
			    package: 'Calypso-SystemQueries'
			    with: [ spec repository: 'github://oliveiraallex/Calypso:dev13-1' ].
			spec
				baseline: 'Seamless'
				with: [ spec repository: 'github://oliveiraallex/seamless:dev13-1' ].
			spec
				project: 'SeamlessForServer'
				copyFrom: 'Seamless'
				with: [ spec loads: 'Core' ].
			spec
				project: 'SeamlessForClient'
				copyFrom: 'Seamless'
				with: [ spec loads: 'default' ].
			spec
				baseline: 'StateSpecs'
				with: [ spec
						repository: 'github://oliveiraallex/StateSpecs:dev13';
						loads: #('StateSpecs-Specs' 'StateSpecs-DSL-ClassWords') ].
			
			spec
				package: 'TelePharo-Core'
				with: [ spec requires: #('StateSpecs') ].
			spec
				package: 'TelePharo-Debugger'
				with: [ spec requires: #('TelePharo-Core') ].
			spec
				package: 'TelePharo-Browser-Server'
				with: [ spec requires: #('TelePharo-Core' 'Calypso-SystemQueries') ].
			spec
				package: 'TelePharo-Browser-Client'
				with: [ spec requires: #('TelePharo-Browser-Server') ].
			spec
				package: 'TelePharo-Playground'
				with: [ spec requires: #('TelePharo-Core') ].
			spec
				group: 'Calypso-ProcessBrowser' 
					with:
					#('Calypso-SystemTools-Debugger' 'Calypso-ProcessQueries' 'Calypso-ProcessQueries-Tests' 'Calypso-SystemTools-ProcessBrowser');
				group: 'MinimalServer'
					with:
					#('SeamlessForServer' 'TelePharo-Core' 'TelePharo-Browser-Server' 'TelePharo-Debugger' 'Calypso-ProcessBrowser');
				group: 'Server' with: #('MinimalServer');
				group: 'Client'
					with:
					#('SeamlessForClient' 'TelePharo-Core' 'TelePharo-Browser-Client' 'TelePharo-Debugger' 'TelePharo-Playground' 'Calypso-ProcessBrowser') ]
