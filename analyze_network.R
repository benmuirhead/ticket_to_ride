


# Calculate all shortest paths for each city



all_asp = build_all_asp(net)


g = graph.empty(0, directed = FALSE)
g
plot(g)
add.edge(g, E(net)[1])


  source("show_a_shortest_path.R")
remove(start_city)
remove(end_city)
remove(n)
remove(short_path)
start_city = "Miami"
end_city = "Helena"
n = net
all_asp = all_asp


player$all_asp[1]

duplicate(blank_map)
names(net)

for (i in 1:10) {
  sampled = sample(V(net)$name, 2)
  net = show_a_shortest_path(sampled[1], sampled[2], net = net, all_asp = all_asp)
}
for (i in 1:10) {
  # sampled = sample(V(net)$name, 2)
  net = show_a_shortest_path("Los Angeles",
                       "Montreal",
                       n = net,
                       all_asp = all_asp)
  Sys.sleep(time = 1)
  # x11()
}

# For each city, find the city with the most shortest paths
for (k in V(net)) {
  print(V(net)[k])
  # print(all_asp[[V(net)[k]]]$nrgeo)
  print(V(net)[which.max(all_asp[[V(net)[k]]]$nrgeo)])
  print(all_asp[[V(net)[k]]]$nrgeo[which.max(all_asp[[V(net)[k]]]$nrgeo)])
}


show_a_shortest_path("San Francisco", "Boston", net = net, all_asp = all_asp)

net=blank_map
