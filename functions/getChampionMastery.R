# Ref.) https://developer.riotgames.com/api-methods/#champion-mastery-v4/GET_getAllChampionMasteries

## Get summoner's champion masteries
# @param gotSummoner : result of getSummoner()
# Return type : tibble, data.frame
# note) This function requires 'getSummoner' function first.
getChampionMastery <- function(gotSummoner) {
  GET(url = URLencode(iconv(paste0("https://kr.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/",
                                   gotSummoner$id), to = "UTF-8")),
      add_headers("X-Riot-Token" = getOption("RiotApiKey"))) %>% 
    content() %>% dplyr::bind_rows()
}