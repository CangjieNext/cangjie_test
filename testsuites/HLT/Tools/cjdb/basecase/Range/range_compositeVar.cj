/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A {
    let n = 10
    let r0 = 0..10 // r0 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    let r1 = 0..10 : 1 // r1 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    let r2 = 0..=n : 1 // r2 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    let r3 = n..0 : -2 // r3 contains 10, 8, 6, 4, 2
    let r4 = 10..=0 : -2 // r4 contains 10, 8, 6, 4, 2, 0
    let r5: Range<Rune> = r'A'..r'Z':1
    let r6: Range<Rune> = r'z'..r'a':-1
}

struct B {
    let n = 10
    let r0 = 0..10 // r0 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    let r1 = 0..10 : 1 // r1 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    let r2 = 0..=n : 1 // r2 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    let r3 = n..0 : -2 // r3 contains 10, 8, 6, 4, 2
    let r4 = 10..=0 : -2 // r4 contains 10, 8, 6, 4, 2, 0
    let r5: Range<Rune> = r'A'..r'Z':1
    let r6: Range<Rune> = r'z'..r'a':-1
}

enum C {
    | C1(Range<Int64>) | C2(Range<Int64>) | C3(Range<Int64>) | C4(Range<Rune>) | C5(Range<Rune>)
}


main() {
    var a: A = A()
    var b: B = B()
    var c1 = C.C1(a.r1)
    var c2 = C.C2(a.r2)
    var c3 = C.C3(a.r3)
    var c4 = C.C4(b.r5)
    var c5 = C.C5(b.r6)
}
