// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan in I1

public struct RoArray<T> {}

extend<T> RoArray<T> <: Equatable<RoArray<T>> where T <: Equatable<T> {
    public operator func ==(that: RoArray<T>): Bool {
        false
    }

    public operator func !=(that: RoArray<T>): Bool {
        false
    }
}

extend<T> RoArray<T> <: Equatable<Array<T>> where T <: Equatable<T> {
    public operator func ==(that: Array<T>): Bool {
        false
    }

    public operator func !=(that: Array<T>): Bool {
        false
    }
}

main() {
    var a: ?RoArray<Int64> = RoArray<Int64>()
    var b: ?RoArray<Int64> = RoArray<Int64>()
    a == b
    0
}
