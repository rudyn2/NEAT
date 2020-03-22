Class {
	#name : #NETraceableIndividual,
	#superclass : #NEIndividual,
	#instVars : [
		'trace'
	],
	#category : #'NEAT-Core'
}

{ #category : #computing }
NETraceableIndividual >> computeFitness: oneArgBlock [
	super computeFitness: oneArgBlock.
	self trace setFitness: fitness.
]

{ #category : #computing }
NETraceableIndividual >> computeFitness: oneArgBlock trace: aTrace [
	super computeFitness: oneArgBlock.
	aTrace setFitness: fitness.
]

{ #category : #copying }
NETraceableIndividual >> copy [
	| result |
	result := super copy.
	result trace: trace copy.
	^ result
]

{ #category : #initialization }
NETraceableIndividual >> initialize [
	super initialize.
	trace := NETrace new.
]

{ #category : #copying }
NETraceableIndividual >> setTrace: aOperation fitness: aFitness [
	self trace setOperation: aOperation.
	self trace setFitness: aFitness.
]

{ #category : #accessing }
NETraceableIndividual >> trace [
	^ trace
]

{ #category : #tracing }
NETraceableIndividual >> trace: aTrace [
	trace := aTrace.
]
