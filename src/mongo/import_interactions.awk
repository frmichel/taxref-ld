{
  # Add a CR between each taxon
  gsub(/{"taxon":/, "\n\n{\"taxon\":");

  # Remove the beginning def until array interactions
  gsub(/^.*"interactions":/, "")

  # Remove end of file
  gsub(/]},.*$/, "]")
  print;
}
