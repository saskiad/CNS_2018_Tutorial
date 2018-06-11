Build the Image
===============
1. make sure msdk/anaconda3 image is installed on docker
```bash
  $ docker images
```
If it is not installed go to ../anaconda3_base and follow instructions there.

2. Run the following command
```bash
  $ docker build -t msdk/jupyter .
```


Start Jupyter Hub
=================
```bash
  $ mkdir saved
  $ docker run -v $(pwd)/saved:/home/user/workdir/saved -p 8000:8000 msdk/jupyter
```
Open a browser and go to http:127.0.0.1:8000

**NOTE**: When a docker image is done all changes, including new notebooks saved inside the image, will be deleted. The -v argument overcomes this by created a shared directory between the container and the host, so it is important to place the files within this directory. You can specify a different location by replacing $(pwd)/saved with /path/to/saved/directory.


User: user  
Password: user