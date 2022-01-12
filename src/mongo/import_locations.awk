{
  # Remove the beginning def until array location
  gsub(/^.*"location":/, "")

  # Remove end of file
  gsub(/]},.*$/, "]")
  print;
}
