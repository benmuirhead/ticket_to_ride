player_turn = function(ps = players, n = 1, pri = FALSE) {
  print(paste(ps[[n]]$name, "turn ----"))
  print(paste("solving route", ps[[n]][["routes"]][[ps[[n]]$current_route]][[1]], "-", ps[[n]][["routes"]][[ps[[n]]$current_route]][[2]]))
  
  #Check if route is complete
  ps_sums(ps, edges = FALSE)
  
  # Get an edge to claim
  ed = get_edge_on_asp_from_route(ps[[n]])
  
  #if no edges left
  if (ed[1] == 0) {
    #set.seed(2)
    print("adding new route")
    ps[[n]]$routes[[ps[[n]]$current_route + 1]] = random_route(ps[[n]])
    ps[[n]]$current_route = ps[[n]]$current_route + 1
    print(paste("New current route:",ps[[n]]$current_route))
    print(paste("solving route", ps[[n]][["routes"]][[ps[[n]]$current_route]][[1]], "-", ps[[n]][["routes"]][[ps[[n]]$current_route]][[2]]))
    ps_sums(ps, edges = FALSE)
    ps = player_turn(ps, n, TRUE)
  } else{
    print(paste("edge chosen:", ed[1], "-", ed[2]))
    # Claim Line and delete from other players
    ps = claim_line_players(ps = ps, p = n, start_city = ed[1], end_city = ed[2], pri = pri)
  }
  ps_sums(ps, edges = FALSE)
  #show_path_all(ps)
  return(ps)
}