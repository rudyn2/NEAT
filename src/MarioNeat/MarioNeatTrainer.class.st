Class {
	#name : #MarioNeatTrainer,
	#superclass : #Object,
	#instVars : [
		'neat'
	],
	#category : #MarioNeat
}

{ #category : #running }
MarioNeatTrainer >> beat: anIndividual game: aMaGame [
	"This executes the evaluation of the game and updates the status 1 time."
	| input gameInput |
	
	input := aMaGame getSimpleEntitiesMatrix. 
	gameInput := anIndividual evaluate: input.
	aMaGame setBinaryInput: gameInput.
	aMaGame update.
]

{ #category : #initialization }
MarioNeatTrainer >> initialize [ 
	neat := NEAT new.
	neat for: NEConnectionWeightMutationOperation prob: 0.2.
	neat for: NEAddConnectionMutationOperation prob: 0.2.
	neat for: NEAddNodeMutationOperation prob: 0.01.
	
]

{ #category : #script }
MarioNeatTrainer >> trainMario: nBeats [
	<script: '(self new trainMario: 10) inspect'>
	|inputExample game|

	inputExample := MaGame new getSimpleEntitiesMatrix.
	neat numberOfInputs: (inputExample size).
	neat numberOfOutputs: 5.
	neat populationSize: 10.

	neat fitness: [ :ind |
		game := MaGame new.
		nBeats timesRepeat: [ self beat: ind game: game].
		game player position x.
	 	].

	neat run.
	^ neat.
]
