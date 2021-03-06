Class {
	#name : #NEAbstractStructuralMutationOperation,
	#superclass : #NEAbstractMutationOperation,
	#classVars : [
		'InnovationNumber'
	],
	#category : #'NEAT-Core'
}

{ #category : #initialization }
NEAbstractStructuralMutationOperation class >> reset [ 

	InnovationNumber := 1
]

{ #category : #matching }
NEAbstractStructuralMutationOperation >> performOn: anIndividual [
	InnovationNumber isNil ifTrue: [ self class reset ].
	InnovationNumber := InnovationNumber + 1.
	super performOn: anIndividual.
]

{ #category : #'instance creation' }
NEAbstractStructuralMutationOperation >> performOn: anIndividual trace: aNETrace [
	InnovationNumber isNil ifTrue: [ self class reset ].
	InnovationNumber := InnovationNumber + 1.
	super performOn: anIndividual trace: aNETrace.
]
