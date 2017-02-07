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



#Assign players routes (during create player) that they maintain throughout the game





tic()
players = createPlayers(2)

for (t in 1:2) {
  for (n in 1:length(players)) {
    players = claim_random_line_players(players, n)
    print(players[[n]]$routes)
    e = get_edge_on_asp_from_route(players[[n]])
    print(e)
    players = claim_line_players(players, p = n, e[1], e[2])
    # ps_sums(players, FALSE)
    # show_path_all()
  }
}
toc()

n = players[[1]]$current_map
asp = players[[1]]$all_asp
start_city = "Portland"
end_city = "Washington"
a = start_city
b = end_city
a_index = as.numeric(V(n)[[a]])
b_index = as.numeric(V(n)[[b]])
b_start_in_a_asp = sum(asp[[a]]$nrgeo[1:(b_index - 1)]) + 1
asp_count = asp[[a]]$nrgeo[b_index]
all_asp_a_to_b = asp[[a]]$res[b_start_in_a_asp:(b_start_in_a_asp +
                                                  asp_count - 1)]
print(paste("Number of shortest routes:", length(all_asp_a_to_b)))
print(paste("Distance:", distances(n, V(n)[[a]], V(n)[[b]])[1]))
index_to_use = sample(1:length(all_asp_a_to_b), 1)
short_path = all_asp_a_to_b[[index_to_use]]


all_asp_a_to_b[1][[1]][1]
all_asp_a_to_b[[1]][[1]]
E(n, all_asp_a_to_b[[1]][1], all_asp_a_to_b[[1]][2])


x = ends(n, all_asp_a_to_b[[1]])
y = ends(n, all_asp_a_to_b[[2]])


x[1,]
x[2,]
z = rbind(x, y)
length(z) / 2

get_edge_on_asp_from_route(players[[1]])


# calculate number of shortest routes to city
asp = c()
for (i in 1:36) {
  print(sum(players[[1]]$all_asp[[i]]$nrgeo))
  asp[i] = sum(players[[1]]$all_asp[[i]]$nrgeo)
}

players[[1]]$routes


show_full_map()
plotS()
all_paths

show_a_shortest_path(p = players[[1]], "Omaha", "Raleigh")

#Another player ads a train between Omaha and Kansas City

players = claim_line_players(players, 1, "Omaha", "Kansas City")

dev.size()

player = delete_line(player, "Omaha", "Chicago")
plotS(player$current_map)
