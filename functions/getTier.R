# Ref.) https://developer.riotgames.com/api-methods/#league-v4/GET_getAllLeaguePositionsForSummoner

# Get summoner's rank game position(tier)
# @param gotSummoner : result of getSummoner()
# Return type : tibble, data.frame
# note) This function requires 'getSummoner' function first.
getTier <- function(gotSummoner) {
  suppressWarnings(
    GET(url = URLencode(iconv(paste0("https://kr.api.riotgames.com/lol/league/v4/positions/by-summoner/",
                                     gotSummoner$id), to = "UTF-8")),
        add_headers("X-Riot-Token" = getOption("RiotApiKey"))) %>% content() %>%
      lapply(as.data.frame) %>% bind_rows()
  )
}