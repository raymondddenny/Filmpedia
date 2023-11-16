FLUTTER_CMD := flutter
DART_CMD := dart

.PHONY: all
all: build

.PHONY: build
build:
	$(FLUTTER_CMD) build

.PHONY: run
run:
	$(FLUTTER_CMD) run

.PHONY: test
test:
	$(FLUTTER_CMD) test

.PHONY: coverage
coverage:
	$(FLUTTER_CMD) test --coverage
	$(DART_CMD) tool run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --packages=.packages --report-on=lib

.PHONY: pub-get
pub-get:
	$(FLUTTER_CMD) pub get

.PHONY: build-runner
build-runner:
	$(DART_CMD) run build_runner watch -d

.PHONY: clean
clean:
	$(FLUTTER_CMD) clean
	rm -rf coverage/

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make build        - Build the Flutter project."
	@echo "  make run          - Run the Flutter project."
	@echo "  make test         - Run tests."
	@echo "  make coverage     - Generate test coverage."
	@echo "  make pub-get      - Run 'flutter pub get'."
	@echo "  make build-runner - Run 'flutter pub run build_runner build --delete-conflicting-outputs'."
	@echo "  make clean        - Clean the Flutter project."
