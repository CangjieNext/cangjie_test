/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// SEPARATE-FILE: test.c
// EXEC: %clang %clang_shared_opt test.c -o libtest.%dylib_suffix

long long test(long long* x) {
    return *x * 2;
}

// SEPARATE-FILE: test.cj
// EXEC-0: %compiler %cmp_opt -Woff=all test.cj -o %output -L./ -ltest --mock=on 2>&1
// EXEC-0: %run %run_opt %output %run_args 2>&1

foreign func test(ptr: CPointer<Int64>): Int64

struct A {
    static var a = 1
    var b = 10

    func test_a(): Int64 {
        unsafe {
            return test(inout a)
        }
    }

    mut func test_b(): Int64 {
        unsafe {
            return test(inout b)
        }
    }

    static func test_a_static(): Int64 {
        unsafe {
            return test(inout a)
        }
    }
}

main(): Unit {
    var a = A()
    unsafe {
        println(a.test_a())
        println(a.test_b())
        println(A.test_a_static())

        println(test(inout a.b))
        println(test(inout A.a))
    }
}

/* SCAN-IN
2
20
2
20
2
 */
