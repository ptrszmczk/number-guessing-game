#!/bin/bash

Q="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

while true
do
  echo -e "\nEnter your username:"
  read USERNAME

  if [[ ${#USERNAME} -gt 22 ]]
  then
    echo -e "\nYour name is too long"
  else
    break
  fi
done

USERNAME_RESULT=$($Q "select name from users where name='$USERNAME'")

if [[ -z $USERNAME_RESULT ]]
then
  INSERT_USERNAME=$($Q "insert into users(name) values('$USERNAME')")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  NUMBER_OF_GAMES=$($Q "select count(game_id) from games full join users using(user_id) where name='$USERNAME'")
  BEST_GAME=$($Q "select min(guesses) from games full join users using(user_id) where name='$USERNAME'")
  echo -e "\nWelcome back, $USERNAME! You have played $NUMBER_OF_GAMES games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
CORRECT=$(($RANDOM % 1000 + 1))
COUNT=0

while true
do
  read GUESS
  COUNT=$(expr $COUNT + 1)

  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:"
  elif [[ $GUESS -gt $CORRECT ]]
  then
    echo -e "\nIt's lower than that, guess again:"
  elif [[ $GUESS -lt $CORRECT ]]
  then
    echo -e "\nIt's higher than that, guess again:"
  else
    USER_ID=$($Q "select user_id from users where name='$USERNAME'")
    INSERT_GAME=$($Q "insert into games(user_id, guesses, correct_number) values($USER_ID, $COUNT, $CORRECT)")
    echo -e "You guessed it in $COUNT tries. The secret number was $CORRECT. Nice job!\n"
    echo -e "You guessed it in $COUNT tries. The secret number was $CORRECT. Nice job!"
    break
  fi
done