## Inspiration
When we arrived in Georgia, we had an interesting problem. There were a lot of instances where we needed to know 
something and wanted to ask about it but the efforts were mostly futile since most people didn't understand us. 
Also, most of these questions could easily be answered if we had access to internet but since we were in another 
country and data roaming is crazy expensive, that was not an option. It'd be really great if we could find a way to
get the info we need by sending text messages in the absence of internet.

So, we decided to create Hext to address exactly this situation: To help people get answers/tips/etc from the internet
when they don't have access to it.

## What it does
It allows you to send your question as a sms message to a given numbber and posts the question on our Twitter account
as well as our web application. Any user on Twitter or on our web application can send a reply as a Twitter response
or as an answer on the web app and the response is sent as an sms to the asker.

## How I built it
We built is using ruby on rails framework using twilio integration for sending and receiving text messages. We use 
oauth for the twitter integration for login and responses. We use heroku for speeding our deployment. We also 
experimented with Otto (successor to Vagrant) for speeding our devops and Amazon Web Services for deployment purposes.

## Challenges I ran into
Understanding twilio and how it works. Setting up AWS and Twitter social auth

## Accomplishments that I'm proud of

## What I learned

## What's next for Hext
