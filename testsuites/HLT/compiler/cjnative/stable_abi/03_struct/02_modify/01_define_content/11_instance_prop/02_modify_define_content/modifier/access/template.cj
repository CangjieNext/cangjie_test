/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

public struct S {
    var a = 10
    public mut prop p1: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    protected mut prop p2: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    protected mut prop p3: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    internal mut prop p4: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    internal mut prop p5: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    private mut prop p6: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    private mut prop p7: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    mut prop p8: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    mut prop p9: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    mut prop p10: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}
