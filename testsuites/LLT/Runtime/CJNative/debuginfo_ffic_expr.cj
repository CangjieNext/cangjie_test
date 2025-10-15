// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: debuginfo_ffic_expr.c
// EXEC: %clang -g %clang_opt debuginfo_ffic_expr.c -o %cffi_output
// EXEC: %compiler -g -L. -l%n %n.cj -o %n
// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen -g %n.cj 2>&1 | compare %f
// ASSERT: regex-auto call void @llvm.dbg.declare(metadata i32 ()** %cf, metadata

foreign func IntFromC(): Int32

main() {
    var cs = unsafe { LibC.mallocCString("hello") }
    var cp = CPointer<Int8>()
    var cf = IntFromC
    let f1: CFunc<(CPointer<Int8>) -> Unit> = {
        ptr => print("This function is defined with CFunc lambda.")
    }
}
