END {
      if (length($0) > 0)
        print "One for " $0 ", one for me." > "/dev/stderr"
      else 
        print "One for " "you" ", one for me." > "/dev/stderr"
}
