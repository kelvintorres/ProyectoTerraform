# Aqui coloco mi token
do_token = "dop_v1_66e8db20a3b8ea044ab092aad00b6a0c889dad2906254987fbea5f94dadd51e7"
# Aqui coloco la ubicacion del archivo.pub
ssh_pub_path = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPDVFetd4ge71+PbM7pGd08PpdyXsN08MmbafxvW92OYdpDfiHDOfyoveOKtjGiqrbg5x36nNX/xXORJNkzV4NJT0pVua2+Wf81O+ugpUNl/SyY9xSnB4wMPAkKlU4JVyISRvqapKGojiFJqPVpz8VPwqbaNwqehTC/ofHJo89N4QbGq8Ff63ul6iy4OA3FrJuo5zzP1j/+3qr1y1A1RRMvLkTJMUjAPtjrwYZC4MB74kDA9pyqkxWZ0wlKUZjmJo5Ll/ZUcPK4EibkQQGjdmKG/fa/BTW58xBFTvivzf6FiI1iSXoXv9i2MlYiLedxRtulUW1xN6vX7ix6AmSl6upF8fv2E74aLzpQhAEaQPRrleWmdMiOabPX8T6QBZ1uk0IMlOaU/eIGcgHfllPU+61Jn7L5cczbY7o43rGjG6lOl/nsf114UWXjVF6kN79oOkyQnhIRj4tDf5vUwjR1EB5i943l3Yg8ui+3eL2buRIEkM9pVwXQg48qegLRHfrmL0= root@proyectoterra2-docker"
#Región de despliegue
region = "fra1"
# Nombre del proyecto
project_name = "proyectojenkins"
# Usuario de docker
docker_user = "kelvin"
#Aqui defino la ruta del dispositivo del volumen
device_path = "/dev/disk/by-id/scsi-0DO_Volume_docker-demo-docker-volume"
# Aqui defino la ruta del montaje del volumen
mount_path   = "/var/lib/docker"
#Aqui defino el tamaño del drolplet
droplet_size = "s-4vcpu-8gb"

