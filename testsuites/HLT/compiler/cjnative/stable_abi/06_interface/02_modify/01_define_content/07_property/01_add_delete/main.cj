/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

public class C2 <: I2 {
    public mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    public static mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
}
main() {
    f()
    assert(C1().p1, 1)
    assert(I1.p2, 1)
    assert(C2().p1, 1)
    assert(C2.p2, 1)
}
