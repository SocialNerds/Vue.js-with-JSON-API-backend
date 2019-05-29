# Warning
Work in progress. Not yet working. Soon...

# Vue.js GET, POST and Authentication example

This repo contains an example project on Vue.js with JSON API backend.

# Check the full explanation video (GR)
<!-- [![Unit Testing, Γιατί το Κάνουμε; #81, live](https://img.youtube.com/vi/DTdYndNp8vw/0.jpg)](https://youtu.be/DTdYndNp8vw) -->
(Pending)

# Installation
Requirements
- You need to have [Docker](https://docs.docker.com/engine/installation/) installed

Run in root folder,
~~~~
cp .env.example .env
docker-compose build && docker-compose up -d
~~~~

Login to the container,
~~~~
docker exec -it -u serveruser app_fpm /bin/bash -c "TERM=$TERM exec bash"
~~~~

Install dependencies,
~~~~
composer install
~~~~

Setup backend,
~~~~
install_backend.sh
~~~~

Exit the container,
~~~~
exit
~~~~

Shutdown the containers,
~~~~
docker-compose down
~~~~

# Vue.js
You have a couple of options for running the frontend (`/www/frontend`):
- If you have natively installed npm, you can run the devserver with `npm run dev` (or `yarn serve`), in order to rapidly test with hotreload

- If you want to package the project for production usage, you run `npm run build` (or `yarn build`). Files under `/www/frontend/dist` need to be server by the webserver of your choice. Don't forget to configure CORS.

# Backend endpoints
Basic authentication is supported throughout the app. The same is true for JWT-based auth.

### JWT provider
GET method with basic_auth on,
~~~~
127.0.0.1/backend/jwt/token
~~~~
Credentials,
~~~~
username: admin
password: 123456
~~~~

### Articles
~~~~
127.0.0.1/backend/api/articles
~~~~

### Authors
~~~~
127.0.0.1/backend/api/authors
~~~~

## Create new article
Typical POST request payload to create a new article,
~~~~
{  
   "data":{  
      "type":"articles",
      "attributes":{  
         "title":"This is a new article",
         "body":{  
            "value":"This is a new body",
            "format":"plain_text"
         }
      },
      "relationships":{  
         "author":{  
            "data":{  
               "type":"authors",
               "id":"[AUTHOR_UUID]"
            }
         }
      }
   }
}
~~~~
Where \[AUTHOR_UUID\] is the UUID of the author (admin) from /api/authors.

Don't forget to set headers,
~~~~
Authorization: Bearer [JWT_TOKEN]
Content-Type: application/vnd.api+json
Accept: application/vnd.api+json
~~~~
Where \[JWT_TOKEN\] is the JWT token from /jwt/token.

# By Theodoros Ntakouris
* [GitHub](https://github.com/Zarkopafilis)

# And SocialNerds
* [SocialNerds.gr](https://www.socialnerds.gr/)
* [YouTube](https://www.youtube.com/SocialNerdsGR)
* [Facebook](https://www.facebook.com/SocialNerdsGR)
* [Twitter](https://twitter.com/socialnerdsgr)

