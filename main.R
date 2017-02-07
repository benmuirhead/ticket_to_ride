#main
setwd("~/GitHub/ticket_to_ride")
source("setup.R")

source("load_data.R")
short = TRUE
source("build_network.R")

source("build_all_asp.R")

source("show_a_shortest_path.R")

source("plotS.R")

source("claim_delete_lines.R")

source("create_players.R")

source("player_summary.R")

source("route.R")

source("get_edge_on_asp_from_route.R")


loops = 1
time = 0
turns = 3
for (i in 1:loops) {
  s = Sys.time()
  players = createPlayers(2)
  for (j in 1:turns) {
    for (n in 1:length(players)) {
      # players = claim_random_line_players(players, n)
      print(players[[n]]$name)
      print(paste("route", players[[n]][["routes"]][[1]],"-",players[[n]][["routes"]][[2]]))
      
      # Get an edge to claim
      ed = get_edge_on_asp_from_route(players[[n]])
      print(paste("edge:", ed[1],ed[2]))
      
      # Claim Line and delete from other players
      players = claim_line_players(players, p = n, ed[1], ed[2])
      
      ps_sums(players, TRUE)
      show_path_all(players)
    }
  }
  e = Sys.time()
  print(e - s)
  time = time + (e - s)
}
print(time / loops)
