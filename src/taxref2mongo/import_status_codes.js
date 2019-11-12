/* 
 * Create a collection to list all status codes.
 *
 * Problem with sourceId:
 *  - sourceId: {$addToSet: "$sourceId"}:
 *    Create an array with all values. But when reading source ids with Moph-xR2RML, they are obtained as
 *    decimals ending with ".0". Hence the links created are wrong. Example:
 *    <http://taxref.mnhn.fr/lod/status/BARC/AIBA2> dct:source <http://taxref.mnhn.fr/lod/bib/204009.0> .
 *  - sourceId: {$first: "$sourceId"}
 *    One option is to not create an array but take only the first value instead, which seems to
 *    be good enough for the documents that are concerned. The aggregate step then becomes simply
 *    sourceId: {$first: "$sourceId"}
 */

db.statusCodes.drop()
db.statuses.aggregate([
    { $group: 
        { _id: {$concat: ["$statusCode", " - ", "$statusName"]},
          statusCode: {$first: "$statusCode"},
          statusName: {$first: "$statusName"},
          statusTypeName: {$first: "$statusTypeName"},
          statusTypeGroup: {$first: "$statusTypeGroup"},
          sourceId: {$first: "$sourceId"} }
    },
    
    { $lookup:
        { from:"statusTypes", localField:"statusTypeName", foreignField:"name", as:"statusTypeFull" }
    },
    
    { $addFields: { statusTypeFull0: { $arrayElemAt: ["$statusTypeFull", 0] }}},
    { $addFields: { statusTypeCode: "$statusTypeFull0.id" }},
    { $project: { statusTypeFull: 0, statusTypeFull0: 0 }},
    
    { $out: "statusCodes" }
])

db.statusCodes.createIndex({statusCode: 1})
