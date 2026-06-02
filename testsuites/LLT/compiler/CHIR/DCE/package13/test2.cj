// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) DEPENDENCE: p1
// (CJNATIVE) DEPENDENCE: p2
// (CJNATIVE) EXEC:%compiler  %debugCHIROpt %disableReflection %enableO2 p1/test0.cj %compile_lib_opt -o test0.%middle
// (CJNATIVE) EXEC:%compiler  %debugCHIROpt %disableReflection %enableO2 test0.%middle p2/test1.cj %compile_lib_opt -o test1.%middle 2>&1 | compare %f
// (CJNATIVE) EXEC:%compiler  %debugCHIROpt %disableReflection %enableO2 test0.%middle test1.%middle test2.cj -o %output 
// (CJNATIVE) EXEC: %run %output

internal import test0.*
internal import test1.*

main() {
    returnI().foo()
    return 0
}

// (CJNATIVE) ASSERT: scan-not The foo will be deleted
// (CJNATIVE) ASSERT: scan-not core dumped
// (CJNATIVE) ASSERT: scan-not stack trace