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
      secret = "roboshop-infra"
      values = {
        ssh_user     = "azuser"
        ssh_password = "DevOps@123"
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
        MONGO="true"
        MONGO_URL="mongodb://mongodb-dev.azdevopsb1.online:27017/catalogue"
        DB_TYPE = "mongo"
        DB_HOST = "mongodb-dev.azdevopsb1.online"
        SCHEMA_FILE = "db/master-data.js"
        APP_GIT_URL = "https://github.com/roboshop-devops-project-v3/catalogue"
      }
    },
    frontend = {
      secret = "roboshop-dev"
      values = {
        catalogue_url = "http://catalogue-dev.azdevopsb1.online:8080/"
        user_url      = "http://user-dev.azdevopsb1.online:8080/"
        cart_url      = "http://cart-dev.azdevopsb1.online:8080/"
        payment_url   = "http://payment-dev.azdevopsb1.online:8080/"
        shipping_url  = "http://shipping-dev.azdevopsb1.online:8080/"
        CATALOGUE_HOST = "catalogue-dev.azdevopsb1.online"
        CATALOGUE_PORT = "8080"
        USER_HOST = "user-dev.azdevopsb1.online"
        USER_PORT = "8080"
        CART_HOST = "cart-dev.azdevopsb1.online"
        CART_PORT = "8080"
        SHIPPING_HOST = "shipping-dev.azdevopsb1.online"
        SHIPPING_PORT = "8080"
        PAYMENT_HOST  = "payment-dev.azdevopsb1.online"
        PAYMENT_PORT  = "8080"
      }
    },
    payment = {
      secret="roboshop-dev"
      values={
        CART_HOST="cart-dev.azdevopsb1.online"
        CART_PORT="8080"
        USER_HOST="user-dev.azdevopsb1.online"
        USER_PORT="8080"
        AMQP_HOST="rabbitmq-dev.azdevopsb1.online"
        AMQP_USER="roboshop"
        AMQP_PASS="roboshop123"
      }
    },
    shipping = {
      secret="roboshop-dev"
      values={
      CART_ENDPOINT="cart-dev.azdevopsb1.online:8080"
      DB_HOST="mysql-dev.azdevopsb1.online"
        DB_TYPE = "mysql"
        APP_GIT_URL = "https://github.com/roboshop-devops-project-v3/shipping"
        DB_USER = "root"
        DB_PASS = "RoboShop@1"
    }
    },
    user = {
      secret = "roboshop-dev"
      values = {
        MONGO     = "true"
        REDIS_URL = "redis://redis-dev.azdevopsb1.online:6379"
        MONGO_URL = "mongodb://mongodb-dev.azdevopsb1.online:27017/users"
      }
    },
    mysql = {
      secret = "roboshop-dev"
      values = {
        USER     = "root"
        PASSWORD = "RoboShop@1"
      }
    }
  }
}