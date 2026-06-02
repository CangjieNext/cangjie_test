/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
enum A<T> {
    EA | EB(T)
}

func aaa<T>(a1: A<T>) {
    var b1 = match (a1) {
        case EA => 1
        case EB(a) => match (a) {
            case a: Int64 => 2
            case a: T => 3
            case _ => 4
        }
    }
    return b1
}

func bbb<T>(a1: A<T>) {
    var b1 = match (a1) {
        case EA => 1
        case _: A<Int64> => 2
        case _: A<T> => 3
        case _ => 4
    }
    return b1
}

main() {
    var a = aaa(EB(Int32(1)))
    var b = aaa<Unit>(EA)
    var c = aaa(EB(1))

    var a1 = bbb(EB(Int32(1)))
    var b1 = bbb<Unit>(EA)
    var c1 = bbb(EB(1))

    if (a != 3 || b != 1 || c != 2) {
        return 1
    }
    if (a1 != 3 || b1 != 1 || c1 != 2) {
        return 1
    }
    return 0
}
