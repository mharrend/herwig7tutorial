#!/bin/sh
cp $CMSSW_BASE/src/thepeg.xml $CMSSW_BASE/config/toolbox/slc6_amd64_gcc481/tools/selected/thepeg.xml
cp $CMSSW_BASE/src/herwigpp.xml $CMSSW_BASE/config/toolbox/slc6_amd64_gcc481/tools/selected/herwigpp.xml

export CPATH=/afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/thepeg-install/include:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/gosam-install/include:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/herwig7-install/include:/cvmfs/cms.cern.ch/slc6_amd64_gcc481/external/boost/1.51.0-cms2/include
export HERWIGPATH=/afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/herwig7-install/share/Herwig
export PATH=$PATH:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/herwig7-install/bin:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/gosam-install/bin:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/thepeg-install/bin
export LD_LIBRARY_PATH=/afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/gosam-install/lib:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/herwig7-install/lib:/afs/cern.ch/work/m/mharrend/public/herwig7tutorial-71X/thepeg-install/lib:/cvmfs/cms.cern.ch/slc6_amd64_gcc481/external/boost/1.51.0-cms2/lib:$LD_LIBRARY_PATH
