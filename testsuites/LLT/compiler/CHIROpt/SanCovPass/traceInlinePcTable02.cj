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
// ASSERT: regex-next file name \:\(0\) (.*traceInlinePcTable02.cj)
// ASSERT: scan-next func:(0) (30)
// ASSERT: scan-next func name :(1) (test)
// ASSERT: regex-next file name \:\(1\) (.*traceInlinePcTable02.cj)
// ASSERT: scan-next func:(1) (34)
// ASSERT: scan-next func name :(2) (api)
// ASSERT: regex-next file name \:\(2\) (.*traceInlinePcTable02.cj)
// ASSERT: scan-next func:(2) (38)
// ASSERT: scan-end

main() {
    test(api)
    return 0
}

public func test(targetFunction: (Array<UInt8>) -> Int32): Int32 {
    return 0
}

public func api(data: Array<UInt8>): Int32 {
    return 0
}
