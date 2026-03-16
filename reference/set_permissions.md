# Set permissions

Robust methods for setting file/folder permissions across multiple OS.

## Usage

``` r
set_permissions(
  path,
  is_folder = FALSE,
  permissions = list(Windows = "Everyone:(OI)(CI)RX", Mac = "u=rx,go=rx", Linux =
    "u=rx,go=rx", default = "u=rx,go=rx"),
  whoami = "admin",
  pass = Sys.getenv("PASS"),
  sudo = FALSE,
  verbose = TRUE
)
```

## Arguments

- path:

  Path to file/folder.

- is_folder:

  Whether `path` is a folder. If so, permissions will be set recursively
  for all files/subfolders.

- permissions:

  Scope of permissions to set for each OS type. "default" is only used
  when the OS type is not Windows, Mac, or Linux.

- whoami:

  Admin username.

- pass:

  Admin password.

- sudo:

  Whether to run commands in `sudo` mode.

- verbose:

  Print messages.

## Examples

``` r
f <- tempfile()
writeLines(text = letters, con = f)
set_permissions(f)
#> Setting permissions for file.
#> Setting owner with chown.
```
