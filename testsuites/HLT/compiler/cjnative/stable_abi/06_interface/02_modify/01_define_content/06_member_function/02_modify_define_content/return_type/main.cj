/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

public class C <: I {
    public static func g3(): F2 {S1()}
    public func g4(): F2 {S1()}
}
main() {
    assert(I.g1().g(), 1)
    assert(C().g2().g(), 1)
    assert(C.g3().g(), 1)
    assert(C().g4().g(), 1)
}
