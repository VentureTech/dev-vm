Quick setup instructions are below, however, download links are nonexistent.  If you wish to view the more comprehensive setup document, please follow the below URL:  

https://docs.google.com/a/vipasolutions.com/document/d/1ua770K3Yi5vWUTN-JI3RX2a75uIk88-MGhyF5D8iDLI/edit?usp=sharing  

---------------------------------------------------------------------

Vagrant, unlike our previous setup guide that uses VMWare, is not the same. It is a piece of software that allows a user to quickly create, manage, and destroy virtual machines on the fly with simple command line commands (“vagrant up”).  As a result, it is designed to interface with a virtual machine provisioning application called VirtualBox, which is similar to VMWare.

1) Install VirtualBox (Windows x86/64 Installer, Other OS Installers)  
2) Install Vagrant (Windows Installer, Other OS Installers)  

---------------------------------------------------------------------

After installing Vagrant and VirtualBox, the repository containing Vagrant setup files for Venturetech will need to be pulled down onto your host machine.  The steps below are for Windows, but the commands are not going to be too different with other OS’s, as we will be using git.

1) If you have not installed Git yet on your machine, do so.  (Windows Installer, Other OS Installers)  
2) Clone the git repository into a local folder: “git clone git@github.com:VentureTech/dev-vm.git”  
3) Remove the remote to prevent accidentally pushing: “git remove remove origin”  
4) Navigate into the main folder where you cloned the dev-vm repository.  
5) Create a new VM with the command “vagrant up”.  Vagrant will read the Vagrantfile located within the dev-vm folder and provision a new VM using VirtualBox.  
