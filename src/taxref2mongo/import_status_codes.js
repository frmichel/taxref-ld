db.statusCodes.drop()

/* Problem with sourceId:
 *
 *  - sourceId: {$addToSet: "$sourceId"}:
 *    Create an array with all values. But when reading source ids with Moph-xR2RML, they are obtained as
 *    decimals ending with ".0". Hence the links created are wrong. Example:
 *    <http://taxref.mnhn.fr/lod/status/BARC/AIBA2> dct:source <http://taxref.mnhn.fr/lod/bib/204009.0> .
 *
 *  - sourceId: {$first: "$sourceId"}
 *    One option is to not create an array but take only the first value instead, which seems to
 *    be good enough for the documents that are concerned. The aggregate step then becomes simply
 *    sourceId: {$first: "$sourceId"}
 */

var a =
    db.statuses.aggregate([{
        $group: {
            _id: {$concat: ["$statusCode", " - ", "$statusName"]},
            statusCode: {$first: "$statusCode"},
            statusName: {$first: "$statusName"},
            statusTypeName: {$first: "$statusTypeName"},
            statusTypeGroup: {$first: "$statusTypeGroup"},
            sourceId: {$first: "$sourceId"}
        }
    }]).toArray();

for (var i = 0; i < a.length; i++) {
    a[i].statusTypeCode = db.statusTypes.distinct("id", {name: a[i].statusTypeName})[0]
}

db.statusCodes.insertMany(a)
