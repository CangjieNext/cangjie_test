/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan B!success!

open class A <: Resource {
    public open func isClosed():Bool {  
        print("A!");
        true
    }
    public open func close():Unit {}
}

class B <: A {
    public override func isClosed():Bool {
        false
    }
    public override func close():Unit {
        print("B!")
    }
}

main() {
    try (a: A = B()) {
    } finally {}
    print("success!\n")
    return 0
}
