// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: regex-auto declare void @llvm.cj.gcwrite.static.ref(i8 addrspace(1)*, i8 addrspace(1)** nocapture)
// ASSERT: regex-auto call void @llvm.cj.gcwrite.static.ref(i8 addrspace(1)*
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A {}

var xxx = A()

main() {
    xxx
    0
}
