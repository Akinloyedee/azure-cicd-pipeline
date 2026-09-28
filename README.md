# Azure CI/CD Pipeline with Docker and Azure

## Project Overview

This project demonstrates the implementation of an automated CI/CD pipeline using **Azure DevOps**, **Docker**, **Azure Container Registry (ACR)** and **Azure App Service**.

The pipeline automates the process of building a Docker image, pushing it to Azure Container Registry and deploying the application to Azure App Service whenever changes are pushed to the `main` branch of the GitHub repository.

The project uses a simple Nginx web server to demonstrate the deployment workflow.

## Live Application

**Try the deployed application here:**

[**View Live Website**] https://deesaxdockeracr-f7dwdjaygzcgevbn.westus3-01.azurewebsites.net/

## Technologies Used

* **Azure DevOps:** For creating and managing the CI/CD pipeline.
* **Azure Pipelines:** For automating the build and deployment process.
* **Docker:** For containerizing the Nginx web server.
* **Azure Container Registry (ACR):** For storing Docker images.
* **Azure App Service:** For hosting and running the containerized application.
* **GitHub:** For source code management and triggering pipeline runs.
* **YAML:** For defining the pipeline configuration.
* **Nginx:** As the web server serving the application.

## Architecture and Workflow

The project follows this automated deployment workflow:

1. **Source Code:** The application code and Dockerfile are stored in GitHub.
2. **Continuous Integration:** A push to the `main` branch triggers Azure Pipelines.
3. **Docker Build:** Azure Pipelines builds a Docker image using the project's Dockerfile.
4. **Image Storage:** The generated Docker image is pushed to Azure Container Registry.
5. **Continuous Deployment:** Azure Pipelines deploys the container image to Azure App Service.
6. **Live Application:** The deployed Nginx web server serves the application through a public URL.

### Deployment Flow

`GitHub → Azure Pipelines → Docker Build → Azure Container Registry → Azure App Service → Live Website`

## Project Structure

```text
azure-cicd-pipeline/
├── Dockerfile
├── index.html
├── README.md
└── azure-pipelines.yml
```

* **Dockerfile:** Defines how the Nginx application is packaged into a Docker image.
* **index.html:** Contains the web page served by Nginx.
* **azure-pipelines.yml:** Defines the automated build, image-push and deployment stages.
* **README.md:** Documents the project and its deployment workflow.

## CI/CD Pipeline

The pipeline is configured in `azure-pipelines.yml` and consists of two main tasks:

### 1. Build and Push Docker Image

The `Docker@2` task builds the Docker image from the Dockerfile and pushes it to Azure Container Registry using an Azure DevOps service connection.

The image is tagged as `latest`.

### 2. Deploy to Azure App Service

The `AzureWebAppContainer@1` task deploys the container image from Azure Container Registry to Azure App Service.

This allows the application to be updated automatically when a new pipeline run completes successfully.

## Deployment and Testing

The pipeline was tested by updating the application's HTML content and pushing the changes to GitHub.

The resulting pipeline run successfully built and pushed the Docker image and deployed it to Azure App Service. The updated content was then verified on the live website.

## Key Concepts Learned

* Continuous Integration (CI) and Continuous Deployment (CD)
* YAML-based pipeline configuration
* Automated Docker image building and publishing
* Container image management with Azure Container Registry
* Automated application deployment with Azure App Service
* GitHub-triggered pipeline execution
* Azure DevOps service connections
* Monitoring pipeline execution and verifying deployments

## Challenges Encountered

During the project, an Azure App Service quota restriction initially prevented the creation of the hosting resource in the selected region. The subscription was upgraded to Pay-As-You-Go to proceed with the deployment.

The pipeline was subsequently configured and tested successfully.

## Project Outcome

Successfully implemented and tested an automated CI/CD pipeline that builds a Docker image, pushes it to Azure Container Registry and deploys the application to Azure App Service.

The application is publicly accessible through the live URL above.

## Author

**Akinloye Oluwadara**

[GitHub Profile](https://github.com/Akinloyedee)
