{
  # Remove the beginning def until array
  gsub(/^.*"status":/, "")

  # Remove end of file
  gsub(/]},.*$/, "]")
  print;
}
