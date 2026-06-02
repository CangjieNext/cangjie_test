// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1
// (DEBUG_OPTION)EXEC:%compiler  %debugCHIROpt %disableReflection --no-sub-pkg p1/test0.cj %compile_lib_opt -o test0.%middle
// (DEBUG_OPTION)EXEC:%compiler  %debugCHIROpt %disableReflection --no-sub-pkg test0.%middle test1.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output

internal import test0.*

main(): Int64 {
    func_1724146578733_22<UInt8, Int32>("1")

    return 0;
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace