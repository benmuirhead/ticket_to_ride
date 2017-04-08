#main
setwd("~/GitHub/ticket_to_ride")
source("setup.R")
set.seed(2)
source("load_data.R")
short = FALSE
source("build_network.R")

source("build_all_asp.R")

source("show_a_shortest_path.R")

source("plotS.R")

source("claim_delete_lines.R")

source("create_players.R")

source("player_summary.R")

source("route.R")

source("get_edge_on_asp_from_route.R")

source("player_turn.R")
# players = createPlayers(2)
# players = player_turn(players,1)
# show_path_all(players)

loops = 1
time = 0
turns = 10
for (i in 1:loops) {
  s = Sys.time()
  players = createPlayers(2)
  for (j in 1:turns) {
    for (n in 1:length(players)) {
      players = player_turn(players, n, FALSE)
      show_path_all(players)
    }
  }
  e = Sys.time()
  print(e - s)
  time = time + (e - s)
}
print(time / loops)

check_owners()
