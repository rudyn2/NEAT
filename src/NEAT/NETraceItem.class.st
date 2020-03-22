Class {
	#name : #NETraceItem,
	#superclass : #Object,
	#instVars : [
		'fitness',
		'operation'
	],
	#category : #'NEAT-Core'
}

{ #category : #copying }
NETraceItem >> copy [
	| newTrace |
	newTrace := self class new.
	newTrace setFitness: self fitness.
	newTrace setOperation: self operation.
	^ newTrace
]

{ #category : #accessing }
NETraceItem >> fitness [
	^ fitness 
]

{ #category : #accessing }
NETraceItem >> operation [
	^ operation
]

{ #category : #initialization }
NETraceItem >> setFitness: aFitness [
	fitness := aFitness
]

{ #category : #initialization }
NETraceItem >> setOperation: aClassName [
	operation := aClassName
]
