# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys
from cjprof_heap import heapExportTest

class heap_Export_09(heapExportTest):
    def __init__(self):
        super().__init__()
        self.heap_export_cmd = '-d ' + str(self.real_pid) + ' -o ' + "heap.data"
        super().heap_running()

    def compare_heap_data(self, p_heap_stdouts):
        p_heap_stdout = p_heap_stdouts[1].decode('utf-8').strip()

        if "Heap data is successfully dump to file 'heap.data'" in p_heap_stdout:
            return 2
        else:
            return 1
            
if __name__ == "__main__":
    heap_export_09 = heap_Export_09()