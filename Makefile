IMAGEDIR := images
CONTEXT := dockerfiles
SOURCES := firefox
DOCKERFILES := $(addprefix CONTEXT, SOURCES)

.PHONY: all clean build images

all: clean build 

clean:
	rm -f $(IMAGEDIR)/*.tar.gz

build:
	$(foreach SOURCE, $(SOURCES), docker build -t $(SOURCE) -f $(CONTEXT)/$(SOURCE).dockerfile $(CONTEXT);)

images:
	mkdir -p $(IMAGEDIR)
	$(foreach SOURCE, $(SOURCES), docker save $(SOURCE) | gzip > $(IMAGEDIR)/$(SOURCE).tar.gz;)

