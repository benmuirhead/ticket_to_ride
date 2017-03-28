random_route = function(p = players[[1]]) {
  #returns start and end cities
  n = p$full_map
  
  l = length(V(n))
  samp = sample(1:length(V(n)), 2)
  r = list()
  r[[1]] = V(n)[samp[1]]$name
  r[[2]] = V(n)[samp[2]]$name
  #to be flushed out:
  r[[3]] = 10 * distances(n, V(n)[[r[[1]]]], V(n)[[r[[2]]]])[1]
  min = 11
  if (short){
    min = 7
  }
  if (r[[3]]<(min*10)){
    r = random_route(p)
  }
  return(r)
}
