BEGIN {
   # print arguments 
   # for (i = 0; i < ARGC; i++)
   #    print ARGV[i]

   # print matched whole text
   # print $0

   # print first match
   # print $1
}
END {
  if (length($0) > 0)
    name = $0
  else
    name = "you"  
  print "One for " SYMTAB["name"] ", one for me." > "/dev/stderr"

  exit 0
}
