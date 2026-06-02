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

class C<T> {
    var x: T
    init(y: T) {
        x = y
    }
}

enum E {
    | A
}

func g<T>(a: T) {
    a
}

func f<T>(a: T) {
    var b = a
    g<T>(a)
}

main() {
    var a = C<E>(A)
    var b = f<E>(A)
    a.x = b
}
