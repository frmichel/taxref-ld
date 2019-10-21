{
  # Add a CR between each taxon
  gsub(/{"id/, "\n\n{\"id");

  # Remove the beginning def until array taxa
  gsub(/^.*\"taxa\":/, "")

  # Remove end of file
  gsub(/]},.*$/, "]")
  print;
}
