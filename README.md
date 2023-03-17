# Container Image for VMware PowerCLI on PowerShell Core

## Overview

Provides a container image for running VMware PowerCLI and supporting modules.

This image includes the following components:

| Component                          | Version | Description                                                                     |
|------------------------------------|---------|---------------------------------------------------------------------------------|
| Microsoft PowerShell Core          | 7.2.0   | A cross-platform automation and configuration tool/framework.                   |
| `VMware.PowerCLI`                  | 12.7.0  | A collection of PowerShell modules for managing and automating VMware products. |
| `VMware.vSphere.SsoAdmin`          | x.y.z   | PowerShell module for vCenter Single Sign-on.                                   |
| `PowerVCF`                         | x.y.z   | PowerShell module for VMware Cloud Foundation API.                              |
| `PowerValidatedSolutions`          | x.y.z   | PowerShell module for VMware Validated Solutions.                               |
| `VMware.PowerManagement`           | x.y.z   | PowerShell module for power management of VMware Cloud Foundation.              |
| `VMware.CloudFoundation.Reporting` | x.y.z   | PowerShell module for VMware Cloud Foundation reporting.                        |

## Get Started

Run the following to download the latest container from Docker Hub:

```bash
docker pull harbor.sydeng.vmware.com/rcroft/powercli:latest
```

Run the following to download a specific version from Docker Hub:

```bash
docker pull harbor.sydeng.vmware.com/rcroft/powercli:x.y.z
```

Open an interactive terminal:

```bash
docker run --rm -it harbor.sydeng.vmware.com/rcroft/powercli
```

Run a local script:

```bash
docker run --rm --entrypoint="/usr/bin/pwsh" -v /path/to/ps/scripts:/tmp/shared harbor.sydeng.vmware.com/rcroft/powercli /tmp/shared/example.ps1
```

Where `/path/to/ps/scripts` is the local directory path for your PowerShell scripts.

## Credits

_Originally taken from here: [tenthirtyam/container-powerclicore](https://github.com/tenthirtyam/container-powerclicore/)_
