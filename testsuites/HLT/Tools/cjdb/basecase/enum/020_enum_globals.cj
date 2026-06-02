/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit {
    | Year(Int8)
    | Month(Int32, Int64)
}

enum TimeUnit1 {
    Year
}

enum TimeUnit2<T> {
    | Year(Int8)
    | Month(T, Int64)
}

enum TimeUnit3<T> {
    Year | Year(T)
}

class C1 {}

struct S1 {}

struct S2<T> {}

enum TimeUnit4<T> {
    Year | Year(C1) | Year(S1, S2<Int64>)
}

let t1 = TimeUnit.Year(5)
let t2 = TimeUnit1.Year
let t3 = TimeUnit2.Month(true, 3)
let t4 = TimeUnit3<Array<Rune>>.Year
let t5 = TimeUnit3<C1>.Year(C1())
let t6 = TimeUnit4<Int64>.Year(C1())
let t7 = TimeUnit4<Int64>.Year(S1(), S2<Int64>())

main() {
    0
}
