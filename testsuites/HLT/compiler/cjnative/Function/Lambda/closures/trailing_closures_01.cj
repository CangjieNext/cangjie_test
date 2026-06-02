/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f  -o %output


main():Int64 {
    var a1 = foo1(1, { i => i * 2 })
    if ( a1 != 2 ) {
        return 1
    }
    var a2 = foo1(1) { i => i * 2 }
    if ( a2 != 2 ) {
        return 1
    }
    var a3 = foo2{ i => i * 2 }
    if ( a3 != 2 ) {
        return 1
    }
    var a4 = foo3(){}
    if ( a4 != 1 ) {
        return 1
    }
    return 0
}

func foo1(a: Int64, fn: (Int64)->Int64) { fn(a) }

func foo2(fn: (Int64)->Int64) { fn(1) }

func foo3(fn: ()->Unit) { return 1 }
func foo3()(fn: ()->Unit) { return 2 }
// ASSERT: scan parse_expected_left_brace
