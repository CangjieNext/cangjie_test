/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test interface: interface implementation
public interface I1 {
    public func f1(): Int64 {
        0
    }
    public func _f1(): Int64
    public static func typename(): String {
        "interface I1"
    }
}

public interface I2 {
    public func f2(): Int64 {
        1
    }
    public static func typename(): String {
        "interface I2"
    }
}

public interface I3 <: Father_I1 & Father_I2 {
    public static func typename(): String {
        "interface I3"
    }
}

public interface Father_I1 {}

public interface Father_I2 {}
