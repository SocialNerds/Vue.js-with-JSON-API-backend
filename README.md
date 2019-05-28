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

Setup backend,
~~~~
install_backend.sh
~~~~

Exit the container,
~~~~
exit
~~~~

# Vue.js
(Pending)

# Backend endpoints

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

