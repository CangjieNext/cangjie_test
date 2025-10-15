// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %f 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan !"CJBC", i32 1
// (Linux and CJNATIVE) ASSERT: scan !"Cangjie_OPT", i32 0

main() {
    println("Hello Cangjie.")
}
