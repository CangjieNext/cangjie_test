/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func test_t<T>(a: T) {
    return a
}

func foo<T>(a: T) {
    let goo = {x: T =>
        x
    }
    let f1 = { a: Int64, b: T => a}(1,a)
    var test_lambda = {
        a: Int16, b: UInt16, c: Float32, d: Bool, e: Rune, f: (Int8, UInt16), g: Unit, h: CString =>
        var test_a = a
        var test_b = b
        var test_c = c
        var test_d = d
        var test_e = e
        var test_f = f
        var test_g = g
        var test_h = h
        print("${a}\n")
        print(b)
    }(test_t<Int16>(16), test_t<UInt16>(16), test_t<Float32>(32.32), test_t<Bool>(true), test_t<Rune>(r'a'),
        test_t<(Int8, UInt16)>((10, 20)), test_t<Unit>(()),
        test_t<CString>(unsafe { LibC.mallocCString("CString in Cangjie\n code. 05") }))
    return goo(a)
}

main():Int64 {
    var a : Int16 = 3
    foo(a)
    return 0
}
