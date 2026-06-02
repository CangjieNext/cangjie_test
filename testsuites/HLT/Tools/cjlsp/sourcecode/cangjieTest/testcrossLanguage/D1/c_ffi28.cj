/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

//c中函数调用了cj的函数
foreign func nativeFunaa(b: CFunc<(Int64, Float64, Int64, Float64, Int64, Float64, Int64, Float64, Int64, Float64, Int64, Float64, Int64, Float64, Float64, Float64)-> Unit>): Unit;

@C
func callbackaa(x0: Int64, x1: Float64, x2: Int64, x3: Float64, x4: Int64, x5: Float64, x6: Int64, x7: Float64, x8: Int64, x9: Float64, x10: Int64, x11: Float64, x12: Int64, x13: Float64, x14: Float64, x15: Float64) {
    println("args: ${x0}, ${x1}, ${x2}, ${x3}, ${x4}, ${x5}, ${x6}, ${x7}, ${x8}, ${x9}, ${x10}, ${x11}, ${x12}, ${x13}, ${x14}, ${x15}")
    assert(x0, 4)
    assert(x1, 8.0)
    assert(x2, 15)
    assert(x3, 16.0)
    assert(x4, 23)
    assert(x5, 42.0)
    assert(x6, 108)
    assert(x7,  -4.0)
    assert(x8,  -8)
    assert(x9,  -15.0)
    assert(x10, -16)
    assert(x11, -23.0)
    assert(x12, -42)
    assert(x13, -108.0)
    assert(x14, -1.0)
    assert(x15, 3.14159265)
}

func assert(x: Int64, expect: Int64) {
    if (x != expect) {
        throw Exception("fail")
    }
}

func assert(x: Float64, expect: Float64) {
    if ((x - expect) > 1e-16) {
        throw Exception("fail")
    }
}

main() {
    unsafe {
        nativeFunaa(callbackaa)
    }
    return 0
}
