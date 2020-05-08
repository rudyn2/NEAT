Class {
	#name : #MarioNeatTrainer,
	#superclass : #Object,
	#instVars : [
		'neat',
		'numberOfGenerations'
	],
	#category : #MarioNeat
}

{ #category : #running }
MarioNeatTrainer >> beat: anIndividual game: aMaGame [
	"This executes the evaluation of the game and updates the status 1 time."
	| input |
	
	input := aMaGame getVisibleEntitiesAsFixedArray. 
	aMaGame playBinaryInput: (anIndividual evaluate: input).
]

{ #category : #script }
MarioNeatTrainer >> gameBeatExample [	
	<script: 'self new gameBeatExample'>
	"open transcript to see logs"
	| game |
	game := MaGame new.
	game player position x traceCr.
	game setBinaryInput: #(0 1 0 0 0).
	10 timesRepeat: [  
		game update.
	 	].
	10 timesRepeat: [ 
		game player position x traceCr.
	 	]
]

{ #category : #initialization }
MarioNeatTrainer >> initialize [ 
	neat := NEAT new.
	neat for: NEConnectionWeightMutationOperation prob: 0.2.
	neat for: NEAddConnectionMutationOperation prob: 0.5.
	neat for: NEAddNodeMutationOperation prob: 0.5.
	neat for: NECrossoverOperation prob: 0.5.
	neat numberOfGenerations: 15.
	
]

{ #category : #accessing }
MarioNeatTrainer >> numberOfGenerations: anInteger [
	neat numberOfGenerations: anInteger.
]

{ #category : #running }
MarioNeatTrainer >> playMario: aNEIndividual [

	| game |
	game := MaGame new.
	game canvas open setLabel: 'Mario'.
	game canvas newAnimation 
		loops: 500;
		duration: 24 milliSeconds;
		onStepDo: [ :t | ];
		when: RSAnimationLoopEvent do: [ :evt | 	
			game setBinaryInput: (aNEIndividual evaluate: (game getVisibleEntitiesAsFixedArray)).
			"game update. "
			evt animation currentLoop traceCr.
			]
]

{ #category : #script }
MarioNeatTrainer >> trainMarios: nBeats [
	<script: '(self new trainMarios: 200) inspect'>
	| game |

	neat numberOfInputs: (MaGame new getVisibleEntitiesAsFixedArray size).
	neat numberOfOutputs: 5.
	neat populationSize: 50.
	neat numberOfGenerations: 10.

	neat fitness: [ :ind |
		game := MaGame new.
		nBeats timesRepeat: [ self beat: ind game: game].
		game player position x.
	 	].

	neat run.
	^ neat.
]

{ #category : #'as yet unclassified' }
MarioNeatTrainer >> winner [
	^ neat result 
]
