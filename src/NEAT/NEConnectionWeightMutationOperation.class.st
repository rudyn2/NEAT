Class {
	#name : #NEConnectionWeightMutationOperation,
	#superclass : #NEAbstractNonStructuralMutationOperation,
	#category : #'NEAT-Core'
}

{ #category : #'instance creation' }
NEConnectionWeightMutationOperation >> on: anIndividual [
	| c newWeight newTrace|
	anIndividual connections ifEmpty: [ ^ self ].
	c := (anIndividual connections atRandom: random).
	newWeight := self randomWeight + c weight.
	c weight: newWeight.
	"anIndividual trace: { self class name . c . newWeight }"
	newTrace := Dictionary newFrom: {#className -> self class name. #connection -> c. #newWeight -> newWeight }.
	anIndividual trace: newTrace.
]
