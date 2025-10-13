package diagnosticsTest.other_error

open class A {
    var m1: Int32 = 1
}
class C <: A {
    var a: Int32 = 10					
    let b: Int32 = super.m1
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
