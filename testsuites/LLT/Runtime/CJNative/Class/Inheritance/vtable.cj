// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class C1 {
    public var a: Int32 = 1
    public open func print(p: Int32): Int32 {
        return p + 1
    }
}

open class C2 <: C1 {
    public open override func print(p: Int32): Int32 {
        return p + 2
    }
}

class C3 <: C2 {
    public override func print(p: Int32): Int32 {
        return p + 3
    }
}

func test(p: C1, v: Int32): Int32 {
    return p.print(v)
}

main(): Int64 {
    var a: C1 = C1()
    var b: C2 = C2()
    var myArray: Array<C1> = [a, b, C3()]
    var cnt: Int32 = 0
    var sum: Int32 = 0

    while (cnt < 99) {
        sum += test(myArray[Int64(cnt % 3)], cnt % 3)
        cnt++
    }

    if (sum == 297) {
        return 0
    }
    return 1
}
