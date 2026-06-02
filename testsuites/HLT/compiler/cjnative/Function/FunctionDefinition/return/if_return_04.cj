/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (foo01() != 2.0) {
        return 1
    }
    if (foo02() != ()) {
        return 2
    }
    if (foo03() != ()) {
        return 3
    }
    if (foo04() != 2) {
        return 3
    }
    return 0
}

// 函数返回类型是最后一个表达式的类型，是if-else的最小父类
func foo01(): Float32 {
    if (false) {
        1.0
    } else {
        2.0
    }
}

// 函数返回类型是最后一个表达式的类型，一个声明，是unit
func foo02() {
    var a: Int32 = if (false) {
        1
    } else {
        2
    }
}

// 函数返回类型是最后一个表达式的类型，是if-else的最小父类,是unit，实际return返回()
func foo03(): Unit {
    if (true) {
        return ()
    } else {
        return ()
    }
}

// 函数返回类型是最后一个表达式的类型，是if-else的最小父类,是int64，实际return返回int64
func foo04(): Int64 {
    if (false) {
        return 1
    } else {
        return 2
    }
}
