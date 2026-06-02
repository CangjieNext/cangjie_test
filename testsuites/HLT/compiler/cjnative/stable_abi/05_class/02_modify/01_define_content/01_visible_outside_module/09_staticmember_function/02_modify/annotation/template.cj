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

public class S1 {
    let x: Int64 = 0

    @Version["1.1"]
    public func getX(): Int64 {
        return x
    }

    @OverflowThrowing
    public static func geta1() {
        return 0
    }

    @Version["1.1"]
    public static func geta2() {
        return 0
    }

    public static func geta3() {
        return 0
    }
}

class S2 {
    let x: Int64 = 0
}

public class S3 {
    let x = S2()

    @Version["1.1"]
    public func getX(): Int64 {
        return x.x
    }

    public func getY(): Int64 {
        return x.x
    }
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(s1: S1, s3: S3): Unit {
    assert(s1.getX(), 0)
    assert(S1.geta1(), 0)
    assert(S1.geta2(), 0)
    assert(S1.geta3(), 0)
    assert(s3.getX(), 0)
    assert(s3.getY(), 0)
}
