Class {
	#name : #NETraceItemTest,
	#superclass : #TestCase,
	#category : #'NEAT-Tests'
}

{ #category : #tests }
NETraceItemTest >> test3TraceItems [
	"Checks that 3 different operations are traced properly"
	
	| neat ind newTrace|
	neat := NEAT new.
	ind := NETraceableIndividual new.
	ind random: Random new.
	ind addInputNode; addInputNode; addInputNode.
	ind addOutputNode.

	neat fitness: [ :individual | 1].
	neat for: NEConnectionWeightMutationOperation prob: 1.0 .
	neat for: NEAddConnectionMutationOperation prob: 0.0 .
	neat for: NEAddNodeMutationOperation prob: 0.0 .
	
	newTrace := NETraceItem new.
	neat doMutate: ind trace: newTrace.
	ind computeFitness: (neat fitness) trace: newTrace.
	ind trace: newTrace.
	
	neat fitness: [ :individual | 2].
	neat for: NEConnectionWeightMutationOperation prob: 0.0 .
	neat for: NEAddConnectionMutationOperation prob: 1.0 .
	neat for: NEAddNodeMutationOperation prob: 0.0 .
	
	newTrace := NETraceItem new.
	neat doMutate: ind trace: newTrace.
	ind computeFitness: (neat fitness) trace: newTrace.
	ind trace: newTrace.
	
	neat fitness: [ :individual | 3].
	neat for: NEConnectionWeightMutationOperation prob: 0.0 .
	neat for: NEAddConnectionMutationOperation prob: 0.0 .
	neat for: NEAddNodeMutationOperation prob: 1.0 .
	
	newTrace := NETraceItem new.
	neat doMutate: ind trace: newTrace.
	ind computeFitness: (neat fitness) trace: newTrace.
	ind trace: newTrace.
	
	
	self assert: ind trace size equals: 3.
	1 to: 3 do: [ :i | self assert: (ind trace at: i) fitness equals: i].
	
	self assert: (ind trace at: 1) operation equals: #NEConnectionWeightMutationOperation.
	self assert: (ind trace at: 2) operation equals: #NEAddConnectionMutationOperation.
	self assert: (ind trace at: 3) operation equals: #NEAddNodeMutationOperation.
	
	
	
]

{ #category : #tests }
NETraceItemTest >> testBasicTracing [
	| neat ind newTrace|
	neat := NEAT new.
	neat fitness: [ :individual | 1].
	ind := NETraceableIndividual new.
	ind random: (Random seed: 42).

	"sets the probability of change weight operation to 1."
	neat for: NEConnectionWeightMutationOperation prob: 1.0 .
	neat for: NEAddConnectionMutationOperation prob: 0.0 .
	neat for: NEAddNodeMutationOperation prob: 0.0 .
	1 to: 2 do: [ :i | 
		newTrace := NETraceItem new.
		neat doMutate: ind trace: newTrace.
		ind computeFitness: (neat fitness) trace: newTrace.
		ind trace: newTrace.
		].
	self assert: ind trace size equals: 2.
	self assert: ((ind trace at: 1) operation) equals: #NEConnectionWeightMutationOperation .
	self assert: ((ind trace at: 2) operation) equals: #NEConnectionWeightMutationOperation .
	self assert: ((ind trace at: 1) fitness) equals: 1.
	self assert: ((ind trace at: 1) fitness) equals: 1.

	
]
