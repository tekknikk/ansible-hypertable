CREATE NAMESPACE data_test;
USE data_test;

# docs / zoom
CREATE TABLE doc (
  dr MAX_VERSIONS 1,
  tags MAX_VERSIONS 1,
  headline MAX_VERSIONS 1,
  when MAX_VERSIONS 1,
  byline MAX_VERSIONS 1,
  slug MAX_VERSIONS 1,
  url MAX_VERSIONS 1,
  body MAX_VERSIONS 1,
  images MAX_VERSIONS 1,
  publication MAX_VERSIONS 1,
  'output_tags' MAX_VERSIONS 1,
  't_' MAX_VERSIONS 1,
  'rev_when' MAX_VERSIONS 1, INDEX 'rev_when',
  ACCESS GROUP docrep (dr),
  ACCESS GROUP default (tags, headline, when, byline, slug, url, body, images, publication, 'output_tags', 't_', 'rev_when')
);

CREATE TABLE counts1 (
  freq COUNTER,
  ACCESS GROUP default (freq)
);

CREATE TABLE counts2 (
  freq COUNTER,
  ACCESS GROUP default (freq)
);

CREATE TABLE link (
  empty MAX_VERSIONS 1,
  ACCESS GROUP default (empty)
);

CREATE TABLE relatedconcepts (
  r0 MAX_VERSIONS 1,
  c0 MAX_VERSIONS 1,
  r1 MAX_VERSIONS 1,
  c1 MAX_VERSIONS 1,
  r2 MAX_VERSIONS 1,
  c2 MAX_VERSIONS 1,
  r3 MAX_VERSIONS 1,
  c3 MAX_VERSIONS 1,
  r4 MAX_VERSIONS 1,
  c4 MAX_VERSIONS 1,
  r5 MAX_VERSIONS 1,
  c5 MAX_VERSIONS 1,
  r6 MAX_VERSIONS 1,
  c6 MAX_VERSIONS 1,
  r7 MAX_VERSIONS 1,
  c7 MAX_VERSIONS 1,
  ACCESS GROUP default (r0, c0, r1, c1, r2, c2, r3, c3, r4, c4, r5, c5, r6, c6, r7, c7)
);


# linking data
CREATE TABLE concept (
  tags MAX_VERSIONS 1,
  name MAX_VERSIONS 1, INDEX name,
  bow MAX_VERSIONS 1,
  categories MAX_VERSIONS 1,
  inlinks MAX_VERSIONS 1,
  aliases MAX_VERSIONS 1,
  contexts MAX_VERSIONS 1,
  redirects MAX_VERSIONS 1,
  prior MAX_VERSIONS 1,
  'ne_type' MAX_VERSIONS 1,
  't_' MAX_VERSIONS 1,
  source MAX_VERSIONS 1,
  slug MAX_VERSIONS 1, INDEX slug,
  'display_name' MAX_VERSIONS 1,
  description MAX_VERSIONS 1,
  'wiki_id' MAX_VERSIONS 1,
  'wiki_inlinks' MAX_VERSIONS 1,
  'wiki_outlinks' MAX_VERSIONS 1,
  'user_categories' MAX_VERSIONS 1,
  'user_redirects' MAX_VERSIONS 1,
  'wiki_markup' MAX_VERSIONS 1,
  'user_aliases' MAX_VERSIONS 1,
  'associated_concepts' MAX_VERSIONS 1,
  names MAX_VERSIONS 1,
  ACCESS GROUP 'linking_data' (tags, name, bow, categories, inlinks, aliases, contexts, redirects, prior, 'ne_type', 't_'),
  ACCESS GROUP default (source, slug, 'display_name', description, 'wiki_id', 'wiki_inlinks', 'wiki_outlinks', 'user_categories', 'user_redirects', 'wiki_markup', 'user_aliases', 'associated_concepts', names)
);

CREATE TABLE jointcount (
  freq COUNTER,
  ACCESS GROUP default (freq)
);

CREATE TABLE gazetteerdata (
  concepts MAX_VERSIONS 1,
  ACCESS GROUP default (concepts)
);

CREATE TABLE tokcount (
  freq COUNTER,
  ACCESS GROUP default (freq)
);

CREATE TABLE tag (
  priority MAX_VERSIONS 1,
  ACCESS GROUP default (priority)
);


# summariser
CREATE TABLE summariser (
  'max_sentiment' MAX_VERSIONS 1,
  prior MAX_VERSIONS 1,
  'first_sentence' MAX_VERSIONS 1,
  'max_relevance' MAX_VERSIONS 1,
  vagueness MAX_VERSIONS 1,
  quotes MAX_VERSIONS 1,
  numericity MAX_VERSIONS 1,
  ACCESS GROUP default ('max_sentiment', prior, 'first_sentence', 'max_relevance', vagueness, quotes, numericity)
);

CREATE TABLE cachedsummary (
  data MAX_VERSIONS 1 TTL 86400,
  ACCESS GROUP default (data)
);


# annotator
CREATE TABLE annotation (
  user MAX_VERSIONS 1, INDEX user,
  kind MAX_VERSIONS 1,
  annotation MAX_VERSIONS 1,
  tag MAX_VERSIONS 1,
  ACCESS GROUP default (user, kind, annotation, tag)
);

CREATE TABLE conceptmention (
  freq COUNTER,
  ACCESS GROUP default (freq)
);

CREATE TABLE mentionconcept (
      freq COUNTER,
  ACCESS GROUP default (freq)
);


# queue
CREATE TABLE output (
  tags MAX_VERSIONS 1,
  'run_relevance' MAX_VERSIONS 1,
  'relevance_model_file' MAX_VERSIONS 1,
  'run_reject_doc' MAX_VERSIONS 1,
  'rejected_headlines' MAX_VERSIONS 1,
  'rejected_sections' MAX_VERSIONS 1,
  'min_paras' MAX_VERSIONS 1,
  'run_reject_chains' MAX_VERSIONS 1,
  'reject_byline_mention' MAX_VERSIONS 1,
  'min_mentions' MAX_VERSIONS 1,
  'limit_chains' MAX_VERSIONS 1,
  'export_related' MAX_VERSIONS 1,
  'export_counts1' MAX_VERSIONS 1,
  'export_counts2' MAX_VERSIONS 1,
  'export_links' MAX_VERSIONS 1,
  'export_zoom' MAX_VERSIONS 1,
  'zoom_prefix' MAX_VERSIONS 1,
  'export_tok_count' MAX_VERSIONS 1,
  ACCESS GROUP default (tags, 'run_relevance', 'relevance_model_file', 'run_reject_doc', 'rejected_headlines', 'rejected_sections', 'min_paras', 'run_reject_chains', 'reject_byline_mention', 'min_mentions', 'limit_chains', 'export_related', 'export_counts1', 'export_counts2', 'export_links', 'export_zoom', 'zoom_prefix', 'export_tok_count')
);

CREATE TABLE failedqueue (
  kind MAX_VERSIONS 1, INDEX kind,
  message MAX_VERSIONS 1,
  traceback MAX_VERSIONS 1,
  ACCESS GROUP default (kind, message, traceback)
);

CREATE TABLE nextid (
  id COUNTER,
  ACCESS GROUP default (id)
);

CREATE TABLE updatedconcept (
  empty MAX_VERSIONS 1,
  ACCESS GROUP default (empty)
);

