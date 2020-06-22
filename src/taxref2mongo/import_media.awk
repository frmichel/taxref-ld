{
  # Remove the beginning def until array bibliography
  gsub(/^.*"media":/, "")

  # Remove end of file
  gsub(/]},.*$/, "]")
  print;
}
