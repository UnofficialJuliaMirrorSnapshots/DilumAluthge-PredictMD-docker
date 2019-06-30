#!/bin/bash

##### Beginning of file

set -ev

whoami
id
id -u
id -ru
id -g
id -rg

export JULIA_DEBUG="all"
export PREDICTMD_TEST_GROUP="$1"
export PREDICTMD_OPEN_PLOTS_DURING_TESTS="$2"

echo "JULIA_DEBUG=$JULIA_DEBUG"
echo "PREDICTMD_TEST_GROUP=$PREDICTMD_TEST_GROUP"
echo "PREDICTMD_OPEN_PLOTS_DURING_TESTS=$PREDICTMD_OPEN_PLOTS_DURING_TESTS"

julia -e '
    import Pkg;
    Pkg.activate(predictmd);
    Pkg.test("PredictMD");
    Pkg.test("PredictMDExtra");
    Pkg.test("PredictMDFull");
    '

echo "predictmd: runtests.sh: Tests passed."

##### End of file
