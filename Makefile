.PHONY: gen/l10n
gen/l10n:
	flutter gen-l10n

.PHONY: dart/lint
dart/lint:
	dart fix --apply
