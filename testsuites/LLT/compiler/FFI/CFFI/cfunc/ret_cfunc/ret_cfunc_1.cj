// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %n.cj %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan Hello
// ASSERT: scan World

foreign func runCFuncInC(f: CFunc<() -> Unit>): Unit

enum CFuncKind {
    WithException | NoException
}

@C
func foo1() {
    try {
        throw Exception("Hello")
    } catch (e: Exception) {
        println(e.message)
    }
}

@C
func foo2() {
    println("World")
}

func getCFunc(kind: CFuncKind): CFunc<() -> Unit> {
    return match (kind) {
        case WithException => foo1
        case NoException => foo2
    }
}

main() {
    let f1 = getCFunc(CFuncKind.WithException)
    let f2 = getCFunc(CFuncKind.NoException)
    unsafe {
        runCFuncInC(f1)
        runCFuncInC(f2)
    }
    0
}
