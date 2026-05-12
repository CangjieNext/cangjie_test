# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys
from cjprof_heap import heapAnalyzeTest

class heap_Analyze_03(heapAnalyzeTest):
    def __init__(self):
        super().__init__()
        self.heap_export_cmd = '--show-reference="notexist"'
        super().heap_running()

    def compare_heap_data(self, p_heap_stdouts):
        p_heap_stdout_15 = p_heap_stdouts[0].decode('utf-8').strip()

        if "notexist" not in p_heap_stdout_15:
            sys.exit(2)
        else:
            sys.exit(1)

if __name__ == "__main__":
    heap_analyze_03 = heap_Analyze_03()