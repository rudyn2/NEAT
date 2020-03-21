Class {
	#name : #NEOpTraceableIndividual,
	#superclass : #NEIndividual,
	#instVars : [
		'operationsTrace'
	],
	#category : #NEAT
}

{ #category : #'as yet unclassified' }
NEOpTraceableIndividual >> computeFitness: oneArgBlock [
	super computeFitness: oneArgBlock.
	operationsTrace last at: #fitness ifAbsentPut: fitness. 
		
]

{ #category : #copying }
NEOpTraceableIndividual >> copy [
	| result |
	result := super copy.
	result setTrace: operationsTrace copy.
	^ result
]

{ #category : #initialization }
NEOpTraceableIndividual >> initialize [
	super initialize.
	self setTrace: OrderedCollection new
]

{ #category : #initialization }
NEOpTraceableIndividual >> setTrace: aTrace [
	operationsTrace := aTrace
]

{ #category : #'as yet unclassified' }
NEOpTraceableIndividual >> trace [ 
	^ operationsTrace
]

{ #category : #initialization }
NEOpTraceableIndividual >> trace: aDictionary [ 
	operationsTrace add: aDictionary.
]
