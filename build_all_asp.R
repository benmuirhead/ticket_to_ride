build_all_asp = function(net, pri = TRUE) {
  if(pri) tic()
  all_asp = list()
  total_short_paths = 0
  for (i in 1:(length(V(net)))) {
    # print(V(net)[i]$name)
    all_asp[[V(net)[i]$name]] = all_shortest_paths(net, V(net)[i], to = V(net),
                                                   weights = NULL)
    
    # print(sum(all_asp[[i]]$nrgeo))
    total_short_paths = total_short_paths + sum(all_asp[[i]]$nrgeo)
  }
  if(pri) print(paste("total short paths:", total_short_paths))
  if(pri) toc()
  return(all_asp)
}
#
# all_asp2 = list()
#
# library(doParallel)
#
# no_cores = detectCores() - 1
# cl <- makeCluster(no_cores)
# registerDoParallel(cl)
#
# getDoParWorkers()
#
# get_asp = function(net, f) {
#   asp = list()
#   asp[[V(net)[f]$name]] = all_shortest_paths(net, V(net)[f], to = V(net),
#                                                  weights = NULL)
#
#   return(asp)
# }
#
# o2 = get_asp(p1$current_map, 1)
#
# all_asp = list()
# o = (foreach(f = 1:2,.combine=list) %do% get_asp(p1$current_map, f))
#
# summary(o)
# o[1]
# o[["Atlanta"]]
# summary(o[["Atlanta"]])
# summary(o2[["Atlanta"]])
# summary(p1$all_asp[["Atlanta"]])
#
# summary(p1$all_asp)
# names(p1$all_asp)
#
# p1$current_map=delete.edges(p1$current_map,E(p1$current_map)[10:35])
# p1$current_map=delete.vertices(p1$current_map,V(p1$current_map)[7])
# p1$all_asp=build_all_asp(net = p1$current_map)
# plotS(p1$current_map)
# for (i in 1:3) {
#   for (j in 1:3) {
#     all_asp2[[V(net)[i]$name]] = all_shortest_paths(net, V(net)[i], to = V(net)[j], weights = NULL)
#   }
# }
# all_asp2[[V(net)[i]$name]] = all_shortest_paths(net, V(net)[i], to = V(net)[j], weights = NULL)
#
#
# tic()
# all_asp = list()
# total_short_paths = 0
# for (i in 1:2) {
#   # print(V(net)[i]$name)
#   all_asp[[V(net)[i]$name]] = all_shortest_paths(net, V(net)[i], to = V(net),
#                                                  weights = NULL)
#
#   # print(sum(all_asp[[i]]$nrgeo))
#   total_short_paths = total_short_paths + sum(all_asp[[i]]$nrgeo)
# }
# print(paste("total short paths:", total_short_paths))
# toc()
