
  # Azure Automation Clinical Lab

## Description
This project demonstrates a secure Azure cloud environment for a clinical research organization, with identity, access, and data governance controls for sensitive healthcare data (HIPAA/PHI).

## Problem
Clinical research organizations often struggle with:
- Migrating legacy on-prem infrastructure to the cloud
- Managing secure access for multiple roles (medical monitors, biostatistics, data management)
- Protecting sensitive patient data in compliance with HIPAA/PHI and NIST standards
- Monitoring for misconfigurations, unauthorized access, and malware
- High operational overhead from maintaining on-prem servers, including electricity, cooling, and physical security costs  

## Solution
This lab addresses these challenges by:
- Deploying a secure Azure infrastructure (VMs, VNets, NSGs) for clinical workflows
- Implementing RBAC and MFA in Microsoft Entra ID for role-based access
- Using Microsoft Purview to automatically tag and classify sensitive patient data
- Creating encrypted storage (Blob Storage / Azure Files) with TLS in transit and encryption at rest
- Integrating ShareFile folders for secure collaboration with partner hospitals
- Monitoring the environment using Azure Monitor and Microsoft Defender for Cloud


## Architecture / Workflow
![Architecture Diagram](./docs/architecture-diagram.png)

The architecture includes:
1. Segmented Azure subnets with NSGs for network security
2. Windows VMs deployed via Bicep modules
3. Encrypted Blob Storage / File Shares for clinical data
4. RBAC enforcement for multiple clinical roles
5. Integration with ShareFile for secure external collaboration
6. Monitoring and alerting via Microsoft Defender and Azure Monitor

## Challenges & Learnings
- Designing a multi-role secure environment while ensuring compliance with HIPAA and NIST standards
- Automating the tagging of sensitive clinical data for governance purposes
- Configuring NSGs and network segmentation to balance security and accessibility
- Integrating ShareFile with Azure storage without exposing PHI

## Technologies Used
- Microsoft Azure: VMs, VNets, NSGs, Storage, Azure Monitor
- Microsoft Entra ID: RBAC, Conditional Access, MFA
- Microsoft Purview: Data classification and tagging
- Azure Security: Microsoft Defender for Cloud & Endpoint
- Infrastructure as Code: Bicep, PowerShell
- Optional: ShareFile integration, Azure File Sync

## Results
- Reduced deployment time from ~2 hours of manual setup to under 10 minutes with automation, ensuring consistency across environments  
- Achieved 100% enforcement of encryption and data classification policies for sensitive healthcare data  
- Improved overall security posture and consistency across all environments  
- Lowered operational overhead and increased cost efficiency by eliminating on-prem server maintenance and leveraging Azure cloud scalability  

## Key Takeaways
- Automated deployments reduce human error and increase consistency  
- Policy-driven governance ensures compliance at scale  
- Secure defaults are critical when handling sensitive healthcare data
