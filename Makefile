.PHONY: deploy
deploy: profile
	zola build
	@echo "====> deploying to github"
	git worktree add /tmp/profile gh-pages
	rm -rf /tmp/profile/*
	cp -rp public/* /tmp/profile/
	cd /tmp/profile && \
		git checkout -- CNAME &&\
		git add -A && \
		git commit -m "deployed on $(shell date) by ${USER}" && \
		git push origin gh-pages