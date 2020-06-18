/*
 * In TAXREF, there is no list of all possible status codes. We only have a list of
 * all possible  status types.
 * This script creates a collection to list all possible status codes by taking all unique
 * values from the statuses.
 *
 * The sourceId gives the id of the document that assigns this status to that taxon. It is typically
 * a scientific articles for biogeographical statuses.
 * In the status type groups Réglementation, Protection, Directives européennes and Conventions internationales,
 * sourceId will always be the same for all statuses with one specific code. E.g.: for code IBOAC, sourceId
 * will always be "Convention de Bonn : Accord ACCOBAMS".
 * Hence, in the collection we create here, we can take the first one, not all.
 * Consequence: the sourceId is nok for biogeographical statuses since it only gives one id.
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
