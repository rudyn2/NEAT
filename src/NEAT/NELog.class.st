Class {
	#name : #NELog,
	#superclass : #Object,
	#instVars : [
		'generation',
		'speciation',
		'minFitness',
		'maxFitness',
		'averageFitness',
		'bestIndividual',
		'npWeightOperation',
		'nNeutralWeightOperation',
		'nnWeightOperation'
	],
	#category : #'NEAT-Core'
}

{ #category : #accessing }
NELog >> averageFitness [
	^ averageFitness
]

{ #category : #accessing }
NELog >> averageFitness: anObject [
	averageFitness := anObject
]

{ #category : #accessing }
NELog >> bestIndividual [
	^ bestIndividual
]

{ #category : #accessing }
NELog >> bestIndividual: anObject [
	bestIndividual := anObject
]

{ #category : #accessing }
NELog >> generation [
	^ generation
]

{ #category : #accessing }
NELog >> generation: anObject [
	generation := anObject
]

{ #category : #ui }
NELog >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal2
		title: 'View';
		initializeView: [ 	speciation visualize ]
]

{ #category : #accessing }
NELog >> maxFitness [
	^ maxFitness
]

{ #category : #accessing }
NELog >> maxFitness: anObject [
	maxFitness := anObject
]

{ #category : #accessing }
NELog >> minFitness [
	^ minFitness
]

{ #category : #accessing }
NELog >> minFitness: anObject [
	minFitness := anObject
]

{ #category : #accessing }
NELog >> nNeutralWeightOperation [
	"Number of individuals which its fitness has been worsed over last generation due to a connection weight operation."
	^ nNeutralWeightOperation
]

{ #category : #accessing }
NELog >> nNeutralWeightOperation: anObject [ 
	"Number of individuals which its fitness has been worsed over last generation due to a connection weight operation."
	nNeutralWeightOperation := anObject 
]

{ #category : #'as yet unclassified' }
NELog >> nnWeightOperation [
	"Number of individuals which its fitness has been worsed over last generation due to a connection weight operation (nn: negative number)."
	^ nnWeightOperation
]

{ #category : #accessing }
NELog >> nnWeightOperation: anObject [ 
	"Number of individuals which its fitness has been worsed over last generation due to a connection weight operation (nn: negative number)."
	nnWeightOperation := anObject
]

{ #category : #accessing }
NELog >> npWeightOperation [
	"Number of individuals which its fitness has been worsed over last generation due to a connection weight operation. (np: positive number)"
	^ npWeightOperation
]

{ #category : #accessing }
NELog >> npWeightOperation: anObject [
	"Number of individuals which its fitness has been worsed over last generation due to a connection weight operation. (np: positive number)"
	npWeightOperation := anObject 
]

{ #category : #'as yet unclassified' }
NELog >> numberOfSpecies [
	^ speciation numberOfSpecies
]

{ #category : #printing }
NELog >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	generation ifNotNil: [ str nextPutAll: generation asString ].
	str nextPut: $>.
]

{ #category : #dependencies }
NELog >> release [
	speciation := nil.
	bestIndividual := nil
]

{ #category : #accessing }
NELog >> speciation [
	^ speciation
]

{ #category : #accessing }
NELog >> speciation: anObject [
	speciation := anObject
]
