// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan 2
// ASSERT: scan a
// ASSERT: scan 88
// ASSERT: scan 99

struct A {}

func foo(a: VArray<Int64, $3>): VArray<Int64, $3> {
    [1, 2, 3]
}

main() {
    let a1: VArray<Int64, $3> = VArray<Int64, $3>({i => i})
    println(a1[2])
    let a2: VArray<Rune, $3> = VArray<Rune, $3>(repeat: r'a')
    println(a2[2])
    var arr1: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    arr1[4] = 88
    println(arr1[4])
    var arr2: VArray<VArray<Int64, $5>, $2> = [[1, 2, 3, 4, 5], [7, 8, 9, 10, 11]]
    let arr3: VArray<VArray<Int64, $3>, $2> = VArray<VArray<Int64, $3>, $2>(repeat: VArray<Int64, $3>({i => i}))
    let arr4: VArray<VArray<Int64, $3>, $2> = VArray<VArray<Int64, $3>, $2>({i => foo([4, 5, 6])})
    let arr5: VArray<A, $2> = VArray<A, $2>({i => A()})
    var x = foo(a1)
    arr2[0] = [99, 2, 2, 2, 2]
    println(arr2[0][0])
    0
}
