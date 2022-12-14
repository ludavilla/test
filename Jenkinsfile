pipeline{
    agent any

    stages{
        //Clone git
        stage("Preparando deploy"){
            steps{
                sh 'rm -rf $PWD/test'
                sh 'sudo docker rm -f test'
                sh 'git clone -b main git@github.com:ludavilla/test.git'
            }
        }
        //Preparando ambiente para deploy
        stage("subindo container"){
            steps{
                sh 'sudo docker run -dit --restart always -w /app -v $PMD/test:/app --name=test maven:3.8.4-openjdk-17-slim'
            }
        }
        //criando direório para envio dos arquivos para o github
        stage("Criando build"){
            steps{
                //sh 'sudo docker exec test mkdir /app'
                sh 'sudo docker cp pom.xml test:/app'
                sh 'sudo docker exec test mvn -f /app/pom.xml clean install -Dmaven.test.skip=true'
                               
                
            }
        }
    }
}
