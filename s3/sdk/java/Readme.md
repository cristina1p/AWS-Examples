
# Create a new Maven project
# Initial Java S3 project structure

``
mvn archetype:generate \
  -DgroupId=com.example.aws \
  -DartifactId=s3-java-example \
  -DarchetypeArtifactId=maven-archetype-quickstart \
  -DinteractiveMode=false

  ``

``
mvn -B archetype:generate \
  -DarchetypeGroupId=org.apache.maven.archetypes \
  -DgroupId=org.example.basicapp \
  -DartifactId=myapp

  ``

