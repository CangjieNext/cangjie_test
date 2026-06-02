/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test extend: staticmember function
@Annotation
public class CustomAnnotation {
    let name: String
    let version: Int64

    public const init(name: String, version!: Int64 = 0) {
        this.name = name
        this.version = version
    }
}

public struct TestClass {
    public const init() {}
}

extend TestClass {
    @CustomAnnotation["Sample", version: 1]
    public func f1() {
        1
    }

    @CustomAnnotation["Sample", version: 1]
    func f2() {
        1
    }

    @CustomAnnotation["Sample", version: 1]
    const func f3() {
        1
    }

    public const func n1() {
        f3()
    }

    @CustomAnnotation["Sample", version: 1]
    func f4() {
        1
    }

    @Frozen
    public func n2() {
        f4()
    }

    public func f_1() {
        1
    }

    func f_2() {
        1
    }

    const func f_3() {
        1
    }

    public const func n_1() {
        f_3()
    }

    func f_4() {
        1
    }

    @Frozen
    public func n_2() {
        f_4()
    }
}


