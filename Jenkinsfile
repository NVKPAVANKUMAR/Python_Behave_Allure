pipeline {
	agent any

	stages{
		stage ('build'){
			steps {
				bat 'pip install -r requirements.txt'
		    }
		}
		stage ('test'){
			steps {
				bat 'behave -f allure_behave.formatter:AllureFormatter -o allure-results ./features'
			}
		}
	}
}