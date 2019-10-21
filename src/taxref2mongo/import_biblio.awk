{
  # Remove the beginning def until array bibliography
  gsub(/^.*"bibliography":/, "")

  # Remove end of file
  gsub(/]},.*$/, "]")
  print;
}
