"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestNEAT,
	#superclass : #PackageManifest,
	#category : #'NEAT-Manifest'
}

{ #category : #'code-critics' }
ManifestNEAT class >> ruleRBToDoRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#NEAT #numberOfPositiveWeightOperations: #false)) #'2020-03-17T12:19:53.41885-03:00') )
]
