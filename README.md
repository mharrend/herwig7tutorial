# Herwig7 tutorial at CERN 06 to 07 October 2016

Table of Contents
=================

  * [Herwig7 tutorial at CERN 06 to 07 October 2016](#herwig7-tutorial-at-cern-06-to-07-october-2016)
    * [Link to corresponding Indico page](#link-to-corresponding-indico-page)
    * [Link to corresponding Vidyo room](#link-to-corresponding-vidyo-room)
    * [Purpose of repository](#purpose-of-repository)
    * [Setup of Herwig7 in CMSSW 7_1_25_patch1](#setup-of-herwig7-in-cmssw-7_1_25_patch1)
      * [Steps in detail](#steps-in-detail)
      * [Steps in a nutshell (first setup)](#steps-in-a-nutshell-first-setup)
      * [Steps in a nutshell (subsequent use of current setup)](#steps-in-a-nutshell-subsequent-use-of-current-setup)
      * [Test of setup](#test-of-setup)



## Link to corresponding Indico page
https://indico.cern.ch/event/567362/

## Link to corresponding Vidyo room
https://vidyoportal.cern.ch/flex.html?roomdirect.html&key=HZqbAUgO6MnvKQdUuDu7w5I9wY

## Purpose of repository

* Provide Herwig7 for the CMS persons participating in the tutorial
* Collection of material required for the CMS-specific tutorial

## Setup of Herwig7 in CMSSW 7_1_25_patch1

* Unfortunately, the Herwig7 package and the Herwig7 interface which will be implemented in CMSSW 8_1_X are not fully usuable among others due to the fact that no official candidate CMSSW 8_1_X version was released.
* Therefore, a working Herwig7 installation was setup on LXPLUS using the CMSSW 7_1_X branch which can be used by the participants.
* In this way participants can use all parts of the generator chain configuration.

### Steps in detail 

1. Log on to LXPLUS

  ```
ssh USERNAME@lxplus.cern.ch
```
2. Setup CMSSW 7_1_25_patch using the GCC481 architecture (only needed once)

  ```
  export SCRAM_ARCH=slc6_amd64_gcc481
  scram project CMSSW_7_1_25_patch1
  ```
3. Do not forget to setup CMSSW environment properly each time (CMSENV!)
   
   ```
   cd CMSSW_7_1_25_patch1/src
   cmsenv
   ```
4. Clone the CMSW71X branch in your CMSSW/src folder (only needed once)
   
   ```
   cd $CMSSW_BASE/src
   git clone -b CMSSW71X https://github.com/mharrend/herwig7tutorial.git .
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
  export SCRAM_ARCH=slc6_amd64_gcc481
  scram project CMSSW_7_1_25_patch1
  
   cd CMSSW_7_1_25_patch1/src
   cmsenv
 
   cd $CMSSW_BASE/src
   git clone -b CMSSW71X https://github.com/mharrend/herwig7tutorial.git .

   git pull

   cd $CMSSW_BASE/src
   source herwig7-env.sh
   ```

### Steps in a nutshell (subsequent use of current setup)
   ```
   cd CMSSW_7_1_25_patch1/src
   cmsenv
 
   cd $CMSSW_BASE/src
   
   git pull

   cd $CMSSW_BASE/src
   source herwig7-env.sh
   ```

### Test of Herwig7 setup
* You can use the provided Herwig7 input files to test your setup
* Choose one of the following input files
  * LEP.in Simple example of e+ e- collision
  * LHC.in Example of p p collision
  * LHC-Matchbox.in Example of the use of the Matchbox framework (Requires quite some time!)
* You can start the test via
  1. Reading the input file and producing a run file
  
    ```
    Herwig read INPUTFILE.in
    ```
  2. Starting Herwig7 using the run file
  
    ```
    Herwig run RUNFILE.run
    ```
    Note: You have to give the name of the run file (.run extension)

## Setup of old CMSSW ThePEG interface

* We will now setup an adopted version of the old CMSSW ThePEG interface which works together with Herwig7 and provides the old Herwig++ 2.7.1 functionality.
* Since the usage of the new Herwig7 interface will be quite similar to the ThePEG interface it makes sense to get comfortable with the ThePEG interface first.
* By the way, this is an easy and straightforward way to do comparison studies between the old ThePEG+Herwig++ interface and the adopted ThePEG+Herwig7 interface.

### Steps in detail

1. Do not forget to setup CMSSW environment properly each time (CMSENV!)
   
   ```
   cd CMSSW_7_1_25_patch1/src
   cmsenv
   ```
2. Make sure that you have cloned this repository in your CMSSW/src folder, otherwise type (once)

  ```
  cd $CMSSW_BASE/src
  git clone -b CMSSW71X https://github.com/mharrend/herwig7tutorial.git .
  ```
  Note: The src folder must be empty before cloning.
  
3. Confirm that you have the most recent version of the repository by
  
  ```
  git pull
  ```
  
4. Check that you have set the Herwig7 local installation and corresponding environment via
  
  ```
  cd $CMSSW_BASE/src
  source herwig7-env.sh
  ```

5. Make sure that your scram setup is working properly
  
  ```
  scram setup thepeg
  ```
  Note: Your THEPEG_BASE variable should point to /afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/thepeg-install
  
  ```
  scram setup herwigpp
  ```
  Note: Your HERWIGPP_BASE variable should point to /afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/herwig7-install
  
6. Reset your scram build cache
  
  ```
  scram b clean
  ```

7. Build ThePEG interface via scram build

   ```
   scram build
   ```
8. Test if the ThePEG interface is working using a provided cmsRun config file
   
   ```
   cmsRun Herwigpp_TestProcess_cff_py_GEN_SIM.py
   ```
   Note: After roughly 5 minutes you should have produced 5 ttH events at GenSim level using Herwig7.
