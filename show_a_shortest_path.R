show_a_shortest_path = function(start_city = "Omaha",
                                end_city = "Raleigh",
                                p = p1) {
  n = p$current_map
  asp = p$all_asp
  a = start_city
  b = end_city
  a_index = as.numeric(V(n)[[a]])
  b_index = as.numeric(V(n)[[b]])
  b_start_in_a_asp = sum(asp[[a]]$nrgeo[1:(b_index - 1)]) + 1
  asp_count = asp[[a]]$nrgeo[b_index]
  all_asp_a_to_b = asp[[a]]$res[b_start_in_a_asp:(b_start_in_a_asp +
                                                    asp_count - 1)]
  print(paste(p$name,"- Number of shortest routes:", length(all_asp_a_to_b),"|","Distance:", distances(n, V(n)[[a]], V(n)[[b]])[1]))
  # print(paste("Distance:", distances(n, V(n)[[a]], V(n)[[b]])[1]))
  index_to_use = sample(1:length(all_asp_a_to_b), 1)
  short_path = all_asp_a_to_b[[index_to_use]]
  E(n)$color = "grey"
  E(n)$color[E(n)$owner == p$index] = p$train_color
  E(n, path = short_path)$color = "red"
  E(n)$color[E(n)$owner == p$index &
               E(n)$color == "red"] = "purple"
  plotS(n)
}


show_full_map = function(ps = players) {
  f = ps[[1]]$full_map
  indecies = c()
  color = c()
  for (p in ps) {
    indecies = c(indecies, p$index)
    color = c(color, p$train_color)
  }
  E(f)$color = "grey"
  for (i in indecies) {
    E(f)$color[E(f)$owner == i] = color[i]
  }
  E(f)$color[E(f)$owner == p$index] = p$train_color
  plotS(f)
  
}

show_path_all = function(ps = players) {
  graphics.off()
  x11(30, 20)
  # dev.new(width=50,height = 4)
  par(mfrow = c(1, length(ps)))
  for (i in 1:length(ps)) {
    show_a_shortest_path(p = players[[i]], players[[i]][["routes"]][[players[[i]]$current_route]][[1]], players[[i]][["routes"]][[players[[i]]$current_route]][[2]])
  }
  par(mfrow = c(1, 1))
}
