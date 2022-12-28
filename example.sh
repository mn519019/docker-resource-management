########## Docker MYSQL Container START ##########
# adminuser@rick-test-machine-0:~$ docker run -d -m 600m --cpuset-cpus 1 --name db --env MYSQL_ROOT_PASSWORD=pass -p 3306:3306 mn519019/mysql 

########## Docker Running Process ##########
# adminuser@rick-test-machine-0:~$ docker ps 
# CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS                                                  NAMES
# cfc4c425064d   mn519019/mysql   "docker-entrypoint.s…"   3 minutes ago   Up 3 minutes   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   db

########## Resource Managmeent for 600m Memory Resource Assinged ##########
# adminuser@rick-test-machine-0:~$ docker stats
# CONTAINER ID   NAME      CPU %     MEM USAGE / LIMIT   MEM %     NET I/O         BLOCK I/O        PIDS
# cfc4c425064d   db        0.44%     377.4MiB / 600MiB   62.89%    1.31kB / 138B   1.11MB / 245MB   38

## It turns out that MYSQL container image requires at least 100 Memory Usage
## What if I give only 100M assigned to run the container 

# adminuser@rick-test-machine-0:~$ docker run -d -m 100m --cpuset-cpus 1 --name db --env MYSQL_ROOT_PASSWORD=pass -p 3306:3306 mn519019/mysql 
# 1d49985f61d61b7f319c652d38731300b5203ed8d3547799e953b7d1e05baf2e

# adminuser@rick-test-machine-0:~$ docker ps -a
# CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS                       PORTS     NAMES
# 1d49985f61d6   mn519019/mysql   "docker-entrypoint.s…"   17 seconds ago   Exited (137) 9 seconds ago             db

# -> The container will be exited since it requires more than 100M to run the container. 