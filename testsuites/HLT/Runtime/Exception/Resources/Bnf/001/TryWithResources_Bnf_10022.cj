/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan isClosed!success!

class A <: Resource {
    public var flag: Bool = false
    public init(x: Bool) {
        flag = x
    }
    public func isClosed():Bool {
        if (flag) {
            print("isClosed!")
        };
        return flag
    }
    public func close():Unit {
        if (flag) {
            print("close!")
        }
    }
    public func foo():Unit {
        this.flag = true
    }
}

main() {
    try (a = A(false)) {
        a.foo()
    }
    print("success!\n")
    return 0
}
