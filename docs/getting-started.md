# Getting Started

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
