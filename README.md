# AccuFunk
Maven pom example for setting up Accumulo functional testing

# Usage
Since a pom can not import a pom, feel free to copy this into your own project.
The pom includes three profiles: download, start, and stop. Unless changed in the
properties, the profiles will use `target/integration` as their working directory.

# Download
The download profile will download the Zookeeper, Hadoop, and Accumulo tarballs
from the locations specified in the properties. Next it will unpackage them and
overlay the configuration files in `src/test/resources/integration`.

# Start
The start profile will clean up any previous instances of Zookeeper, Hadoop, and
Accumulo, then start these services. When completed, it will print the process
information to confirm that they are running. Services can be restarted for testing
if the mvn clean target has not been run.

# Stop
The stop profile will kill all of the running processes

# Example Usage

    mvn clean verify -Pdownload,start,functional-tests,stop

