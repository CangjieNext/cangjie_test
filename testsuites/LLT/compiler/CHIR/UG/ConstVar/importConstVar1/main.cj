// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.a
// EXEC: %compiler %dumpCHIRDebug %f pkg.a -o %n.%suffix
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/[0-9]*_RemoveUnusedImports.chir | compare %f

import pkg.*

main() {
    foo() - 3
}

// ASSERT: scan @_CN3pkg3fooHvE3bbbK_E: Int64& = 3i
