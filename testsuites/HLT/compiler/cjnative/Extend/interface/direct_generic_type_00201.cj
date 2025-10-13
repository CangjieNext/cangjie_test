/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {}

class B <: A {
    B(var b: Int64) {
    }
}

class C<T> where T <: A {
    func foo<T>(a: T) {
        return a
    }

    public static func foos<T>(a: T) {
        print(1)
        return a
    }
}

interface I<T> {
    static func foos<T>(a: T) {
        print(2)
        return a
    }
}

extend<T> C<T> <: I<T> where T <: B {
    // func foo<T>(a: T){
    // }
}

main() {
    C<B>.foos(B(1))
    return 0
}

// ASSERT: scan sema_ambiguous_match
