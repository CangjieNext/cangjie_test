/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!
package test_stable_abi

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}


public interface I1 {

    @Version["1.1"]
    public static func typename(): String {
        "interface I1"
    }

    @Version["1.2"]
    public static func testOne(): Unit {

    }

    public func testTwo(): Unit {
        
    }

    public static func testThree(): String {
          "interface testThree"
    }
}


