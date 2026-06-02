/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: super class
public open class Father1 {}

public open class Father2 {}

public class Son1 <: Father1 {
    public func f1() {
        100
    }
}

public class Son2 {
    public func f2() {
        1001
    }
}

public func checker(): Int64 {
    let f1 = Father1()
    let f2 = Father2()
    let c1 = Son1()
    let c2 = Son2()

    if (c1.f1() == 100 && c2.f2() == 1001) {
    } else {
        return 1
    }
    if (c1 is Father1) {
    } else {
        return 1
    }
    0
}
