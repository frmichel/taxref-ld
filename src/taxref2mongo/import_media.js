// Add a field 'licence_url' to each document based on the 'licence' field.
// E.g. Translate CC BY-NC-SA into "https://creativecommons.org/licenses/by-nc-sa/3.0/fr/"

db.media_tmp.drop()
db.media.aggregate([

    { $addFields: { 'licence_url': {
        $switch: {
            branches: [
              { case: { $eq: [ "$licence", 'CC BY' ] },       then: 'https://creativecommons.org/licenses/by/3.0/fr/' },
              { case: { $eq: [ "$licence", 'CC BY-ND' ] },    then: 'https://creativecommons.org/licenses/by-nd/3.0/fr/' },
              { case: { $eq: [ "$licence", 'CC BY-NC-ND' ] }, then: 'https://creativecommons.org/licenses/by-nc-nd/3.0/fr/' },
              { case: { $eq: [ "$licence", 'CC BY-NC' ] },    then: 'https://creativecommons.org/licenses/by-nc/3.0/fr/' },
              { case: { $eq: [ "$licence", 'CC BY-NC-SA' ] }, then: 'https://creativecommons.org/licenses/by-nc-sa/3.0/fr/' },
              { case: { $eq: [ "$licence", 'CC BY-SA' ] },    then: 'https://creativecommons.org/licenses/by-sa/3.0/fr/' },
            ],
            default: "$licence"
        }
    }}},

    { $out: "media_tmp" }
])

// Replace current collection with new one
db.media.drop()
db.media_tmp.renameCollection("media")

db.media.createIndex({'taxon.id': 1})
db.media.createIndex({externalDbName: 1})
