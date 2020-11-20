# iostat-tool Docker environment
This documentation provides a guideline how to use the iostat-tool in a Docker container.

#### Build Docker container
It's just a one liner to create the Docker image:

`docker build --no-cache --force-rm --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t iostat-tool:latest -f Dockerfile .`

#### Use prebuild container from Docker-Hub
There also exists a prebuild Docker container which can be pulled with

`docker pull d4nji/iostat-tool:latest`

The internal user is called **cli** and has the UID 1024. If you use this container please make sure to either run with the same UID or root by using `docker run -u root`.
Another possible way is to change `out`-folder permission to be writable by anyone (`chmod -R a+w out`).

#### Run Docker container
After you build the container you can just execute the container to see the command information:

`docker run -it iostat-tool:latest`

Please see a more advanced real life example shown here:

`docker run -it -v $PWD/out:/home/cli/out iostat-tool:latest --disks sda --iostat-date-format '%d.%m.%Y %H:%M:%S' --iostat-date-pattern '(?P<date>^\d{2}.\d{2}.\d{4}\s*\d{2}:\d{2}:\d{2}\s*)' --data /home/cli/out/iostat.log --fig-output /home/cli/out/iostat.png plot --subplots io_rqm iops io_transfer %util areq-sz aqu-sz await`

This will mount the folder `out` to `/home/cli/out` in the container which contains an `iostat.log` file.
Additionally, we use the **--disks** to select `sda` for extraction. As the date in the `iostat.log` has another format we change it with **--iostat-date-format**
and **--iostat-date-pattern** to suit our needs. Now we point to the `iostat.log` location with **--data** and use **--fig-output** and point to the mounted `out` folder so we can
read the graphed result on the host machine afterwards. In the end we choose **plot** for graphing and **--subplots** for a selection of the data we want to visualize.
