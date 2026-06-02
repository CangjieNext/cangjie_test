// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: packageA.cj packageB.cj %n.cj
// (DEBUG_OPTION)EXEC: %compiler %compile_lib_opt packageA.cj -o packageA.%middle
// (DEBUG_OPTION)EXEC: %compiler %compile_lib_opt packageB.cj -o packageB.%middle
// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt packageB.%middle packageA.%middle %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_z` with initializer constant(s).
// (CJNATIVE and DEBUG_OPTION) EXEC-85: %run %run_opt %output %run_args

import b.*
const z = g() + 1

main () {
    z
}