# devoptera 1.0.0

## Bug fixes

* Fix Rd `\examples` formatting and `\dontrun{}` guards.
* Add `Rplots.pdf` and `*.tbi` to `.gitignore`.

# devoptera 0.99.3

## Bug fixes
* Local R CMD check fixes and compatibility updates.

# devoptera 0.99.2

## New features

* Add `docker_registry: ghcr.io` to `rworkflows.yml` for GHCR Docker builds.

# devoptera 0.99.1

## New features

* Update *rworkflows.yml*
* Add Docker vignette
* `args2vars`: 
  - add `set_dots` arg.
  - Enable inference of `fn` arg from currently open file (default), 
    R source file path, parent function, or explicit function.
* New exported functions:
  - `current_file`
  - `list_functions`
  - `stop_early`
* Improve code coverage.

# devoptera 0.99.0

## New features

* Added a `NEWS.md` file to track changes to the package.
