# iostat-tool Docker environment
This documentation provides a guideline how to use iostat-tool in a Docker container.

#### Build Docker container
It's just a one liner to create the Docker image:

`docker build --no-cache --force-rm --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t iostat-tool:latest -f Dockerfile .`

#### Run Docker container
After you build the container you can just execute the container to see the command information:

`docker run -it iostat-tool:latest`

Please see a more advanced real life example shown here:

`docker run -it -v $PWD/out:/home/tool/out iostat-tool:latest --disks sda --iostat-date-format '%d.%m.%Y %H:%M:%S' --iostat-date-pattern '(?P<date>^\d{2}.\d{2}.\d{4}\s*\d{2}:\d{2}:\d{2}\s*)' --data /home/tool/out/iostat.log --fig-output /home/tool/out/iostat.png plot --subplots io_rqm iops io_transfer %util areq-sz aqu-sz await`

This will mount the folder `out` to `/home/tool/out` in the container which contains an `iostat.log` file.
Additionally we use the **--disks** to select `sda` for extraction. As the date in the `iostat.log` has another format we change it with **--iostat-date-format**
and **--iostat-date-pattern** to suit our needs. Now we point to the `iostat.log` location with **--data** and use **--fig-output** and point to the mounted `out` folder so we can
read the graphed result on the host machine afterwards. In the end we choose **plot** for graphing and **--subplots** for a selection of the data we want to visualize.
