cities = read.csv("cities.csv",header = TRUE, nrows=36, stringsAsFactors = FALSE)
head(cities)

library(RDSTK)
??RDSTK

street2coordinates(address = "Atlanta")

getCurlHandle()


street2coordinates2 <- function(address, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/street2coordinates/", sep="")
  get.addy <- getURL(paste(api, URLencode(address), sep=""), curl=session)
  clean.addy <- lapply(fromJSON(get.addy),
                       lapply,
                       function(x) ifelse(is.null(x), NA, x))
  result <- ldply(clean.addy, data.frame)
  names(result)[1] <- "full.address"
  return(result)
}

x=street2coordinates2(address = "Sault St Marie MI")
x
x$region

cities2=cities
cities$City
cities$lat=NA
cities$long=NA
cities$region=NA
for ( i in 1:length(cities$City)){
  print(cities$City[i])
  x=street2coordinates2(address = paste(cities$City[i],cities$state[i]))
  if(dim(x)[1] == 0){
    next()
  }
  cities$lat[i] = x$latitude
  cities$long[i] = x$longitude
  cities$region[i] = paste(x$region)
}
cities$region
i=1

cities$long[36]=NA

plot(y=cities$lat,x=cities$long)
?plot
text(y=cities$lat,x=cities$long,labels = cities$City)
write.csv(cities,"cities_2.csv",row.names = FALSE,quote = FALSE)
