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

## Using The fly CLI

The first step before using Concourse is to login using the fly CLI.
```
fly --target my-concourse login --team-name main \
    --concourse-url http://localhost:8080
```
This will take you to the login page of your installation. By default, you can login with the username `test` and password `test`. You should now be logged in and seeing 'no pipeline set' printed on the screen.

## Creating and Deleting Pipelines

To add a pipeline to Concourse we need to run the `set-pipeline` command (shorthand `sp`) and provide it three things, the target (required for most commands), the pipeline configuration file and a name for the pipeline.

For example, we can set our hello world pipeline (found in `sample-pipelines/hello-world-no-task-file`) with the following command 
```
cd sample-pipelines/hello-world-no-task-file
fly -t my-concourse set-pipeline -c pipeline.yml -p hello-world
```
This will show you the changes to the config (in this case all green as the pipeline config is new) that you will have to confirm. After that you should be able to see the pipeline in the UI!

All new pipelines start paused, so just click the small play button on the pipeline to start it. Then click on the `hello-world` text, and it should take you inside the pipeline, where you will see one resource and one `say-hello` job.

The job should start automatically in a few moments as it is triggered automatically by the `timer` resource. You can click on the job to see the output of previous jobs or start new ones.

You can now repeat the `set-pipeline`(sp) command with the two other example pipelines in this repo, or even try it on your own pipelines! 

You can also update your pipelines by simply running the `set-pipeline` command again with the exact same parameters as before. Concourse will detect the changes and show you the diff before updating the actualy pipeline.

To remove a pipeline simply run the `destroy-pipeline`(dp) command and give it the target and name of the pipeline you want to delete `fly -t my-concourse dp -p hello-world`.

## References

Amazing tutorials and examples for Concourse can be found at: https://concoursetutorial.com/<br>
While the official website and docs can be found at: https://concourse-ci.org/
