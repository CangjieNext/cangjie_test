/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum RGBColor<T> {
    Red |Green(T)
}

enum RGBColor2<T,R> {
    Green(T,R)
}

main(): Int64 {
    let r1= RGBColor<Int32>.Red
    let r2 = RGBColor<Int32>.Green(3)
    let r3 = RGBColor2<Int32,Float64>.Green(3, 1.0)
    let r4 = Green(true, 1.0)
    return 0
}
