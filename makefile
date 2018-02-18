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
	LANG=C LC_ALL=C sed '1s/^\xef\xbb\xbf//' < $^ >>$@ # #https://unix.stackexchange.com/questions/381230/how-can-i-remove-the-bom-from-a-utf-8-file
	echo ';' >> $@

FWS3000.ink.json: FWS3000.ink

all: FWS3000.zip 

clean:
	-rm FWS3000/FWS3000.js *.zip
