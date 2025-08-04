/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: staticmember variable
public open class Father {}

public class Son <: Father {}

public class CC {
    public static let a1: Any = 1
    public static var a2: Any = 2
    public static const a3: Int64 = 3

    public static let c1: Father = Father()
    protected static let c2: Son = Son()
    internal static const c3: Int64 = 1
    private static var c4: Int64 = 1
}
