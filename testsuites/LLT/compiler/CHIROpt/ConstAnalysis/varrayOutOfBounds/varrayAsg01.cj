// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %frontendCompiler %cmp_opt %f -o %n.%suffix -Woff unused %diag_json

func foo1() {
    var b = 4
    var test: VArray<Int64, $3> = [1, 2, 3]
    var test1 = test
    var a = test1[b]
    test1[b] = 1
}

func foo2() {
    var b = 4
    var test: VArray<Int64, $3> = VArray<Int64, $3>({i => i})
    var test1 = test
    var a = test1[b]
    test1[b] = 1
}

func foo3() {
    var b = 4
    var test: VArray<Int64, $3> = VArray<Int64, $3>(repeat: 2)
    var test1 = test
    var a = test1[b]
    test1[b] = 1
}

main() {
    foo1()
    foo2()
    foo3()
}
// ASSERT: scan-6 chir_idx_out_of_bounds
