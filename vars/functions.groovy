def cloneRepo() {
    stage("clone repo") {
        when {
            expression { return enable || disable }
        }
        steps {
            git 'https://github.com/vishal-cpu/spring3hibernate.git'
        }
    }
}

def codeStability() {
    stage("code stability") {
        sh 'mvn package'
    }
}

def codeQuality() {
    stage("code quality") {
        sh 'mvn checkstyle:checkstyle'
    }
}

def codeCoverage() {
    stage("code coverage") {
        sh 'mvn cobertura:cobertura'
    }
}
