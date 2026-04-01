# azure-automation-clinical-lab
Automated Azure infrastructure deployment for a clinical environment using Bicep, with built-in security, RBAC, and compliance controls (HIPAA/NIST).

# Azure Automation & Optimization Lab

## Overview
This project demonstrates how to automate the deployment and security of Azure infrastructure for a clinical-style environment using Infrastructure as Code (IaC). The goal is to reduce manual provisioning time while enforcing consistent security and compliance controls aligned with HIPAA/PHI and NIST standards.



## Problem
Provisioning Azure infrastructure for clinical workloads across multiple environments is often manual, time-consuming, and inconsistent. This leads to delays in deployment and gaps in enforcing security and compliance controls.



## Solution
- Automated infrastructure deployment using Bicep and Azure CLI
- Provisioned:
  - Virtual Machines (VMs)
  - Virtual Networks (VNets) and Network Security Groups (NSGs)
  - Azure Blob Storage
- Implemented:
  - Microsoft Entra ID RBAC for role-based access
  - TLS encryption in transit and encryption at rest
  - Microsoft Purview for data classification and governance
  - Azure Policy for compliance enforcement



## Challenges
- Designing reusable templates for multiple environments and roles  
- Preventing over-permissioning while maintaining usability  
- Enforcing compliance controls without slowing deployment  
- Balancing cost optimization with scalability  



## Results
- Reduced deployment time from ~2 hours to under 10 minutes
- Achieved 100% enforcement of encryption and data classification policies
- Improved consistency and security posture across all environments  



## Technologies Used
- Microsoft Azure  
- Bicep (Infrastructure as Code)  
- Azure CLI  
- Microsoft Entra ID  
- Microsoft Purview  
- Azure Policy  



##  Project Structure

    /bicep
      main.bicep
      network.bicep
      vm.bicep
      storage.bicep

    /scripts
      deploy.ps1

    /docs
      architecture-diagram.png


## Key Takeaways
- Automated deployments reduce human error and increase consistency  
- Policy-driven governance ensures compliance at scale  
- Secure defaults are critical when handling sensitive healthcare data  
