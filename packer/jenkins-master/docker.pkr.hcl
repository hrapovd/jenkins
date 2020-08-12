source "docker" "jenkins_master" {
  image = "centos:7"
  commit = true
}

build {
  name = "jenkins-master"
  source "docker.jenkins_master" {}

  provisioner "file"{
    source = "basic-security.groovy"
    destination = "/tmp/basic-security.groovy"
  }
  provisioner "file"{
    source = "./disable-cli.groovy"
    destination = "/tmp/disable-cli.groovy"
  }
  provisioner "file"{
    source = "./csrf-protection.groovy"
    destination = "/tmp/csrf-protection.groovy"
  }
  provisioner "file"{
    source = "./disable-jnlp.groovy"
    destination = "/tmp/disable-jnlp.groovy"
  }
  provisioner "file"{
    source = "./jenkins"
    destination = "/tmp/jenkins"
  }
  provisioner "file"{
    source = "./plugins.txt"
    destination = "/tmp/plugins.txt"
  }
  provisioner "file"{
    source = "./install-plugins.sh"
    destination = "/tmp/install-plugins.sh"
  }
  provisioner "shell"{
    script = "./setup.sh"
    execute_command = "sh '{{ .Path }}'"
  }
}