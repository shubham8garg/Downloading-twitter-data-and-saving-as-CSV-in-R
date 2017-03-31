install.packages('twitteR')
install.packages('ROAuth')
library('twitteR')
library('ROAuth')

# Download "cacert.pem" file
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")

#create an object "cred" that will save the authenticated object that we can use for later sessions
cred <- OAuthFactory$new(consumerKey='vSZtpXsasIda9fzDSik46aONH',
                         consumerSecret='p4xeVem8zfEeke0Y9OLrcDsS4k6eSyYp0OJokYEGHb5r8Nnha2',
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')

# Executing the next step generates an output --> To enable the connection, please direct your web browser to: <hyperlink> . Note:  You only need to do this part once
cred$handshake(cainfo="cacert.pem")

#save for later use for Windows
save(cred, file="twitter authentication.Rdata")

load("twitter authentication.Rdata")

registerTwitterOAuth(cred)
?setup_twitter_oauth
setup_twitter_oauth('vSZtpXsasIda9fzDSik46aONH', 'p4xeVem8zfEeke0Y9OLrcDsS4k6eSyYp0OJokYEGHb5r8Nnha2', access_token = '49375842-CMRFcPoJEZD4hIVPzyQwLIjr19nbea8Ii6ls8bjzd', access_secret = 'bfUDa3oxZjSTxi4RNIWHvR9W5I90JDpPcH1pso3oFBLo0')

searchstring <- "#waymo"
no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets, lang="en")
tws <- searchTwitter(searchString = '#waymo', n=25)
tws
Sear
tweetsDF <- twListToDF(tweets)

tweets