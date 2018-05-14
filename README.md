# README

* Ruby version
2.4.3

* System dependencies

* Configuration

* Database creation
rake db:create
rake db:migrate

* Database initialization
To create admin_user and be able to view all created models
rake db:seed

* How to run the test suite
rspec spec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
git push heroku master

* Application address
https://shorturltest.herokuapp.com/

* See current tests coverage
open coverage/index.html

* Style checking
rubocop

I decided to start with developing a web app architecture,
so I started with straight forward solution for the main algorithm and
used database relation with full and short version and MD5. I split
main functionality on 3 steps: show the main webpage, create URL relation
record and handle redirection.
For redirection, I use proxy middleware to avoid redundant controllers
initialization and validations. Then I added validation and saved user
request info.
In user request info I store ip and all data about the user system.
To show these requests I've added ActiveAdmin, as it is reliable an
quick to add admin dashboard with devise authentication by default.
Then I've added simplecov to check code test coverage and rubocop
to check styling. There were a lot of styling issues and it took time
to solve them. Sometimes I do not agree with rubocop styling in some
specific cases, but in most, it allows to adhere good code styling.
Then I've added better short URL algorithm according to my search for
best practices in such algorithms. It was quick enough because of good
test coverage. It looks not good to change migrations, but I suppose
that it should be in my branch and decided to not litter migrations with
previous implementation artifacts.
Also, I've not added test coverage to gitignore to show result of its work.
Then I've worked on better UX like naming, showing errors
and page styles.

If I had more time there is a lot to do: improving algorithm to make
result more random look, improve styles, recheck tables and variables
naming for artifacts, check DB loading for millions of records and optimize
it, improve the user interface and pages styling, review user info and add
more like location if needed or group by ip.
