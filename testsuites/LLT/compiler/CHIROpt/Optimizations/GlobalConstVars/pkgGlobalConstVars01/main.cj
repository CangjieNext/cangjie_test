// DEPENDENCE: pkg/pkg.cj
// (CJNATIVE) EXEC: %compiler %enableO2 --disable-reflection pkg.cj %compile_lib_opt -o pkg.%middle
// (CJNATIVE) EXEC: %compiler %debugCHIROpt %enableO2 --disable-reflection pkg.%middle %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %output
// (CJNATIVE) ASSERT: scan-1 The deref node in the line:21 and the column:17 was optimized by The opt: Constant Propagation
// (CJNATIVE) ASSERT: scan-not The deref node in the line:21 and the column:26 was optimized by The opt: Constant Propagation
// (CJNATIVE) ASSERT: scan-1 The deref node in the line:22 and the column:17 was optimized by The opt: Constant Propagation
// (CJNATIVE) ASSERT: scan-1 The deref node in the line:23 and the column:17 was optimized by The opt: Constant Propagation
// (CJNATIVE) ASSERT: scan-not core dumped
// (CJNATIVE) ASSERT: scan-not stack trace
// (CJNATIVE and Linux) EXEC-1: %llvmELFReader -s %output | grep x99abc
// (CJNATIVE and Linux) EXEC-1: %llvmELFReader -s %output | grep m99abc
// (CJNATIVE and Linux) EXEC-1: %llvmELFReader -s %output | grep n99abc
// (CJNATIVE and Windows) EXEC-1: %llvmELFReader -s %output | findstr m99abc
// (CJNATIVE and Windows) EXEC-1: %llvmELFReader -s %output | findstr n99abc
// (CJNATIVE and Windows) EXEC-1: %llvmELFReader -s %output | findstr x99abc

internal import pkg.*

main() {
    let res0 = (x99abc - y) == 0
    let res1 = (m99abc == false)
    let res2 = (n99abc == 's')

    if (res0 && res1 && res2) {
        return 0
    } else {
        return 1
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
