// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output --dump-ast
// EXEC: %run %run_opt %output
// EXEC: %cat rearrange06_AST/8_mangle_ast.txt | compare %f
// should hava two ExtendDecl of line 15-24
// ASSERT: scan-2 position: (1, 15, 1) (1, 24, 2)

public struct RoArray<T> {}

extend<T> RoArray<T> <: Equatable<RoArray<T>> where T <: Equatable<T> {
    public operator func ==(that: RoArray<T>): Bool {
        println("== in (1, 15, 1) (1, 24, 2)")
        false
    }

    public operator func !=(that: RoArray<T>): Bool {
        false
    }
}

extend<T> RoArray<T> <: Equatable<Array<T>> where T <: Equatable<T> {
    public operator func ==(that: Array<T>): Bool {
        println("== in (1, 26, 1) (1, 35, 2)")
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
