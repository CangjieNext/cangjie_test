// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-1 getter
// ASSERT: scan-1 setter
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

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

main(): Int64 {
    let a: I1 = B();
    A().x <<= ((match ((a as A)) {
        case _ => UInt8(1)
    }))
    return 0;
}
