
install.packages("ggnet2")
install.packages("igraph")
install.packages("network")
install.packages("sna")
install.packages("ndtv")
library(igraph)
library(network)
library(sna)
library(ndtv)



u_edges = read.csv("unique_edges.csv")
head(u_edges)
cities = read.csv("cities.csv",header = TRUE, nrows=36, stringsAsFactors = FALSE)
head(cities)

net = graph.data.frame(u_edges,cities,directed = F)
net
graph.a

plot(net)

plot(net,vertex.size=10, edge.width = E(net)$weight)

E(net)$weight


l <- layout.fruchterman.reingold(net)
par(mfrow=c(1,2), mar=c(0,0,0,0)) # plot two figures - 1 row, 2 columns
plot(net, layout=layout.fruchterman.reingold)
plot(net, layout=l)

hist(E(net)$weight)

tkid = tkplot(net)
l = tkplot.getcoords(tkid)
plot(net,layout=l)
tkplot(net)
??tkplot


distance_table(net)

mean_distance(net) #no edge weights

distances(graph, v = V(graph), to = V(graph), mode = c("all", "out",
                                                       "in"), weights = NULL, algorithm = c("automatic", "unweighted",
V(net)                                                                                            "dijkstra", "bellman-ford", "johnson"))

distances(net, v = V(net), to = V(net), weights = NULL, algorithm = c("dijkstra"))

distances = distances(net, v = V(net), to = V(net), weights = NULL, algorithm = c("dijkstra"))

heatmap(distances,Rowv = NA, Colv = NA,symm 
        = TRUE, scale="none", margins=c(10,10) )




sp = shortest_paths(net, V(net)[1], to = V(net),
               weights = NULL, output = c("both"),
               predecessors = FALSE, inbound.edges = FALSE)

sp
sp$epath[[2]][2]
i=2
for(i in 1:length(sp$epath[[2]]))
  print(E(net)[[sp$epath[[2]][i]]]$weight)

sp$epath[[2]][2]
E(net)[[sp$epath[[2]][i]]]

asp = all_shortest_paths(net, V(net), to = V(net),
                    weights = NULL)

all_shortest_paths(graph, from, to = V(graph), mode = c("out", "all", "in"),
                   weights = NULL)

sp$vpath[[36]]
sp$epath[[36]]
asp$res[36]
#Get All shortest paths for a given end dest
asp$res[sum(asp$nrgeo[1:35])+1:asp$nrgeo[36]]
