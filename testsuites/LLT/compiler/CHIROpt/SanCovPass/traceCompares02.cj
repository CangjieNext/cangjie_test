// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: sancov.h sancov.cpp
// (CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -c -fPIC %stdc++_opt sancov.cpp -o sancov.o
// (CJNATIVE and DEBUG_OPTION) EXEC: %compiler %debugCHIROpt --sanitizer-coverage-trace-compares sancov.o %n.cj -o %output 
// (CJNATIVE and DEBUG_OPTION) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) EXEC: %clang++ -shared -fPIC %stdc++_opt sancov.cpp -o libsancov.so
// (not CJNATIVE and DEBUG_OPTION) EXEC: %compiler %cmp_opt %debugCHIROpt --sanitizer-coverage-trace-compares -o %n.%suffix %n.cj -lsancov
// (not CJNATIVE and DEBUG_OPTION) RUN-EXEC-PIPE: LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. %run %n.%suffix %run_args 2>&1 | compare %f

// ASSERT: scan-begin enter step1
// ASSERT: scan-next enter step2
// ASSERT: scan-next exit step2
// ASSERT: scan-next trace_const_cmp4: (0, 0)
// ASSERT: regex-next caller PC=0x?[A-Za-z0-9]+
// ASSERT: scan-next exit step1: AAA
// ASSERT: scan-next exit step1: BBB
// ASSERT: scan-end

public func step1(): Bool {
    println("enter step1")

    if (step2() == 0) {
        println("exit step1: AAA")
    }

    println("exit step1: BBB")
    return false
}

func step2(): Int32 {
    println("enter step2")
    println("exit step2")
    return 0
}

main() {
    step1()
    return 0
}
