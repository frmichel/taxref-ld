{
  # Add a CR between each entry
  gsub(/,{"taxrefId":/, ",\n\n{\"taxrefId\":");

  # Remove the beginning def
  gsub(/^\{"_embedded":\{"externalDb":/, "")

  # Remove end of file
  gsub(/]},.*$/, "]")
  print;
}
