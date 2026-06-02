// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not not applicable to

@Annotation
public class A {
    let i: Int64
    const init(i: Int64) {
        this.i = i
    }
}

@A[1]
public class B {
    @A[2]
    var a = 1

    @A[2]
    public func b() {
    }
}

@A[3]
interface C {
    @A[4]
    func b(): Int64 {
        return 1
    }
}

@A[5]
public struct D {
    @A[2]
    var a = 1

    @A[4]
    public func b(): Int64 {
        return 1
    }
}

@A[6]
public enum E {
    x
    | y(Int64)

    @A[4]
    public func b(): Int64 {
        return 1
    }
}

main() {}
