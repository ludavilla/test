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
        
        
        stage("Criando build"){
            steps{
                //sh 'sudo docker exec test mkdir /app'
                sh 'sudo docker build -t test .'
                //sh 'sudo docker run -dit --name test test mvn -f /app/pom.xml clean install -Dmaven.test.skip=true'        
            }
        }
        
        //Preparando ambiente para deploy
        stage("subindo container"){
            steps{
                sh 'sudo docker run -dit -w /app -v $PMD/test:/app --name=test test'
            }
        }
    }
}
