{
  # Remove the beginning def until array
  gsub(/^.*"media":/, "")

  # Remove end of file
  gsub(/]},.*$/, "]")
  print;
}
