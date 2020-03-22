Class {
	#name : #NETraceTest,
	#superclass : #TestCase,
	#category : #'NEAT-Tests'
}

{ #category : #tests }
NETraceTest >> testSetFitness [
	| trace |
	trace := NETrace new.
	trace setFitness: 2.0.
	self assert: trace fitness equals: 2.0.
]

{ #category : #tests }
NETraceTest >> testSetOperation [
	| trace opName|
	trace := NETrace new.
	opName := 'SomeOperationName'.
	trace setOperation: opName.
	self assert: trace operation equals: opName.
]
