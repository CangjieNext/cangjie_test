/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: instancemember variable

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public class CC {
    static public let a1 = 1
    static public var a2 = 2

    @Version["1.1"] static public let f1 = 1
    @Version["1.1"] static public var f2 = 2
}


