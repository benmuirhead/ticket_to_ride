p_sum = function(p, edges = TRUE) {
  # print(p$name)
  print(paste(sep="",p$name,": vert: ", length(V(p$current_map))," edges: ", length(E(p$current_map))," lines: ", sum(E(p$current_map)$owner==p$index)))
  if (edges) {
    for (i in 1:length(E(p$current_map)$owner)) {
      if (E(p$current_map)$owner[i] == p$index) {
        print(E(p$current_map)[i])
      }
    }
  }
}

ps_sums = function(ps = players, edges = TRUE) {
  for (i in players) {
    p_sum(i, edges)
  }
}