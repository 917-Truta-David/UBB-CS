#pragma once
#include "tutorial.h"
#include "dynamicVector.h"

class TutorialDatabase {

	private:
		DynamicVector<Tutorial> data;


	public:

		/*
		* Save a tutorial to the database.
		* Input: an instance of Tutorial.
		* Output:-
		* Throws exception if Tutorial already exists.
		*/
		void addTutorial(Tutorial);

		/*
		* Remove a tutorial from the database.
		* Input: Link of a tutorial.
		* Output:-
		* Throws exception if Tutorial doesn't exists.
		*/
		void removeTutorial(std::string);

		/*
		* Updates a tutorial to the database.
		* Input: a new instance of Tutorial.
		* Output:-
		* Throws exception if Tutorial doesn't exists.
		*/
		void updateTutorial(Tutorial);

		/*
		* Returns nr of tutorials in database.
		* Input: -
		* Output: returns nr of tutorials in database.
		*/
		int getNrOfTutorials();

		/*
		* Puts in the given dynamic vector a copy of tutorials in watchlist.
		* Input: -
		* Output: Modifies dv
		*/
		void getTutorials(DynamicVector<Tutorial>*);

		/*
		* Increments the likes of tutorial by 1.
		* Input: An instance of Tutorial(Tutorial)
		* Output: Modifies the tutorial in watchlist
		* Throws exception if Tutorial doesn't exists.
		*/
		void likeTutorial(Tutorial t);

};