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

public struct TestStruct {
    public static var a: Int64 = 0
}

extend TestStruct {
    @CustomAnnotation["Sample", version: 1]
    public prop prop1: Int64 {
        get() {
            1
        }
    }

    @CustomAnnotation["Sample", version: 1]
    mut prop prop2: Int64 {
        get() {
            1
        }
        set(v) {
            a = v
        }
    }

    @CustomAnnotation["Sample", version: 1]
    mut prop prop3: Int64 {
        get() {
            1
        }
        set(v) {
            a = v
        }
    }

    @Frozen
    public func n1() {
        prop3
    }

    public prop prop_1: Int64 {
        get() {
            1
        }
    }

    mut prop prop_2: Int64 {
        get() {
            1
        }
        set(v) {
            a = v
        }
    }

    mut prop prop_3: Int64 {
        get() {
            1
        }
        set(v) {
            a = v
        }
    }

    @Frozen
    public func n_1() {
        prop_3
    }
}


