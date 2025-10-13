/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

public interface I {}

extend Int64 <: I {}

public struct S {
    var a = 0
    public mut prop p1: Int64 {
        get() {
            a
        }
        set(value) {
            value
        }
    }
}
