// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %f -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan AA
// ASSERT: scan-not An exception has occurred

public open class A <: ToString {
    public open func toString(): String {
        return "A"
    }
}

public open class AA <: A {
    public init() {
    }

    public open func toString(): String {
        return "AA"
    }
}

main() {
    var a: AA = AA()
    test(a)
}

public func cast<T>(obj: Any): T {
    if (obj is Option<T>) {
        let objT = obj as ?T
        return objT.getOrThrow().getOrThrow()
    } else {
        let objT = obj as T
        return objT.getOrThrow()
    }
}

func test(p: A): Unit {
    if (p is AA) {
        var pp = cast<AA>(p)
        println(pp)
    }
}