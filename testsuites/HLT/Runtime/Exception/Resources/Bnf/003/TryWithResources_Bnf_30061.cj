/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var flag: Int64 = 0

class A <: Resource {
    public func isClosed():Bool {
        false
    }
    public func close():Unit {
        flag++
    }
}

class B {
    public operator func [](x: Int64, value!: Int64) {}
}

var x: ?B = B()

main() {
    try (a = A()) {
        x?[0] = 1
    } catch (_) {
        x?[0] = 1
    } finally {
        x?[0] = 1
    }
    if (flag == 0) {
        return 1
    }
    return 0
}
