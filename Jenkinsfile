node {
    def mvnHome = tool 'maven'
    def targetName = "chadAWS"
    
    env.PATH = "${mvnHome}/bin:${env.PATH}"
    
    stage('check version'){
        sh 'mvn --version'
        sh 'java -version'
    }
    stage('check out version'){
        git url: 'https://github.com/doublechad/spring-boot-test.git',branch: 'master'
    }
    stage('build'){
        sh 'mvn clean package'
    }
    stage('deploy'){
        script {
            sshPublisher(
                continueOnError: false, failOnError: true,
                publishers:[
                    sshPublisherDesc(
                        configName: "${targetName}", 
                        transfers: [
                            sshTransfer(
                                cleanRemote: false, 
                                excludes: '', 
                                execCommand: 'sh ~/upload/deploy.sh', 
                                execTimeout: 120000, 
                                flatten: false, 
                                makeEmptyDirs: false, 
                                noDefaultExcludes: false, 
                                patternSeparator: '[, ]+', 
                                remoteDirectory: '/upload', 
                                remoteDirectorySDF: false, 
                                removePrefix: 'target', 
                                sourceFiles: 'target/*.war'
                                )
                            ], 
                        usePromotionTimestamp: false, 
                        useWorkspaceInPromotion: false, 
                        verbose: false
                    )
                ]
            )
        }
    }
}
