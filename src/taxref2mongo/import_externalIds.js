// Add a field taxronReferenceId to each document in the externalIds
// by doing a join (lookup) with the taxonomy collection.

db.externalIds_tmp.drop()
db.externalIds.aggregate([
    { $lookup:
        { from:"taxonomy", localField:"taxrefId", foreignField:"id", as:"taxon" }
    },
    { $unwind: "$taxon" },
    { $addFields: { taxonReferenceId: "$taxon.referenceId" }},
    { $project: { taxon: 0 }},

    { $out: "externalIds_tmp" }
])

// Replace current collection with new one
db.externalIds.drop()
db.externalIds_tmp.renameCollection("externalIds")

db.externalIds.createIndex({taxrefId: 1})
db.externalIds.createIndex({externalDbName: 1})
