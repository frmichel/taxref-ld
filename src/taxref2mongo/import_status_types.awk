{
  # Remove the beginning def until array statusTypes
  gsub(/^.*"statusTypes":/, "")

  # Remove end of file
  gsub(/]},.*$/, "]")
  print;
}
