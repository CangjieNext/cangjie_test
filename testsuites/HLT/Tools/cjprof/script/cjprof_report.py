# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import sys
import signal
import subprocess
from optparse import OptionParser
import shlex

def inputdata_exist(inputfile):
    # Execute error-cases: with inputdata_exist
    if inputfile == "notexist.data":
        with open("cjprof_report.data", "r", encoding="utf-8") as reportfile:
            r = reportfile.readline()
            if 'CJ' not in r:
                sys.exit(1)
            else:
                sys.exit(0)
    else:
        pass

def gen_report(inputfile):
    """
    gen_report: get cjprof report
    """
    print("\n  -------- cjprof report {0} > {1} -------- ".format('-i '+inputfile, 'cjprof_report.data'))
    with open('cjprof_report.data', 'w') as f:
        p = subprocess.Popen(['cjprof', 'report', '-i', inputfile], stdout=f)
    p.wait()
    # Execute error-cases: with inputdata
    inputdata_exist(inputfile)
    # Clean subprocess
    p.kill()
    clean_subprocess(p)

def gen_flamegraph(inputfile, outputfile):
    """
    gen_flamegraph: get cjprof report flamegraph
    """
    print("\n  -------- cjprof report -F {0} {1} -------- ".format('-i '+inputfile, '-o '+outputfile))
    cmd = "cjprof report -F {0} {1}".format('-i '+inputfile, '-o '+outputfile)
    cmd_list = shlex.split(cmd)
    p = subprocess.Popen(cmd_list, executable=None, preexec_fn=os.setsid)

    p.wait()
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
    parser.add_option("-i", "--input", action = "store", 
                                       dest = "inputfile", 
                                       default = "cjprof.data", 
                                       help = "inputfile record-data")
    parser.add_option("-o", "--output", action = "store", 
                                        dest = "outputfile", 
                                        default = "FlameGraph.svg", 
                                        help = "outputfile record-result")

    (options, args) = parser.parse_args()
    gen_report(options.inputfile)
    gen_flamegraph(options.inputfile, options.outputfile)
    