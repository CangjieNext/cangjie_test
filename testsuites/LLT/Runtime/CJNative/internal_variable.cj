// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %frontendCompiler %cmp_opt %compile_lib_opt %n.cj %dump-ir-to-screen 2>&1 | compare %f
// ASSERT: scan _CN3pkg16myPublicVaraibleE = constant

package pkg

public let myPublicVaraible: Int32 = 9911
let myPrivateVariable = 9911

main() {
    return 0
}
