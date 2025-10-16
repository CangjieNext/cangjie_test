/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface B<T> {}

interface B2 {}

func foo<T>(para: T) {
    var a: T = para
    a
}

class A {}

class C<T> <: B<T> {
    var a:Int32 =1
}

class C2 <: B2 {
    var a:Int32 =1
}

main(): Int64 {
    var ans1: B<Int32> = C<Int32>()
    var ans2: C<Int32> = C<Int32>()
    var ans3 = C2().a
    var x1 = foo(ans1)
    var x2 = foo(ans2)
    var x3 = foo(ans3)
    return 0
}
