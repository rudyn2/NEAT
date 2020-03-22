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
	| newTraceItem |
	super computeFitness: oneArgBlock.
	newTraceItem := NETraceItem new.
	newTraceItem setFitness: fitness .
	self trace: newTraceItem.
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
	result trace: (trace copy).
	^ result
]

{ #category : #initialization }
NETraceableIndividual >> initialize [
	super initialize.
	trace := OrderedCollection new.
]

{ #category : #accessing }
NETraceableIndividual >> trace [
	^ trace
]

{ #category : #tracing }
NETraceableIndividual >> trace: aNETrace [
	trace add: aNETrace.
]
