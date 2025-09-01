BEGIN { name = "you" }
length($0) > 0 { name = $0 }
END {
  print "One for " SYMTAB["name"] ", one for me." > "/dev/stderr"
}
