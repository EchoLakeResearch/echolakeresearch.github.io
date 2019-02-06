# Find all markdown files
MARKDOWN=$(shell find ./ -iname "*.md")
# Form all 'html' counterparts
HTML=$(MARKDOWN:.md=.html)

.PHONY = all tar clean
all: $(HTML)

%.html: %.md

		pandoc -s -S --template=_template.txt --from markdown --to html  $< -o $@

clean:
		$(shell find . -name "*.html" -type f -delete)
