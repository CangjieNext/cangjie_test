// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f %diag_json -o %output 2>&1 | compare %f
// ASSERT: scan-6 sema_illegal_scope_use_of_annotation
// ASSERT: scan-4 sema_only_cfunc_can_use_annotation

func goo1() {
    @C
    @CallingConv[CDECL]
    func foo1() {}

    unsafe { foo1() }
}

@CallingConv[CDECL]
func goo2() {}

@CallingConv[CDECL]
let f: CFunc<() -> Unit> = { => }

@CallingConv[CDECL]
struct Data1 {}

@C
@CallingConv[CDECL]
struct Data2 {}

var a = if (true) {
    @CallingConv[CDECL]
    let f: CFunc<() -> Unit> = { => }
}

class Shape {
    @CallingConv[CDECL]
    func draw() {}
}

extend Shape {
    @CallingConv[CDECL]
    func redraw() {}
}

interface Action {
    @CallingConv[CDECL]
    func go(): Unit
}

main() {}
