#main
setwd("~/GitHub/ticket_to_ride")
source("setup.R")

source("load_data.R")

source("build_network.R")

source("build_all_asp.R")

source("show_a_shortest_path.R")

source("plotS.R")

source("claim_delete_lines.R")

source("create_players.R")

source("player_summary.R")


s = Sys.time()
players = createPlayers(2)

for (t in 1:20){
  for(n in 1:length(players)){
    players = claim_random_line_players(players,n)
    ps_sums(players,FALSE)
    show_full_map()
  }
}
e = Sys.time()
print(e-s)
