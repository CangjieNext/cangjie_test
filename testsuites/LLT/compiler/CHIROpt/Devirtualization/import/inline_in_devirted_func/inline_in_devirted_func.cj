// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../../pick_defination.py pkg.cj
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization pkg.cj %compile_lib_opt -o test0.%middle
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all test0.%middle %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN3pkg1AIG_E1aHv$l
// ASSERT: scan-not Invoke(Class-_CN3pkg2IIIG_E<Int64>&->@_CN3pkg2IIIG_E1aHv

import pkg.*

main() {
    let a: II<Int64> = A<Int64>()
    a.a() - 1
}
