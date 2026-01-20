/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1 {}

interface I2<T> {}

class C1 <: I1 {}

class C2 <: I2<Int64> {}

main(){
    let v1 = Option<I1>.Some(C1())
    let v2 = Option<I1>.None
    let v3 = Option<I2<Int64>>.Some(C2())
    let v4 = Option<I2<Int64>>.None

    var r1 = v1 ?? C1()
    var r2 = v2 ?? C1()
    var r3 = v3 ?? C2()
    var r4 = v4 ?? C2()
    0
}
