LILYPOND ?= lilypond
LILYPOND_FLAGS ?=

SOURCES := main.ly $(wildcard scores/*.ly)
FONTS := $(wildcard lilyjazz/otf/*.otf lilyjazz/supplementary-files/*/*.otf)
STYLES := $(wildcard styles/*.ily lilyjazz/stylesheet/*.ily)

.PHONY: realbook check check-lilypond clean
.DELETE_ON_ERROR:

realbook: realbook.pdf

realbook.pdf: $(SOURCES) $(FONTS) $(STYLES) Makefile | check-lilypond
	"$(LILYPOND)" -I lilyjazz/otf $(LILYPOND_FLAGS) -o realbook main.ly

check: check-lilypond
	LILYPOND="$(LILYPOND)" python3 tests/check_build.py

check-lilypond:
	@command -v "$(LILYPOND)" >/dev/null 2>&1 || { \
		printf '%s\n' 'LilyPond 2.26.x is required. Install it or set LILYPOND=/path/to/lilypond. See README.md.'; \
		exit 1; \
	}
	@version="$$("$(LILYPOND)" --version | head -n 1)"; \
	case "$$version" in \
		*" 2.26."*) ;; \
		*) printf '%s\n' "LilyPond 2.26.x is required; found: $$version"; exit 1 ;; \
	esac

clean:
	rm -f realbook.pdf
