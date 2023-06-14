# SuperUser Mode

In order to run this in a container open the terminal in the required directory and then build the container image

```bash
docker build -t task2 .
# Exposing the container port 8080
docker run -i -p 8080:8080 task2
```

### 
- [X] Create the script such that a student and a warden should be able to run it
- [X] When Student Runs it it sends a request by appending info into a txt file in the wardens directory
- [X] When warden runs the script it will go through the txt file and can approve different signouts.
- [X] If approves then send a txt file to the student that they cant go else send a txt file saying the they can go
- [X] If approved write a script that runs based on the return date of the student that checks if the student is back by then
- [X] Dockerized all the scripts
