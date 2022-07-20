<h1 align="center"> Phoenix </h1>
<p align="center">
  <img src="Pictures\projectlogo.png" height="200">
</p>


<h2 align="center">Red Team Infrastructure As Code</h2>
<div align="center">
  <a>
    <img src="Pictures\brandTerraform.svg">
  </a>
</div>

<h1 align="center"> ⚠️ In Progress ⚠️ </h1>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
# About The Project
&nbsp; &nbsp; &nbsp; There are already a lot of red team infrastructure as code but none for a simple and fast internal use. So I want to build a simple and useful red team infra hosted on VirtualBox and then on vmware for a more professional use.

**Why internal use ?**
&nbsp; Most infrastructure as a code are designed to be hosted on Amazon AWS or DigitalOcean but I don\'t want to pay an external host just for internal use.

**Why Virtualbox ?**
&nbsp; This infrastructure is designed for Virtualbox so that it can also be used by students who are tired of rebuilding their infra at every project.

**Why Terraform ?**
&nbsp; Terraform is simple to use and allows a destruction of the whole infrastructure in just one command line. Moreover it allows the integration of ansible playbooks easily.


<!-- GETTING STARTED -->
# Getting Started
## Prerequisites
**What you need before launching on your host :**
* [Virtualbox >= **6.1**](https://www.virtualbox.org)

* [Terraform >= **1.2.5**](https://www.terraform.io)

* [Ansible >= **2.9**](https://ansible.com)


## Installation
1. Launch Virtualbox.

2. Clone the repo :
   ```sh
   git clone https://github.com/N1neKitsune/PhoenixInfra/
   cd PhoenixInfra/
   ```
3. Change the variables files `variables.tfvars` with your own parameters.

4. Build and launch Infra with Terraform in the `PhoenixInfra` directory:
   ```sh
   terraform init
   terraform plan
   terraform apply
   ```
5. Wait for terraform to do it all while drinking a 🍺.

6. When finished, close the terminal, go back to Virtualbox and enjoy your infrastructure.


<!-- USAGE EXAMPLES -->
# Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_

<!-- LICENSE -->
# License

Distributed under the MIT License. See `LICENSE.txt` for more information.



<!-- ACKNOWLEDGMENTS -->
# Acknowledgments

Thanks to all authors of these resources that allowed me to create the project.

* [Ired.Team](https://www.ired.team)

