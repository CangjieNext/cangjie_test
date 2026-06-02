// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./c.c ./pkgA/pkgA.cj
// EXEC: gcc c.c -c -fPIC
// EXEC: %compiler %cmp_opt %compile_lib_opt ./pkgA.cj -o libpkgA.%lib_extension
// EXEC: %compiler %cmp_opt libpkgA.%lib_extension c.o %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkgA.*

foreign func cast(f: CFunc<(Bool) -> CPointer<Unit>>): CPointer<Unit>

func moo(a: (Bool) -> Int64) {
    a(false)
}

main(): Int64 {
    goo(true) // ASSERT: scan goo true
    moo(goo) // ASSERT: scan goo false

    unsafe { cfoo(true) } // ASSERT: scan cfoo true
    unsafe { cast(cfoo) } // ASSERT: scan cfoo false
    return 0
}
