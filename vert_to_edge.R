vert_to_edge = function(net, city1, city2) {
  n = net
  for (i in 1:length(E(n))) {
    if ((ends(n, es = E(n))[i, 1] == city1 ||
         ends(n, es = E(n))[i, 1] == city2) &&
        (ends(n, es = E(n))[i, 2] == city1 || ends(n, es = E(n))[i, 2] == city2)) {
      print(i)
      return(E(n)[i])
    }
  }
}