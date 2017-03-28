get_edge_on_asp_from_route = function(p = players[[1]]) {
  n = p$current_map
  asp = p$all_asp
  a = p$routes[[p$current_route]][[1]]
  b = p$routes[[p$current_route]][[2]]
  a_index = as.numeric(V(n)[[a]])
  b_index = as.numeric(V(n)[[b]])
  b_start_in_a_asp = sum(asp[[a]]$nrgeo[1:(b_index - 1)]) + 1
  asp_count = asp[[a]]$nrgeo[b_index]
  all_asp_a_to_b = asp[[a]]$res[b_start_in_a_asp:(b_start_in_a_asp +
                                                    asp_count - 1)]
  # index_to_use = sample(1:length(all_asp_a_to_b), 1)
  # short_path = all_asp_a_to_b[[index_to_use]]
  edges = matrix(ncol = 2, nrow = 0)
  routes_claimed = ends(n, E(n)[E(n)$owner == p$index])
  for (i in 1:length(all_asp_a_to_b)) {
    for (j in 1:(length(all_asp_a_to_b[[i]]) - 1)) {
      r = c(all_asp_a_to_b[[i]][[j]]$name, all_asp_a_to_b[[i]][[j + 1]]$name)
      if (length(routes_claimed) > 0) {
        claimed = sum(apply(routes_claimed, 1, function(x, want)
          isTRUE(all.equal(x, want)), r))>0 ||
          sum(apply(routes_claimed, 1, function(x, want)
            isTRUE(all.equal(x, want)), c(r[2], r[1])))>0
      } else{
        claimed = FALSE
      }
      if (!claimed) {
        edges = rbind(edges, r)
      }
    }
  }
  if(length(edges)==0){
    print("Route Complete or cannot finish route")
    return(0)
  }
  l = sample(1:(length(edges) / 2), 1)
  print(paste("possible edges to claim:",(length(edges) / 2)))
  print(edges)
  e = edges[l,]
  return(e)
}
