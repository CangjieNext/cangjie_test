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
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public struct S {
    public var a = 10
    
    @Version["1.1"]
    public mut prop p1: Int64 {
        get() { a }
        set(value) { a = value }
    }

    @Version["1.2"]
    public mut prop p2: Int64 {
        get() { a }
        set(value) { a = value }
    }


    public mut prop p3: Int64 {
        get() { a }
        set(value) { a = value }
    }
}

