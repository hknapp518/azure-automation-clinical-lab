
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
- Deploying a secure Azure infrastructure (VMs, VNets, NSGs) for clinical workflows using Bicep
- Implemented a Zero Trust identity and access management model in Microsoft Entra ID, including role-based user segmentation, Conditional Access policies enforcing MFA, and validation of authentication and policy enforcement through sign-in log analysis.
- Implemented Microsoft Purview data classification policies to automatically identify and label sensitive clinical and personal data, supporting compliance and governance controls across the Azure environment.
- Creating encrypted storage (Blob Storage / Azure Files) with TLS in transit and encryption at rest
- Integrating ShareFile folders for secure collaboration with partner hospitals
- Monitoring the environment using Azure Monitor and Microsoft Defender for Cloud


## Architecture / Workflow
This architecture implements a Zero Trust clinical trial environment on Azure with layered security controls.
<img width="5149" height="919" alt="mermaid-diagram" src="https://github.com/user-attachments/assets/b8425277-a070-47e5-8057-db9103d3f02b" />



### Data Flow

Users → Microsoft Entra ID (RBAC + MFA via Conditional Access) → Azure Virtual Network (segmented with NSGs) → Windows VM (clinical workload) → Azure Blob Storage (encrypted patient data)


### Security & Governance Layers

- Azure Key Vault → Secures secrets and credentials (no hardcoding)  
- Microsoft Purview → Classifies and labels sensitive data (PHI/PII)  
- Azure Monitor + Microsoft Defender for Cloud → Provides monitoring, logging, and threat detection  


### Design Principle

The design follows a defense-in-depth model, where identity, network, compute, and data layers each enforce independent security controls.

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
