// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface Print {
    func print(p: Int32): Int32
}

class I1 <: Print {
    public func print(p: Int32): Int32 {
        return p + 1
    }
}

class I2 <: Print {
    public func print(p: Int32): Int32 {
        return p + 2
    }
}

class I3 <: Print {
    public func print(p: Int32): Int32 {
        return p + 3
    }
}

func test(p: Print, v: Int32): Int32 {
    return p.print(v)
}

main(): Int64 {
    var a: I1 = I1()
    var b: I2 = I2()
    var myArray: Array<Print> = [a, b, I3()]
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
