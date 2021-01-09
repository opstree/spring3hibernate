def cloneRepo() {
    stage("clone repo") {
        git 'https://github.com/vishal-cpu/spring3hibernate.git'
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

def codeCoverageReport() {
    stage('code coverage report') {
        cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: '**/target/site/cobertura/coverage.xml', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false
    }
}
