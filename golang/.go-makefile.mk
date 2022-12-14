#This file is a template for the makefile that should live in each golang project repository

# Define where your included makefile lives
GITURL = github.com/bigbird023/github-cicd
GITPROJECT = github-cicd
GITFILE = .go-project.mk

# Override your docker tag here, otherwise it'll use your PWD
# DOCKER_TAG = everything-is-awesome

MAIN_FILE="cmd/main.go"  #update to location of entry point into golang
-include $(shell test -f .go-project.mk || git archive --remote=ssh://git@$(GITURL) HEAD:$(GITPROJECT) $(GITFILE) | tar -x ; echo .go-project.mk)