pipeline {
    agent any

    environment {
        AWS_REGION = 'eu-north-1'
        S3_BUCKET = 'my-site-192026 '
    }

    stages {
        stage('Check Files') {
            steps {
                sh '''
                echo "Checking website files..."
                ls -l

                test -f index.html
                test -f style.css

                echo "Required files found."
                '''
            }
        }

        stage('Deploy to S3') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'aws-s3-creds',
                        usernameVariable: 'AWS_ACCESS_KEY_ID',
                        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                    )
                ]) {
                    sh '''
                    echo "Deploying website to S3..."

                    aws configure set region $AWS_REGION

                    aws s3 sync . s3://$S3_BUCKET \
                      --exclude ".git/*" \
                      --exclude "Jenkinsfile" \
                      --delete

                    echo "Deployment completed."
                    '''
                }
            }
        }
    }
}