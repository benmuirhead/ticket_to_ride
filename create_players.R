createPlayer = function(blank_map = blank_map,
                        player_name = "player1",
                        index = 1) {
  p = list()
  colors = c("green","blue","yellow","orange","violet")
  
  p$name = player_name
  p$current_map = blank_map
  p$all_asp = build_all_asp(p$current_map)
  p$full_map = blank_map
  p$train_color = colors[index]
  if(is.na(colors[index])){
    p$train_color = "pink"  
  }
  p$index = index
  return(p)
}


createPlayers = function(count = 2) {
  players = list()
  for (i in 1:count) {
    print(paste("Creating Player",i))
    players[[i]] = createPlayer(blank_map, paste("player", i, sep = ""),i)
  }
  # players[[1]]=p1
  # players[[2]]=p2
  return(players)
}