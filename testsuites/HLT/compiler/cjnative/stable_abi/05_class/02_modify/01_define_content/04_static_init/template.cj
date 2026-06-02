/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: static func
public class C1 {
    public static let v1: Int64
    static init() {
        v1 = 1
    }
}

public class C2 {
    public static var v1: Int64 = 1
    static init() {
        v1 = 1
    }
}

public class C3 {
    public static var v1: Int64 = 1
}


