CREATE VIRTUAL TABLE sentences_fts USING fts3(id SERIAL, lc VARCHAR, sentence TEXT);
CREATE TABLE sentences(id SERIAL, lc VARCHAR, sentence TEXT, PRIMARY KEY(id));
CREATE INDEX lci ON sentences(lc);
CREATE TABLE links(sid BIGINT, tid BIGINT);
CREATE INDEX li ON links(sid);
CREATE INDEX li2 ON links(tid);
--CREATE TABLE tags(id BIGINT, tag VARCHAR);
--CREATE INDEX ti ON tags(id);
.separator \t
.import "sentences_sed.csv" sentences
.import "sentencesl.csv" sentences_fts
--.import "tags.csv" tags
.import "links.csv" links
.backup tatoeba.db
.exit