// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: sancov.h sancov.cpp
// (CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -c -fPIC %stdc++_opt sancov.cpp -o sancov.o
// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt --sanitizer-coverage-inline-8bit-counters --sanitizer-coverage-pc-table sancov.o %n.cj -o %output  
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -shared -fPIC %stdc++_opt sancov.cpp -o libsancov.so
// (not CJNATIVE and DEBUG_OPTION) EXEC: %compiler %cmp_opt %debugCHIROpt --sanitizer-coverage-inline-8bit-counters --sanitizer-coverage-pc-table -o %n.%suffix %n.cj -lsancov
// (not CJNATIVE and DEBUG_OPTION) RUN-EXEC-PIPE: LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. %run %n.%suffix %run_args 2>&1 | compare %f

// ASSERT: scan-begin do 8bit_counters_init: 0
// ASSERT: scan-next call  __create_pc_table size:
// ASSERT: scan-next packagename: default
// ASSERT: scan-next func name :(0) (main)
// ASSERT: regex-next file name \:\(0\) (.*traceInlinePcTable03.cj)
// ASSERT: scan-next func:(0) (46)
// ASSERT: scan-next func name :(1) (api1)
// ASSERT: regex-next file name \:\(1\) (.*traceInlinePcTable03.cj)
// ASSERT: scan-next func:(1) (59)
// ASSERT: scan-next func name :(2) (api2)
// ASSERT: regex-next file name \:\(2\) (.*traceInlinePcTable03.cj)
// ASSERT: scan-next func:(2) (63)
// ASSERT: scan-next func name :(3) (api2)
// ASSERT: regex-next file name \:\(3\) (.*traceInlinePcTable03.cj)
// ASSERT: scan-next func:(3) (64)
// ASSERT: scan-next func name :(4) (api2)
// ASSERT: regex-next file name \:\(4\) (.*traceInlinePcTable03.cj)
// ASSERT: scan-next func:(4) (66)
// ASSERT: scan-next [0] = 1
// ASSERT: scan-next [1] = 3
// ASSERT: scan-next [2] = 5
// ASSERT: scan-next [3] = 5
// ASSERT: scan-next [4] = 0
// ASSERT: scan-end

@FastNative
foreign func ShowCounter(): Unit

var i = 0

unsafe main() {
    api1()
    api1()
    api1()
    api2()
    api2()
    api2()
    api2()
    api2()
    ShowCounter()
    return 0
}

public func api1(): Int32 {
    return 0
}

public func api2(): Int32 {
    if (i == 0) {
        return 1
    } else {
        return 0
    }
}
