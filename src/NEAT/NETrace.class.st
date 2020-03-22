Class {
	#name : #NETrace,
	#superclass : #Object,
	#instVars : [
		'fitness',
		'operation'
	],
	#category : #'NEAT-Core'
}

{ #category : #copying }
NETrace >> copy [
	| newTrace |
	newTrace := self class new.
	newTrace setFitness: self fitness.
	newTrace setOperation: self operation.
	^ newTrace
]

{ #category : #accessing }
NETrace >> fitness [
	^ fitness 
]

{ #category : #accessing }
NETrace >> operation [
	^ operation
]

{ #category : #initialization }
NETrace >> setFitness: aFitness [
	fitness := aFitness
]

{ #category : #initialization }
NETrace >> setOperation: aClassName [
	operation := aClassName
]
