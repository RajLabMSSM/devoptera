add_sudo <- function(sudo,
                     pass = Sys.getenv("PASS")){
  if(sudo) paste("echo",pass,"|","sudo -S") else ""
}