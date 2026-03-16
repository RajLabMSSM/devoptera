# Set owner with `chown`

Set owner with `chown`

## Usage

``` r
set_chown(
  path,
  whoami = "admin",
  sudo = FALSE,
  pass = Sys.getenv("PASS"),
  verbose = TRUE
)
```

## Arguments

- path:

  Path to file/folder.

- whoami:

  Admin username.

- sudo:

  Whether to run commands in `sudo` mode.

- pass:

  Admin password.

- verbose:

  Print messages.

## Value

Null
