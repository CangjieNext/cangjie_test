// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: regex-auto declare void @llvm.cj.gcwrite.static.struct(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64)
// ASSERT: regex-auto call void @llvm.cj.gcwrite.static.struct(i8*
// ASSERT: regex-auto call void @llvm.cj.gcwrite.static.struct(i8*
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var c = ""
var a: b<String, Bool> = b()

public class j {}

struct b<l, ab> {
    let ac = (j(), ())
}

main() {
    c
    a
    0
}
