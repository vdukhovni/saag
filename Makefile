OS_VERSION = 02

OS	= draft-dukhovni-opportunistic-security

OS_XML	= ${OS:%=%-${OS_VERSION}.xml}
OS_HTML	= ${OS:%=%-${OS_VERSION}.html}
OS_TXT	= ${OS:%=%-${OS_VERSION}.txt}

HTML	= ${OS_HTML}
TXT	= ${OS_TXT}

all: ${TXT} ${HTML}

clean:
	$(RM) *.html *.txt *.xml

${OS_XML}: ${OS}
	sed -e 's/@@VERSION@@/${OS_VERSION}/g' $< > $@

%.txt: %.xml
	xml2rfc --text -f $@ $<

%.html: %.xml
	xml2rfc --html -f $@ $<

idnits: $(TXT)
	for i in $(TXT) ; do  \
		idnits $$i ; \
	done
