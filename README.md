# ticket_to_ride
This is an ongoing project to program elements of the board game Ticket to Ride.
Current version: https://github.com/benmuirhead/ticket_to_ride

To run: source main.R

Parts implemented:

- Game Setup: createPlayers() creates an object of players that contains all of the information each player needs
- player_turn() runs through all the players and has them pick a new route, or claim a path on an existing route
- show_path_all() displays the current game status

Still to do: Lots. See the to_do file

Notes: because R does not allow functions to impact global variables, all functions are fed the relevant object, then return and assign that object to itself
