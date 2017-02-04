# load data



u_edges = read.csv("unique_edges.csv")


p_edges = read.csv("unique_edges_parallel.csv")



cities = read.csv(
  "cities.csv",
  header = TRUE,
  nrows = 36,
  stringsAsFactors = FALSE
)



u_edges_s = read.csv("unique_edges_short.csv")

cities_s = read.csv(
  "cities_short.csv",
  header = TRUE,
  nrows = 25,
  stringsAsFactors = FALSE
)

print("Loaded u_edges_s and cities_s")


