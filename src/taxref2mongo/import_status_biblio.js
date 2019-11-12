/* 
 * Create a collection to list all bibliographic references associated with statuses
 */

db.statusBiblio.drop()
db.statuses.aggregate([
    { $group: 
        { _id: "$sourceId",
          statusCode: {$first: "$statusCode"},
          statusName: {$first: "$statusName"},
          statusTypeCode: {$first: "$statusTypeCode"},
          statusTypeName: {$first: "$statusTypeName"},
          statusTypeGroup: {$first: "$statusTypeGroup"},
          sourceId: {$first: "$sourceId"},
          source: {$first: "$source"}
        }
    },
    
    { $out: "statusBiblio" }
])
