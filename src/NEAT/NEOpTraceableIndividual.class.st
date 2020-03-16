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
	operationsTrace isEmpty 
		ifTrue: [ 
			self trace: (Dictionary newFrom: {#fitness -> fitness. #improvement -> nil})
		] 
		ifFalse: [ 
			|improvement lastFitness|.
			lastFitness := (operationsTrace at: operationsTrace size - 1 ) at: #fitness.
			improvement := fitness - lastFitness.
			operationsTrace last at: #improvement put: improvement.
			operationsTrace last at: #fitness put: fitness. 
		]
		
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

{ #category : #initialization }
NEOpTraceableIndividual >> trace: aDictionary [ 
	operationsTrace add: aDictionary.
]
