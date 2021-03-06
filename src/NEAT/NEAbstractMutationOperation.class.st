Class {
	#name : #NEAbstractMutationOperation,
	#superclass : #Object,
	#instVars : [
		'random'
	],
	#category : #'NEAT-Core'
}

{ #category : #accessing }
NEAbstractMutationOperation >> nextInt: anInteger [
	^ random nextInt: anInteger
]

{ #category : #'instance creation' }
NEAbstractMutationOperation >> on: anIndividual [
	self subclassResponsibility 
]

{ #category : #matching }
NEAbstractMutationOperation >> performOn: anIndividual [
	self assert: [ anIndividual random notNil ] description: 'Individual does not have a random number'.
	random := anIndividual random.
	anIndividual resetFitness.
	self on: anIndividual.
]

{ #category : #'instance creation' }
NEAbstractMutationOperation >> performOn: anIndividual trace: aNETrace [
	self assert: [ anIndividual random notNil ] description: 'Individual does not have a random number'.
	random := anIndividual random.
	anIndividual resetFitness.
	self on: anIndividual.
	aNETrace setOperation: self class name.
]

{ #category : #accessing }
NEAbstractMutationOperation >> random [
	^ random
]

{ #category : #accessing }
NEAbstractMutationOperation >> random: anObject [
	random := anObject
]

{ #category : #'instance creation' }
NEAbstractMutationOperation >> randomWeight [
	^ random next * 1000 - 5
]
