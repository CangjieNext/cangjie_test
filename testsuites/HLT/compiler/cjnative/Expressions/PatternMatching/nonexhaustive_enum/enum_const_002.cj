/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum EE<T> {
    | A1(Int64) | B1(T) | C1 | ...

    func get() {
        match (this) {
            case A1(x) => 1
            case B1(y) => 2
            case C1 => 3
            case _ => 4
        }
    }

    static func parse(val: Int64): EE<Int64> {
        match (val) {
            case 1 => A1(1)
            case 2 => EE<Int64>.B1(1)
            case 3 => C1
            case _ => throw Exception("case ...")
        }
    }
}

main() {
    EE<Int64>.parse(1).get() - 1
}
