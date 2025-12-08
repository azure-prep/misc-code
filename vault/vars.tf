variable "token" {}
variable "secret" {
  default = {
    roboshop-infra = {
    },
    roboshop-dev = {

    }
  }
}

variable "values" {
  default = {
    ssh = {
      secret="roboshop-infra"
      values={
        ssh_user="azuser"
        ssh_password="DevOps@123"
      }
    },
    cart = {
      secret="roboshop-dev"
      values={
        REDIS_HOST="redis-dev.azdevopsb1.online"
        CATALOGUE_HOST="catalogue-dev.azdevopsb1.online"
        CATALOGUE_PORT="8080"
      }
    },
    catalogue = {
      secret="roboshop-dev"
      values={
        MONGO=true
        MONGO_URL="mongodb://mongodb-dev.azdevopsb1.online:27017/catalogue"
      }
    }

  }
}