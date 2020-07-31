pipeline {
	agent any

	stages{
		stage ('build'){
			steps {
				sh 'pip install -r requirements.txt'
		    }
		}
		stage ('test'){
			steps {
				sh 'behave -f allure_behave.formatter:AllureFormatter -o allure-results ./features'
			}
		}
	}
}