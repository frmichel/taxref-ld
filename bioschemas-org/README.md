# Bioschemas.org example for biodiversity

This directory provides simple and preliminary examples of how a Bioschemas.org profile for biodiversity data could be used to annotate web pages.

It use the case of a [web page describing the beluga](https://inpn.mnhn.fr/espece/cd_nom/60932?lg=en) (_Delphinapterus leucas_) on the french National Museum of Natural History web portal.
It leverages current works within Bioshemas.org as well as the work achieved by Encyclopedia of Life (EoL) to provide JSON-LD harvested by Google to enrich their search result snippets. See the [JSON-LD produced by the EoL](http://eol.org/api/traits/328541) API for the beluga.

## Issues to be discussed:

1. **Type of the entity represented**. The JSON-LD description depicts a taxon (typically "@type": "dwc:Taxon") along with the description of its traits.
EoL opted for a http://schema.org/DataFeedItem instance, which is rather technical and very little informative wrt. the the nature of the entity.

2. **identifier vs. url**. The taxon we describe needs a dedicated IRI that is not the URL of the currently annotated web page. Should this IRI be provided with property http://schema.org/identifier? http://schema.org/url? Anything else?

3. **sameAs vs. subjectOf vs. mainEntityOfPage**. Property http://schema.org/sameAs links the described entity to "a reference Web page that unambiguously indicates the item's identity". EoL uses it to link to all web pages of web portals describing the same species.
The entities we model are taxa; which property should be used to link a taxon to web pages from other web potals: http://schema.org/sameAs like in EoL? http://schema.org/subjectOf?
Property http://schema.org/mainEntityOfPage may be used to link the entity to the web page currently being annotated.

4. **Links to LOD cloud resources**. To draw links to equivalent taxon resources from the LOD cloud, we should preferably use rdfs:sameAs that states equality of 2 resources.

5. **Parent name**: EoL uses property dwc:parentNameUsageID to link to the web page describing the parent taxon. This is arguably erroneous.
Since the entities we model are taxa, the parent cannot be a web page but another taxon. In the example, this should be the IRI for genus _Delphinapterus_.


## File example1.json

Example 1 is written according to the following choices (numbers refer to the questions in the previous question):
1. **Type of the entity represented**. A taxon as an instance of dwc:Taxon
2. **identifier vs. url**. The entity IRI is given by http://schema.org/identifier. 
3. **sameAs vs. subjectOf vs. mainEntityOfPage**. http://schema.org/subjectOf links to related web pages, http://schema.org/subjectOf links to the current web page URL.
4. **Links to LOD cloud resources**. Property rdfs:sameAs links to equivalent resources.
5. **Parent name**: dwc:parentNameUsageID links to the IRI of the parent taxon.

To enease readability, blank lines separate the file in several parts: (i) the context, (ii) the regular schema.org properties, (iii) properties imported from other vocabularies that may be part of the Bioschemas.org profile, (iv) data provider custom properties.
