# CRU with form_for Lab

## Requirement

* A song belongs to an artist

* A song belongs to a genre

* A genre has many songs

* An artist has many songs

```db
table "artists"
  string   "name"
  text     "bio"

table "genres"
  string   "name"

table "songs"
  string   "name"
  integer  "artist_id"
  integer  "genre_id"
```

## Solution

1. Make Model for Models, DB, Association

rails g model Artist name:string bio:text --no-test-framework
rails g model Genre name:string --no-test-framework
rails g model Song name:string --no-test-framework
rake db:migrate

* A song belongs to an artist
* A song belongs to a genre

```
class Song < ApplicationRecord
    belongs_to :artist
    belongs_to :genre
end
```

* A genre has many songs

```
class Genre < ApplicationRecord
    has_many :songs
end
```

* An artist has many songs

```
class Artist < ApplicationRecord
    has_many :songs
end
```

* A song belongs to an artist
rails g migration AddArtistToSong artist:belongs_to

* A song belongs to a genre
rails g migration AddGenreToSong genre:belongs_to
rake db:migrate

2. Make Controller for Controllers, Routes, Views
rails g controller songs index show new create edit update --no-test-framework
rails g controller genres index show new create edit update --no-test-framework
rails g controller artists index show new create edit update --no-test-framework
