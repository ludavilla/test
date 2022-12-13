pipeline{
    agent any

    stages{
        //Clone git
        stage("Preparando deploy"){
            steps{
                sh 'rm -rf $PWD/test'
                sh 'git clone -b main git@github.com:ludavilla/test.git'
            }
        }
        //Preparando ambiente para deploy
        stage("subindo container"){
            steps{
                sh 'docker run -dit --restart always -w /app -v $PMD/test:/app --name=test node:16.13.2'
            }
        }
        //criando direório para envio dos arquivos para o github
        stage("Criando build"){
            steps{
                sh 'docker exec mvn -B -DskipTests clean package'
                               
                
            }
        }
    }
}
