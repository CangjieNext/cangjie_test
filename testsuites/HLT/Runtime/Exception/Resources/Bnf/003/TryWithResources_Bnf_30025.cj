/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    public func isClosed():Bool {
        false
    }
    public func close():Unit {
        print("close!")
    }
}

open class C {
    var x = 1
}

class B <: C {
    public func main_():Int16 {
        try (a = A()) {
            super.x
        } catch (_) {
            super.x
        } finally {
            super.x
        }
        print("success!\n")
        return 0
    }
}

main() {
    return B().main_()
}
