

cities = read.table("cities.csv",sep = ",",header = TRUE,stringsAsFactors = FALSE)
n=0
edges = c()

for(i in 1:length(cities$City)) {
  for (j in 1:cities$edges[i]) {
    print(cities$City[i])
    edges = c(edges, cities$City[i])
    n = n + 1
  }
}
edges
n

write.csv(edges,"edges.csv",quote = FALSE, row.names = FALSE,col.names = "City")


u_edges = read.csv("unique_edges.csv")
