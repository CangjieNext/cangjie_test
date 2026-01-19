/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
main() {
    assert(Red.geta() is I, true)
    assert(Red.getb() is I, true)
    assert(Red.getc() is Addable, true)
    assert(Red.getd() is Subtractable, true)
    assert(Red.gete() is Subtractable, true)
}
