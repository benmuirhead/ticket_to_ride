
if (short){
net = graph.data.frame(u_edges_s, cities_s, directed = F)
}else{
  net = graph.data.frame(u_edges, cities, directed = F)
}

distances = distances(
  net,
  v = V(net),
  to = V(net),
  weights = NULL,
  algorithm = c("dijkstra")
)


print("built net, distances table")


# Adding Edge Labels
E(net)$label = E(net)$weight

# Setup Layout lat/long
lo = as.matrix(cbind(V(net)$long, V(net)$lat))

print("Set up Edge Labels, Lat/Long as lo")

E(net)$lty=2
print("Set Line type to 2")


#Set Owner of each edge

E(net)$owner=0
print("Set owner to 0")


blank_map = net