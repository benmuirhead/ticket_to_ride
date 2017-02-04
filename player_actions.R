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


player = list()
player$current_map = blank_map
player$all_asp = build_all_asp(player$current_map)
plotS(n = player$current_map)

plotS()


p1 = createPlayer(blank_map, "player1")
p2 = createPlayer(blank_map, "player2")




players = createPlayers(4)

summary(players)
summary(players[[2]])

getMap = funtion(players)

summary(players[[1]][[2]])

plotS(players[[1]][[2]])
plotS(players[[2]][[2]])



players = claim_line_players(players, p = 3, "Nashville", "Atlanta")


show_a_shortest_path(p = players[[2]], "Omaha", "Raleigh")

#Another player ads a train between Omaha and Kansas City



show_path_all()

player = delete_line(player, "Omaha", "Chicago")
plotS(player$current_map)

for (i in 1:5) {
  # sampled = sample(V(net)$name, 2)
  net = show_a_shortest_path("Miami",
                             "Omaha",
                             n = player$current_map,
                             asp = player$all_asp)
  Sys.sleep(time = 1)
  # x11()
}

E(player$current_map)$color <- 1
plotS(p1$current_map)



p1 = claim_line()
p1 = claim_line(p1, "Santa Fe", "Denver")

plotS(p1$current_map)



show_a_shortest_path("Atlanta", "Winnipeg", p = p1)



# start =
E(p1$current_map)[E(p1$current_map)$owner == 0][[10]][1][1][[1]][1]
typeof
end = E(p1$current_map)[E(p1$current_map)$owner == 0][10][[2]]
start

start = V(p1$current_map)[[get.edge(p1$current_map, E(p1$current_map)[E(p1$current_map)$owner ==
                                                                        0][[3]])[1]]]$name

end = V(p1$current_map)[[get.edge(p1$current_map, E(p1$current_map)[E(p1$current_map)$owner ==
                                                                      0][[3]])[2]]]$name




p1 = claim_random_line(p1)
show_a_shortest_path("Winnipeg", "Miami", p = p1)




p1 = delete_random_line(p1)
show_a_shortest_path("Winnipeg", "Miami", p = p1)

for (i in 1:5) {
  p1 = claim_random_line(p1)
  show_a_shortest_path("Winnipeg", "Miami", p = p1)
  p1 = delete_random_line(p1)
  show_a_shortest_path("Winnipeg", "Miami", p = p1)
  
}

ends(p1$current_map, E(p1$current_map)[E(p1$current_map)$owner == 0][[3]])[2]

E(p1$current_map)$owner

(p1$all_asp[25])

distances(p1$current_map)
for (i in 1:dim(distances(p1$current_map))[1]) {
  # print(i)
  # if(sum(distances(p1$current_map)[i,]==0)){
  #(distances(p1$current_map)[i,]
  
  print(colnames(distances(p1$current_map))[i])
  print(sum(distances(p1$current_map)[i,]))
  # }
}

p1 = claim_line(p1, "Las Vegas", "Los Angeles")
