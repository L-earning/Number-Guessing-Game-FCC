#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo -e "Enter your username:"

read USERNAME

USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME';")

USER_GAME_INFO=$($PSQL "SELECT * FROM users INNER JOIN games USING(user_id) WHERE username='$USERNAME';")

#if username has not been used before
if [[ -z $USER ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  #BEST_GUESS=1
  #GAMES=1

  #add user in database
  USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")

# if username has been used before
else
  echo "$USER_GAME_INFO" | while IFS="|        " read USER_ID USERNAME GAME_ID GUESSES
  do
    GAMES_PLAYED=$($PSQL "SELECT COUNT($GAME_ID) FROM games WHERE user_id='$USER_ID';")
    BEST_GAME_GUESS=$($PSQL "SELECT MIN($GUESSES) FROM games WHERE user_id='$USER_ID';")

    echo -e "\nWelcome back, $USERNAME! You have played $(echo $GAMES_PLAYED | sed 's/^     //') games, and your best game took $(echo $BEST_GAME_GUESS | sed 's/^     //') guesses."
  done
fi

NUMBER_GUESSING_GAME(){
  #generate random number between 1-1000
  NUMBER=$(( RANDOM % 1000 + 1))

  echo -e "\nGuess the secret number between 1 and 1000:"

  NUMBER_OF_GUESSES=1

 # -- the following code used help from Youtuber Maria Camila Barona Martinez
  while read GUESS
  do 
    #if guess is not a number
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
    else
      if [[ $GUESS -eq $NUMBER ]]
      then
      break;
      else
        if [[ $GUESS -gt $NUMBER ]]
        then
          echo -e "\nIt's lower than that, guess again:"
        elif [[ $GUESS -lt $NUMBER ]]
        then
          echo -e "\nIt's higher than that, guess again:"
        fi
      fi
    fi
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))


  done

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
  INSERT_GUESSES=$($PSQL "INSERT INTO games(guesses,user_id) VALUES($NUMBER_OF_GUESSES,$USER_ID);")

  echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"

}

NUMBER_GUESSING_GAME
