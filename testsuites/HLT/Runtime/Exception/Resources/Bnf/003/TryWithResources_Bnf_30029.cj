/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: test_30029.cj
// EXEC: %compiler %cmp_macro test_30029.cj
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output  %run_args | compare %f
// ASSERT: scan close!success!

import test.*

class A <: Resource {
    public func isClosed():Bool {
        false
    }
    public func close():Unit {
        print("close!")
    }
}

main() {
    try (a = A()) {
        @M(A())
    } catch (_) {
        @M(A())
    } finally {
        @M(A())
    }
    print("success!\n")
    return 0
}
