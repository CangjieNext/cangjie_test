// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %n.cj 2>&1 | compare %f

// ASSERT: scan store i1 true, i1* @"$has_applied_pkg_init_func", align 1
// (CJNATIVE) ASSERT: scan call void @_CGPatiiHv(
// (CJNATIVE) ASSERT: scan call void @"_CGF7defaultUglobal_01$iiHv"(
// (not CJNATIVE) ASSERT: scan call void @"std.core_global_init$"(
// (not CJNATIVE) ASSERT: scan call void @"global_init$_default.1.global_01.cj"(

func get() {
    1
}

let a = get()

main() {
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
