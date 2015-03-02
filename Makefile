CABAL = ".cabal-sandbox/bin/cabal"
CABAL_OPTS = "--require-sandbox"
CABAL_CONSTRAINT := $(shell cabal info . | tr '\n' ' ' | sed -E 's/.*(cabal-install\s*==\s*[0-9.]*).*/\1/')

all:
	#$(CABAL) $(CABAL_OPTS) install --reinstall '$(CABAL_CONSTRAINT)'
	#$(CABAL) $(CABAL_OPTS) configure
	$(CABAL) $(CABAL_OPTS) install --only-dependencies
	$(CABAL) $(CABAL_OPTS) build
	$(CABAL) $(CABAL_OPTS) install

cabal:
	cabal $(CABAL_OPTS) install '$(CABAL_CONSTRAINT)'

clean:
	rm -rf .cabal-sandbox cabal.sandbox.config dist