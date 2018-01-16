SRC=*.ink
BIN=~/bin

%.zip: %
	zip -r $@ $^

%.ink.json: %.ink
	${BIN}/inklecate $^


FWS3000.zip: FWS3000

FWS3000: FWS3000/FWS3000.js
	touch $@

FWS3000/FWS3000.js: FWS3000.ink.json
	echo 'var storyContent = ' > $@
	cat $^ >> $@
	echo ';' >> $@

FWS3000.ink.json: FWS3000.ink

all: FWS3000.zip 

clean:
	-rm FWS3000/FWS3000.js *.zip
