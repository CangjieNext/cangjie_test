// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f  
// ASSERT: scan 1

internal import std.random.Random

var count = 0

public interface I {}

public open class A <: I {
    public init() {}
    public mut prop x: Byte { // block id: 530
        get() { // block id: 532
            println("getter")
            UInt8(1);
        }
        set(Value) { // block id: 537
            println("setter")
        }
    }
}

public sealed interface I1 {}

public open class B <: I1 {
    public init() { // block id: 478

    }
}

main() {
    let rnd = Random()
    let counts = [0, 0]
    func test() {
        count++
        counts
    }
    let a: I1 = B();
    for (_ in 0..100) {
        test()[rnd.nextInt64(2)] += 1 // test().[](rnd.nextInt64(2), test().[](rnd.nextInt64(2)) + 1)
    }
    println(count)
    println(counts)
    return counts[0] + counts[1] - 100
}
