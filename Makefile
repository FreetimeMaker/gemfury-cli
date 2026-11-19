.DEFAULT_GOAL := install
.PHONY: install uninstall deb rpm install-deps deb-deps rpm-deps

package = fury-cli_1.0.0_amd64
SKIP_DEPS ?= 0
SUDO ?= $(shell if [ "$$(id -u)" -ne 0 ]; then printf sudo; fi)

# Use distribution packages for the prebuilt Linux binary.
define install_dependencies
	@if [ "$(SKIP_DEPS)" = "1" ]; then \
		echo "Skipping dependency installation (SKIP_DEPS=1)."; \
	elif command -v apt-get >/dev/null 2>&1; then \
		$(SUDO) apt-get update && $(SUDO) apt-get install -y $(1); \
	elif command -v dnf >/dev/null 2>&1; then \
		$(SUDO) dnf install -y $(2); \
	else \
		echo "No supported package manager found (apt-get or dnf). Install dependencies manually and use SKIP_DEPS=1." >&2; \
		exit 1; \
	fi
endef

install-deps:
	$(call install_dependencies,ca-certificates libc6,ca-certificates glibc)

deb-deps:
	$(call install_dependencies,dpkg-dev file,dpkg file)

rpm-deps:
	$(call install_dependencies,rpm file,rpm-build file)

install: install-deps
	test -f fury
	mkdir -p /usr/local/bin
	cp fury /usr/local/bin/fury
	chmod +x /usr/local/bin/fury

uninstall:
	rm /usr/local/bin/fury

deb: deb-deps
	file -b fury | grep -q '^ELF 64-bit LSB .*x86-64'
	mkdir -p $(package)/usr/local/bin/
	cp fury $(package)/usr/local/bin/fury
	chmod +x $(package)/usr/local/bin/fury
	dpkg-deb --build --root-owner-group $(package)

rpm: rpm-deps
	file -b fury | grep -q '^ELF 64-bit LSB .*x86-64'
	mkdir -p rpmbuild/BUILD rpmbuild/RPMS rpmbuild/SOURCES rpmbuild/SPECS rpmbuild/SRPMS
	cp fury rpmbuild/SOURCES/
	cp fury-cli.spec rpmbuild/SPECS/
	rpmbuild -bb --target x86_64 --define "_topdir $(CURDIR)/rpmbuild" rpmbuild/SPECS/fury-cli.spec
	cp rpmbuild/RPMS/x86_64/*.rpm .
	rm -rf rpmbuild

GIT_DESCRIBE = $$(git describe --tags --always --match 'v*' | sed 's/^v//')
GOLDFLAGS = -X main.Version=$(GIT_DESCRIBE)
GO_CMD ?= go

fury:
	$(GO_CMD) build -ldflags "$(GOLDFLAGS)" -o ./fury ./cmd/fury
