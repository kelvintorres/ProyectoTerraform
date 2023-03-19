variable "do_token" {}
variable "ssh_pub_path"{}
variable "region" {}
variable "project_name" {}
variable "docker_user" {}
variable "device_path" {}
variable "mount_path" {}
variable "droplet_size" {}

provider "digitalocean" {
    token = var.do_token
}

# Create a new SSH key
resource "digitalocean_ssh_key" "docker-ssh" {
    name       = "${var.project_name}-key"
    public_key = file(var.ssh_pub_path)
}


resource "digitalocean_volume" "docker" {
    region                  = var.region
    name                    = "${var.project_name}-docker-volume"
    size                    = 80
    initial_filesystem_type = "ext4"
    description             = "${var.project_name} docker volume description"
}

data "template_file" "userdata" {
    template = file("${path.module}/userdata.sh")
    vars = {
        DOCKER_USER = var.docker_user,
        device_path= "/dev/disk/by-id/scsi-0DO_Volume_${digitalocean_volume.docker.name}",
        mount_path= var.mount_path
    }
}

resource "digitalocean_droplet" "docker" {
    name  = "${var.project_name}-docker"
    image = "ubuntu-20-04-x64"
    region = var.region
    size   = var.droplet_size
    backups = true
    user_data = data.template_file.userdata.rendered
    #ssh_keys = [digitalocean_ssh_key.docker-ssh.fingerprint]
    
    
    ssh_keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPDVFetd4ge71+PbM7pGd08PpdyXsN08MmbafxvW92OYdpDfiHDOfyoveOKtjGiqrbg5x36nNX/xXORJNkzV4NJT0pVua2+Wf81O+ugpUNl/SyY9xSnB4wMPAkKlU4JVyISRvqapKGojiFJqPVpz8VPwqbaNwqehTC/ofHJo89N4QbGq8Ff63ul6iy4OA3FrJuo5zzP1j/+3qr1y1A1RRMvLkTJMUjAPtjrwYZC4MB74kDA9pyqkxWZ0wlKUZjmJo5Ll/ZUcPK4EibkQQGjdmKG/fa/BTW58xBFTvivzf6FiI1iSXoXv9i2MlYiLedxRtulUW1xN6vX7ix6AmSl6upF8fv2E74aLzpQhAEaQPRrleWmdMiOabPX8T6QBZ1uk0IMlOaU/eIGcgHfllPU+61Jn7L5cczbY7o43rGjG6lOl/nsf114UWXjVF6kN79oOkyQnhIRj4tDf5vUwjR1EB5i943l3Yg8ui+3eL2buRIEkM9pVwXQg48qegLRHfrmL0= root@proyectoterra2-docker"
  ]
}



resource "digitalocean_volume_attachment" "docker" {
    droplet_id = digitalocean_droplet.docker.id
    volume_id  = digitalocean_volume.docker.id
}

data "digitalocean_images" "available" {
    filter {
        key    = "distribution"
        values = ["Ubuntu"]
    }
    filter {
        key    = "regions"
        values = [var.region]
    }
    sort {
        key       = "created"
        direction = "desc"
    }
}

output "docker-vps-data"{
    value = {
        ip = digitalocean_droplet.docker.ipv4_address,
        machine_template = digitalocean_droplet.docker.size
        vps_disk = digitalocean_droplet.docker.disk
        volume_disk = digitalocean_volume.docker.size,
        ssh_line =  "ssh -l root ${digitalocean_droplet.docker.ipv4_address}",
        //ubuntu_images = data.digitalocean_images.available.images
    }
}


 
