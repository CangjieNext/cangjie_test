// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: regex-auto-not call void @llvm.cj.struct.array.copyto
// ASSERT: regex-auto-not call void @llvm.cj.ref.array.copyto
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct S {
    var i = 1
    var j = 2
}

var a = [S(), S(), S()]

main() {
    var temp = a.clone()
}
