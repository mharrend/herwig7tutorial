#!/bin/sh
cp $CMSSW_BASE/src/thepeg.xml $CMSSW_BASE/config/toolbox/slc6_amd64_gcc530/tools/selected/thepeg.xml
cp $CMSSW_BASE/src/herwigpp.xml $CMSSW_BASE/config/toolbox/slc6_amd64_gcc530/tools/selected/herwigpp.xml

export CPATH=/afs/cern.ch/work/m/mharrend/public/herwig7tutorial/thepeg-install/include:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial/gosam-install/include:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial/herwig7-install/include:/cvmfs/cms.cern.ch/slc6_amd64_gcc530/external/boost/1.57.0-giojec/include
export HERWIGPATH=/afs/cern.ch/work/m/mharrend/public/herwig7tutorial/herwig7-install/share/Herwig
export PATH=$PATH:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial/herwig7-install/bin:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial/gosam-install/bin:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial/thepeg-install/bin
export LD_LIBRARY_PATH=/afs/cern.ch/work/m/mharrend/public/herwig7tutorial/gosam-install/lib:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial/herwig7-install/lib:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial/thepeg-install/lib:/cvmfs/cms.cern.ch/slc6_amd64_gcc530/external/boost/1.57.0-giojec/lib:$LD_LIBRARY_PATH
