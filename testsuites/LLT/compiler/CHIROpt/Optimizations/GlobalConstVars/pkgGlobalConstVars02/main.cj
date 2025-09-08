// DEPENDENCE: pkg/pkg.cj
// (CJNATIVE) EXEC: %compiler pkg.cj %compile_lib_opt -o pkg.%middle
// (CJNATIVE) EXEC: %compiler %debugCHIROpt %enableConstPropagation pkg.%middle %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %output
// (CJNATIVE) ASSERT: scan-1 The deref node in the line:15 and the column:17 was optimized by The opt: Constant Propagation
// (CJNATIVE) ASSERT: scan-not The deref node in the line:15 and the column:23 was optimized by The opt: Constant Propagation
// (CJNATIVE) ASSERT: scan-1 The deref node in the line:16 and the column:17 was optimized by The opt: Constant Propagation
// (CJNATIVE) ASSERT: scan-1 The deref node in the line:17 and the column:17 was optimized by The opt: Constant Propagation
// (CJNATIVE) ASSERT: scan-not core dumped
// (CJNATIVE) ASSERT: scan-not stack trace

internal import pkg.*

main() {
    let res0 = (x99 - y) == 0
    let res1 = (m99 == false)
    let res2 = (n99 == 's')

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
