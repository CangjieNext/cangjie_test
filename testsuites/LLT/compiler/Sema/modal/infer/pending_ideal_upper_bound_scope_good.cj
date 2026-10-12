// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A pending ideal adopts an expected type only when the pending state is carried by a function type:
// a bare literal keeps its own default, Int64 here, which stays more specific than an expected type
// that is merely an upper bound of it, and an upper bound contributed by a generic constraint is no
// expectation at all. The CHIR dump shows the instantiated type variable, so the assertion pins down
// the expected T instead of only the compilation result.

// EXEC: %compiler %noColor %cmp_opt %compile_lib_opt %f -Woff all --dump-chir --dump-to-screen | compare %f

func id<T>(x: T): T { x }

func fromInterface(): ToString {
    id(1)
}

main() {
    let s: ToString = fromInterface()
    let t: ToString = id(1)
    println(s)
    println(t)
    return 0
}

/* SCAN-IN
Int64 = Apply(
*/
