/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test interface: @Java

public interface I1 {
    public static func typename(): String {
        "interface I1"
    }
}
@Java
public interface I2 {
    public static func typename(): String {
        "interface I2"
    }
}


