# player
#   route_needed
#   current_trains graph
#   empty_map graph
#   current_map graph - our trains as shortening edge to 0, opponent trains as deleting edges
#
# graphs to maintain:
#   Complete Map, colored to show where trains are
#   current map, which shortens and deletes nodes as needed
#   blank map






tic()
players = createPlayers(2)

for (t in 1:2){
  for(n in 1:length(players)){
    players = claim_random_line_players(players,n)
    ps_sums(players,FALSE)
    show_path_all()
  }
}
toc()




show_a_shortest_path(p = players[[1]], "Omaha", "Raleigh")

#Another player ads a train between Omaha and Kansas City

players = claim_line_players(players,1,"Omaha","Kansas City")

dev.size()

player = delete_line(player, "Omaha", "Chicago")
plotS(player$current_map)










