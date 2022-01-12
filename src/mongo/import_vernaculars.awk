{
  # Remove the beginning def until array vernacularNames
  gsub(/^.*"vernacularNames":/, "")

  # Remove end of file
  gsub(/]},.*$/, "]")
  print;
}
