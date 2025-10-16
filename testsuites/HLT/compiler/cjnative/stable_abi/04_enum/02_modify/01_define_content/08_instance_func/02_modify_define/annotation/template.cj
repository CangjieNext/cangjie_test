/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

@Annotation
public class A {
    let name: String
    public const init(name: String) {
        this.name = name
    }
}

public enum E {
    | RED | BLUE | YELLOW(UInt8)
    public func f1(): Int64 { return 0 }
    @A["func2"] public func f2(): Int64 { return 0 }
    @A["func3"] public func f3(): Int64 { return 0 }
}


