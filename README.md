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
   
## Tut: Start of the ThePEG interface tutorial

* You should have now a working version of Herwig7 and the ThePEG interface.
* Please always remember that you have to do CMSENV and to source the herwig7 environment via

  ```
  cd CMSSW_7_1_25_patch1/src
  cmsenv
  source herwig7-env.sh
  ```
  if you have started a new terminal.
  
### Tut1: Run first test job, if not already done
* If not already done, run the first test job via
   ```
   cmsRun Herwigpp_TestProcess_cff_py_GEN_SIM.py
   ```
* This job will produce 5 ttH events at GenSim level using the built-in matrix elements of Herwig7.
* The output events will be stored in a CMSSW root file called TestProcess.root.

* Open the cmsRun config file Herwigpp_TestProcess_cff_py_GEN_SIM.py to take a closer look what goes on under the hood.
 * Line 5:
 
 ```
 # with command line options: Herwigpp_DummyProcess_cff.py --fileout file:DummyProcess.root --mc --eventcontent RAWSIM --customise SLHCUpgradeSimulations/Configuration/postLS1Customs.customisePostLS1,Configuration/DataProcessing/Utils.addMonitoring --datatier GEN-SIM --conditions MCRUN2_71_V1::All --beamspot Realistic50ns13TeVCollision --step GEN,SIM --magField 38T_PostLS1 --no_exec -n 5
 ```
 The cmsDriver.py command was invoked with these arguments to produce the cmsRun config file. You should remember and save this line, since we will adopt and use it quite often in the next few tutorial exercises.
 
 * Line 26f.: 
 
 ```
 process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(5)
 ```
 Here, we define the number of events we would like to generate. Compare this with line 97, we instruct Herwig to generate an awful amount of events (100M) but CMSSW stops the Herwig7 event generation as soon as the requested event number is reached.
 
 * Line 31:
 
 ```
 process.source = cms.Source("EmptySource")
 ```
 We make use of an empty source, since Herwig7 / ThePEG is implemented as an EDFilter and generates the events during the EDFilter step.
 
 * Line 50:
 
 ```
 fileName = cms.untracked.string('file:TestProcess.root'),
 ```
 The name of the resulting CMSSW output file.
 
 * Line 67:
 
 ```
 process.generator = cms.EDFilter("ThePEGGeneratorFilter",
 ```
 The start of the Herwig7 / ThePEG configuration. One cannot document everything here, but I will try to outline the major parts.
 
 * Line 68f.:
 
 ```
     hwpp_cmsDefaults = cms.vstring('+hwpp_basicSetup',
        '+hwpp_setParticlesStableForDetector'),
 ```
 Using the CMSSW config syntax, we define some basic instructions for Herwig7 in the kind of two variable-length strings hwpp_basicSetup and hwpp_setParticlesStableForDetector. These two strings are defined below.
 
 * Line 70 and line 93:
 
 ```
 run = cms.string('LHC'),
 generatorModule = cms.string('/Herwig/Generators/LHCGenerator'),
 ```
 This name is given to the event generator. Furthermore, we point Herwig to the generator module which should be used as a template for the event generator.
 
 * Line 98:
 
 ```
 'set /Herwig/Generators/LHCGenerator:DebugLevel 2',
 ```
 Sometimes it is useful to increase the verbosity of the event generation. Please make sure that you do comment out or remove the following line (if existing)
 ```
      'set /Herwig/Generators/LHCGenerator:UseStdout 0',
 ```
 so that Herwig7 does not suppress the output.
 
 * Line 137ff:
 
 ```
     parameterSets = cms.vstring('hwpp_cmsDefaults',
        'hwpp_ue_EE5C',
        'hwpp_pdf_CTEQ6L1',
        'hwpp_cm_13TeV',
        'dummyprocess'),
 ```
 Here, we define which parts of the config snippets are really used for the event generation.
 Please note that we can define more snippets in the config above, but only snippets listed here or recursively included will be used as input configuration for the Herwig7 event generator. 
 
 * Line 143:
 
 ```
 dummyprocess = cms.vstring('insert /Herwig/MatrixElements/SimpleQCD:MatrixElements[0] /Herwig/MatrixElements/MEPP2ttbarH')
 ```
 This is the definition of our hard subprocess. We define the use of internal matrix elements of the pp > ttH process for the event generation.

### Tut2: Start from scratch and generate your own cmsRun config
* The usual workflow in CMSSW is to start with a config fragment which is then converted by the cmsDriver.py command into a cmsRun config file.
* We will start with a basic config fragment for Herwig7 / ThePEG and will create a cmsRun config file before we are producing some events.

* Please take a look at the Herwigpp_DummyProcess_cff.py file.
 * You should observe that the config fragment is fairly manageable.
 * In the first few lines 
 
 ```
 from Configuration.Generator.HerwigppDefaults_cfi import *
from Configuration.Generator.HerwigppUE_EE_5C_cfi import *
from Configuration.Generator.HerwigppPDF_CTEQ6_LO_cfi import *
from Configuration.Generator.HerwigppEnergy_13TeV_cfi import *
 ```
 config snippets -- which are defined as python blocks -- are imported. The config fragments can be found here: https://github.com/cms-sw/cmssw/tree/CMSSW_8_1_X/Configuration/Generator/python
 * Afterwards the corresponding blocks
 
 ```
        herwigDefaultsBlock,
        herwigppUESettingsBlock,
        herwigppPDFSettingsBlock,
        herwigppEnergySettingsBlock,
 ```
 are occuring in the EDFilter part. In this way, the content of the python blocks is later added as config snippets to the EDFilter section of the cmsRun config file. During the cmsDriver.py command these blocks will be replaced by their content.
 * Please remember that only config snippets either directly mentioned in the parameterSets part or indirectly referenced by a mother snippet
 ```
 parameterSets = cms.vstring(
                'hwpp_cmsDefaults',
                'hwpp_ue_EE5C',
                'hwpp_pdf_CTEQ6L1',
                'hwpp_cm_13TeV',
                'dummyprocess',

        ),
 ```
 will be later used as input configuration for the Herwig7 event generation.
 
