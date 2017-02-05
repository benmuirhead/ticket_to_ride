claim_line_players = function(ps = players,
                              p = 1,
                              start_city = "Denver",
                              end_city = "Kansas City") {
  print(paste("claiming for player", p))
  ps[[p]] = claim_line(players[[p]], start_city, end_city)
  x = seq(length(players))
  x = x[!x == p]
  for (i in x) {
    print(paste("deleting from player:", i))
    ps[[i]] = delete_line(
      p = ps[[i]],
      p_num = p,
      start_city = start_city,
      end_city = end_city
    )
  }
  return(ps)
}

claim_random_line_players = function(ps = players, p = 1) {
  player = ps[[p]]
  l = length(E(player$current_map)[E(player$current_map)$owner == 0])
  print(paste(l, "unclaimed lines"))
  samp = sample(1:l, 1)
  start = ends(player$current_map, E(player$current_map)[E(player$current_map)$owner == 0][[samp]])[1]
  end = ends(player$current_map, E(player$current_map)[E(player$current_map)$owner == 0][[samp]])[2]
  print(paste(start, "-", end))
  
  ps = claim_line_players(ps, p, start_city = start, end_city = end)
  return(ps)
}

claim_line = function(p = p1,
                      start_city = "Denver",
                      end_city = "Kansas City") {
  n = p$current_map
  x = E(n, P = c(V(n)[[start_city]], V(n)[[end_city]]))
  edge_attr(n, "owner")[[x]] = p$index
  edge_attr(n, "weight")[[x]] = 0
  edge_attr(n, "label")[[x]] = 0
  edge_attr(n, "lty")[[x]] = 1
  p$current_map = n
  p$all_asp = build_all_asp(p$current_map)
  
  f = p$full_map
  x = E(f, P = c(V(f)[[start_city]], V(f)[[end_city]]))
  edge_attr(f, "owner")[[x]] = p$index
  edge_attr(f, "weight")[[x]] = 0
  edge_attr(f, "label")[[x]] = 0
  edge_attr(f, "lty")[[x]] = 1
  p$full_map = f
  return(p)
}

claim_random_line = function(p = p1) {
  l = length(E(p$current_map)[E(p$current_map)$owner == 0])
  print(paste(l, "unclaimed lines"))
  samp = sample(1:l, 1)
  start = ends(p1$current_map, E(p1$current_map)[E(p1$current_map)$owner == 0][[samp]])[1]
  end = ends(p1$current_map, E(p1$current_map)[E(p1$current_map)$owner == 0][[samp]])[2]
  print(paste(start, "-", end))
  
  p = claim_line(p, start_city = start, end_city = end)
  return(p)
}

delete_line = function(p = p1,
                       p_num = p,
                       start_city = "Omaha",
                       end_city = "Kansas City") {
  n = p$current_map
  p$current_map = delete.edges(n, E(n, P = c(V(n)[[start_city]], V(n)[[end_city]])))
  
  f = p$full_map
  x = E(f, P = c(V(f)[[start_city]], V(f)[[end_city]]))
  edge_attr(f, "owner")[[x]] = p_num
  edge_attr(f, "weight")[[x]] = 0
  edge_attr(f, "label")[[x]] = 0
  edge_attr(f, "lty")[[x]] = 1
  p$full_map = f
  
  #Regen asp
  p$all_asp = build_all_asp(p$current_map)
  return(p)
}

delete_random_line = function(p = p1) {
  l = length(E(p$current_map)[E(p$current_map)$owner == 0])
  print(paste(l, "unclaimed lines"))
  samp = sample(1:l, 1)
  start = ends(p1$current_map, E(p1$current_map)[E(p1$current_map)$owner == 0][[samp]])[1]
  end = ends(p1$current_map, E(p1$current_map)[E(p1$current_map)$owner == 0][[samp]])[2]
  print(paste(start, "-", end))
  
  p = delete_line(p = p,
                  start_city = start,
                  end_city = end)
  return(p)
}