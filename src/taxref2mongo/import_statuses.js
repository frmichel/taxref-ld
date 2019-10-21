// Add a field statusTypeCode to each document in the statuses.
// This requires doing a join (lookup) with the statusTypes collection.

db.statuses_tmp.drop()

db.statuses.aggregate([

    { $lookup:
        { from:"statusTypes", localField:"statusTypeName", foreignField:"name", as:"statusTypeFull" }
    },

    { $addFields: { statusTypeFull0: { $arrayElemAt: ["$statusTypeFull", 0] }}},

    { $addFields: { statusTypeCode: "$statusTypeFull0.id" }},

    { $project: { statusTypeFull: 0, statusTypeFull0: 0 }},

    { $out: "statuses_tmp" }
])

// Replace current collection with new one
db.statuses.drop()
db.statuses_tmp.renameCollection("statuses")

db.statuses.createIndex({statusTypeGroup: 1})
db.statuses.createIndex({statusCode: 1})
