# CICD Via Concourse
Created for a lecture given to MSc and third year+ students of the [Software Maintenance and Evolution](https://www.ifi.uzh.ch/en/seal/teaching/courses/sme.html) course taught at the University of Zurich, in the Fall 2019 semester.

## Installing Concourse

You can install Concourse locally using Docker and Docker Compose by running:
```
wget https://concourse-ci.org/docker-compose.yml
sudo docker-compose up -d
```
This will start docker on `http://localhost:8080`.

Once you have Concourse up and running, you will need to install the Concourse `fly CLI`, which is the official CLI tool to use with Concourse. The CLI is also one binary and can be downloaded directly from the Concourse UI.

Simply download the appropriate binary for your operating system and you will be ready to go!

## Using the fly CLI

The first step before using Concourse is to login using the fly CLI.
```
fly --target my-concourse login --team-name my-team \
    --concourse-url http://localhost:8080
```
This will take you to the login page of your installation. By default, you can login with the username `test` and password `test`. You should now be logged in and seeing 'no pipeline set' printed on the screen.

## Creating pipelines



## References

Amazing tutorials and examples for Concourse can be found at: https://concoursetutorial.com/<br>
While the official website and docs can be found at: https://concourse-ci.org/
