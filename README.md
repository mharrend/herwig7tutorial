# Herwig7 tutorial at CERN 06 to 07 October 2016

## Link to corresponding Indico page
https://indico.cern.ch/event/567362/

## Link to corresponding Vidyo room
https://vidyoportal.cern.ch/flex.html?roomdirect.html&key=HZqbAUgO6MnvKQdUuDu7w5I9wY

## Purpose of repository

* Provide Herwig7 for the CMS persons participating in the tutorial
* Collection of material required for the CMS-specific tutorial

## Setup of Herwig7 in CMSSW 8_1_0_pre12

* Unfortunately, the Herwig7 package -- being implemented in CMSSW 8_1_X -- still has some issues which could not get fixed before the date of the tutorial.
* Therefore, a working Herwig7 installation was setup on LXPLUS which can be used by the participants.

### Steps in detail 

1. Log on to LXPLUS

  ```
ssh USERNAME@lxplus.cern.ch
```
2. Setup CMSSW 8_1_0_pre12 using the GCC530 architecture (only needed once)

  ```
  export SCRAM_ARCH=slc6_amd64_gcc530
  scram project CMSSW_8_1_0_pre12
  ```
3. Do not forget to setup CMSSW environment properly each time (CMSENV!)
   
   ```
   cd CMSSW_8_1_0_pre12/src
   cmsenv
   ```
4. Clone the CMSW81X branch in your CMSSW/src folder (only needed once)
   
   ```
   cd $CMSSW_BASE/src
   git clone -b CMSSW81X https://github.com/mharrend/herwig7tutorial.git .
   ```
   Note: The dot is important and your CMSSW/src folder should be empty
   
5. Make a git pull to update everything in Git repository   
   ```
   git pull
   ```
   
6. Setup necessary changes to make use of local Herwig7 installation
   
   ```
   cd $CMSSW_BASE/src
   source herwig7-env.sh
   ```
   
* Note: Steps 1, 3, 6 you have to do everytime / in every new terminal! Steps

### Steps in a nutshell (first setup)

  ```
  export SCRAM_ARCH=slc6_amd64_gcc530
  scram project CMSSW_8_1_0_pre12
  
   cd CMSSW_8_1_0_pre12/src
   cmsenv
 
   cd $CMSSW_BASE/src
   git clone -b CMSSW81X https://github.com/mharrend/herwig7tutorial.git .

   git pull

   cd $CMSSW_BASE/src
   source herwig7-env.sh
   ```

### Steps in a nutshell (subsequent use of current setup)
   ```
   cd CMSSW_8_1_0_pre12/src
   cmsenv
 
   cd $CMSSW_BASE/src
   
   git pull

   cd $CMSSW_BASE/src
   source herwig7-env.sh
   ```
