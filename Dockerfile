FROM mcr.microsoft.com/powershell:debian-bookworm

# set argument defaults
ARG DEBIAN_FRONTEND=noninteractive

# set timezone env var
ENV TZ=Australia/Sydney

# set working to user's home directory
WORKDIR /root

# trust PowerShell Gallery and install VMware PowerCLI (only)
RUN pwsh -c 'Set-PSRepository -Name PSGallery -InstallationPolicy Trusted' && \
    pwsh -c "\$ProgressPreference = \"SilentlyContinue\"; Install-Module -Name VMware.PowerCLI" && \
    pwsh -c "\$ProgressPreference = \"SilentlyContinue\"; Install-Module -Name VMware.PowerCLI.VCenter" && \
    pwsh -c "Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCEIP \$false -Confirm:\$false" && \
    pwsh -c "Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:\$false"

# trust PowerShell Gallery and install all VMware PowerShell Modules
# RUN pwsh -c "Install-Module -Name PSDesiredStateConfiguration" && \
#     pwsh -c "\$ProgressPreference = \"SilentlyContinue\"; Install-Module -Name VMware.PowerCLI" && \
#     pwsh -c "Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCEIP \$false -Confirm:\$false" && \
#     pwsh -c "Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:\$false" && \
#     pwsh -c "\$ProgressPreference = \"SilentlyContinue\"; Install-Module -Name VMware.vSphereDSC" && \
#     pwsh -c "\$ProgressPreference = \"SilentlyContinue\"; Install-Module -Name VMware.CloudServices" && \
#     pwsh -c "\$ProgressPreference = \"SilentlyContinue\"; Install-Module -Name VMware.vSphere.SsoAdmin" && \
#     pwsh -c "\$ProgressPreference = \"SilentlyContinue\"; Install-Module -Name PowerVCF" && \
#     pwsh -c "\$ProgressPreference = \"SilentlyContinue\"; Install-Module -Name PowerNSX" && \

# grab latest PowerCLI samples from github
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends git tzdata dnsutils && \
#     git clone https://github.com/vmware/PowerCLI-Example-Scripts.git && \
#     mv ./PowerCLI-Example-Scripts/Modules/* ~/.local/share/powershell/Modules/ && \
#     rm -rf ~/.local/share/powershell/Modules/VMware.vSphere.SsoAdmin && \
#     rm -rf ./PowerCLI-Example-Scripts && \
#     apt-get remove -y git

# set user
#USER ${USER}

# set working directory
WORKDIR /workspace

# don't set ENTRYPOINT/CMD, fallback to base powershell ENTRYPOINT/CMD
#ENTRYPOINT ["pwsh"]

#############################################################################
# vim: ft=unix sync=dockerfile ts=4 sw=4 et tw=78:
