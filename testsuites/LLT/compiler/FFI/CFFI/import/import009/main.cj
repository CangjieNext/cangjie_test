// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: liba.cj
// (CJNATIVE) EXEC: %compiler liba.cj --output-type=dylib -o %cffi_output
// (CJNATIVE) EXEC: %compiler %f %cffi-link -o %output
// (not CJNATIVE) EXEC: %compiler %compile_lib_opt liba.cj -o liba.%middle
// (not CJNATIVE) EXEC: %compiler %f liba.%middle -o %output
// EXEC-PIPE: %run %run_opt %output | compare %f
// ASSERT: scan AtCInDirectSymbol init success.
// ASSERT: scan AtCDirectSymbol init success.

package b

internal import a.*

@C
func AtCInDirectSymbol(): Unit {
    println("AtCInDirectSymbol init success.")
}

@C
struct CJFuncs {
    CJFuncs(
        let a: CFunc<()->Unit>,
        let b: CFunc<()->Unit>
    ) {}
}

let c = CJFuncs(AtCInDirectSymbol, AtCDirectSymbol)

unsafe main() {
    c.a()
    c.b()
}
