# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import sys
import time
import signal
import subprocess
from subprocess import check_output
from optparse import OptionParser
import shlex

def sampling_exit(samplingfreq, subprocess):
    # Execute error-cases: with samplingfreq
    if int(samplingfreq) <= 0:
        sys.exit(1)

def recording_launch(samplingfreq, inputfile, outputfile, run_env):
    """
    recording_launch: launch-mode to record report
    """
    print("\n -------- cjprof record {0} {1} {2} -------- \n".format(inputfile, '-f ' + str(samplingfreq),
                                                                     '-o ' + outputfile))
    cmd = "cjprof record {0} {1} {2}".format(inputfile, '-f ' + str(samplingfreq), '-o ' + outputfile)
    cmd_list = shlex.split(cmd)
    if "cjnative" in run_env:
        p = subprocess.Popen(
            cmd_list,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            preexec_fn=os.setsid)

    # Execute error-cases: with samplingfreq
    if samplingfreq != "max": sampling_exit(samplingfreq, p)
    # clean subprocess
    p.communicate()
    p.kill()
    clean_subprocess(p)

def clean_subprocess(p):
    """
    clean_subprocess: kill subprocess
    """
    try:
        os.killpg(p.pid, signal.SIGTERM)
    except ProcessLookupError:
        pass

if __name__ == "__main__":
    parser = OptionParser()
    parser.add_option("-f", "--freq", action="store",
                      dest="samplingfreq",
                      default=1000,
                      help="cjprof-record sampling frequency")
    parser.add_option("-i", "--input", action="store",
                      dest="inputfile",
                      help="inputfile compile-result")
    parser.add_option("-o", "--output", action="store",
                      dest="outputfile",
                      default="cjprof.data",
                      help="outputfile record-result")
    parser.add_option("-p", "--pid", action="store",
                      dest="pid",
                      default=False,
                      help="pid you want to attach")
    (options, args) = parser.parse_args()
    run_env = sys.argv[5]
    recording_launch(options.samplingfreq, options.inputfile, options.outputfile, run_env)
