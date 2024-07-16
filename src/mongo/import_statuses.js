// Together with each status, the statuses service provides
// the status type name and status type group, e.g.:
//    "statusTypeName" : "Statut biogéographique territorial (TAXREF)",
//    "statusTypeGroup" : "Statut biogéographique"
// but not the status type code, e.g.:
//	"statusTypeCode" : "TAXREF_STATUT_BIOGEO",
// But we need the status type code to build the URIs of legal statuses sources documents, e.g.:
//    http://taxref.mnhn.fr/lod/status/BONN/IBOAC
//
// Therefore, this scrpit adds a field statusTypeCode to each document in the statuses.
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
