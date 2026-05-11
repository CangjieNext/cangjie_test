# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys
import os
import difflib
from optparse import OptionParser

def string_similar(string1, string2):
    """
    string_similar: compare string Similarity using difflib.SequenceMatcher
    """
    return difflib.SequenceMatcher(None, string1, string2).quick_ratio()

def get_cleandata(datafile):
    """
    cleandata: record data consists of address-info, clean it
    """
    clean_data = []
    with open(datafile, "r", encoding="utf-8") as data:
        data_results = data.readlines()
        # clean the address Symbol in datafile
        for data_result in data_results:
            if "0x" not in data_result:
                clean_data.append(data_result.strip())
    return clean_data

def compare_reportfile(origin_data1, origin_data2):
    """"
    compare_recorddatafile: use difflib compare the similarity of datafile
    test_result: results may be different each time
    svg_similar_ratio: 0.5 is the decision bound
    """
    clean_data1 = get_cleandata(origin_data1)
    clean_data2 = get_cleandata(origin_data2)
    data_similar_ratio = string_similar("".join(clean_data1), "".join(clean_data2))
    print("\n ------- The Similarity of record data-file is {:.2} -------- \n".format(data_similar_ratio))
    # Decisition Bound: 0.5 to split testcases Pass or Fail
    if data_similar_ratio > 0.5:
        print("\n ----------- GREAT! record-data Compare Pass! ------------ \n")
    # Compare failed
    else:
        print("\n ----------- ERROR! record-data Compare FAIL! ------------ \n")
    return data_similar_ratio

def compare_svgfile(svgfile1, svgfile2):
    """
    compare_svgfile: use difflib compare the similarity of svg file
    test_result: results may fluctuate slightly
    svg_similar_ratio: 0.5 is the decision bound
    """
    if not os.path.exists(svgfile2):
        print("\n ----------- Flamegraph not exist ----------- \n")
        sys.exit(1)
    with open(svgfile1, "r", encoding="utf-8") as f:
        with open(svgfile2, "r", encoding="utf-8") as f_new:
            svg_similar_ratio = string_similar(f.read(), f_new.read())
            print("\n --------- The Similarity of svg-file is {:.2} ---------- \n".format(svg_similar_ratio))
            # Decisition Bound: 0.5 to split testcases Pass or Fail
            if svg_similar_ratio > 0.5:
                print("\n ----------- GREAT! svg-file Compare Pass! ------------ \n")
            # Compare failed
            else:
                print("\n ----------- ERROR! svg-file Compare FAIL! ------------ \n")
    return svg_similar_ratio

def get_testcase_dir():
    """
    get_testcase_dir: Get testcase_dir under run_env 
    """
    for file in os.listdir():
        if os.path.isdir(file) and "cjprof" in file:
            testcase_dir = file
            break
    return testcase_dir

def gen_compare_result(data_similar_ratio, svg_similar_ratio):
    """
    gen_compare_result: throw error if failed
    """
    if data_similar_ratio < 0.3 and svg_similar_ratio < 0.3:
        sys.exit(2)

if __name__ == "__main__":
    # Get testcase_dir under run_env 
    testcase_dir = get_testcase_dir()
    # Baseline： data and graph are generated in advanced
    report_baseline = "expect/cjprof_report_baseline.data"
    graph_baseline = "expect/FlameGraph_baseline.svg"
    recorddata_baseline = "{1}".format(testcase_dir, report_baseline)
    flamegraph_baseline = "{1}".format(testcase_dir, graph_baseline)

    # Get options from command
    parser = OptionParser()
    parser.add_option("-i", "--input", action = "store", 
                                        dest = "report", 
                                        default = "cjprof_report.data", 
                                        help = "report name")
    parser.add_option("-o", "--output", action = "store", 
                                        dest = "flamegraph", 
                                        default = "FlameGraph.svg", 
                                        help = "flamegraph name")
    (options, args) = parser.parse_args()

    # Compare datafile and svgfile
    data_similar_ratio = compare_reportfile(recorddata_baseline, options.report)
    svg_similar_ratio = compare_svgfile(flamegraph_baseline, options.flamegraph)
    # Generate compare result
    gen_compare_result(data_similar_ratio, svg_similar_ratio)