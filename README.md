#Quoter Documentation



## Explain what your project is and what it does

Quoter is a web app that allows users to store a list of contacts and text their friends a 'quote of the day' or jokes.

The app was built on the Ruby on Rails framework, PostgreSQL database, Active Record, SASS and uses several API's:
  + Data: 'They Said So', 'Yo Momma', 'The Internet Chuck Norris Database'
  + SMS Messaging: Twilio

The main functionality lies in the Message controller, which pulls data from one API and sends it in the form of a SMS message using Twilio.


## What problem does this solve?

While Quoter doesn't solve a particular problem, building an app with an entertaining motivation has shown me how to utilize a fruitful API.  I've been able to think about the potential uses of Twilio, particularly in social networking.
One could arguably say this is a social app, one in which friends can share quotes and jokes for entertainment value. However, I think it could be put to better use for something like Facebook groups or Meetups, in which storing contacts could be used for organizational purposes like reminders of upcoming events on the day or mass text of instructions/directions at large events.  Maybe, even more practically, send out warning or alerts.


## What were some of the technical difficulties that you faced while creating this?


1. Getting sessions and show_users to play nicely together
+ For some reason my current_user helper wasn't working sufficiently in the user and sessions controller and pundit was giving me some trouble.  I had to research the problem (surprisingly under used Stack Overflow for this project in lieu of some other excellent resources).  I ended up moving current_user into the SessionsHelper module and creating three more methods: log_in(user), logged_in?, and log_out.  These ended up doing the trick.

2. Stopping non logged in users from accessing other users account pages.
+ For this, I ended up creating a conditional statement (current_user.id != @user.id) that affected the layout, denied access, provided links back to Home.

## How long did it take you to produce the code?

When I really hit the ground running and seriously coded, the MVP took about a day. However, completing user and session functionality, as well as stlying, that took about 3 days.


## Installation instructions

This code runs in a Mac environment

1. Download Quoter
⋅⋅*  Download and save Quoter to your computer.  Open the command line and navigate to your directory where Quoter is located.

2. bundle install
⋅⋅* cd into the Quoter directory and type 'bundle install' in the command line

3. Type 'rake db:create'

4. Type 'rake db:migrate'

5. Type 'rake db:seed'
⋅⋅* This will create 'Resources', which pull json objects from three of the API's to be utilized by the Twilio API.

6. Sign up or sign in to to Twilio and retrieve your API & SID keys.

7. In the .env file, enter:
  + TWILIO_SID=*Your SID key here*
  + TWILIO_AUTH_TOKEN=*Your SID key here*

8. In config/secrets.yml, add the following under the secret_key_base in the development and production areas:
 + account_sid: <%= ENV["TWILIO_SID"]%>
 + auth_token: <%= ENV["TWILIO_AUTH_TOKEN"]%>

9. Type 'rails server' or 'rails s' to launch the server

10. Go to your web browser and type 'localhost:3000'. This will take you to the Quoter Welcome Page.


