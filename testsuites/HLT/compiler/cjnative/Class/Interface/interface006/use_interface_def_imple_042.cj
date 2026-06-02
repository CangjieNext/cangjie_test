/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_interface_is_not_extendable

var p1 = 0
var p2 = 0
var p3 = 0

public interface MyInterface1<T> {
    mut prop b1: Int64 {
        get() {
            1
        }
        set(value) {
            p1 = value
        }
    }
}

public interface MyInterface2<T> {
    mut prop b2: Int64 {
        get() {
            2
        }
        set(value) {
            p2 = value
        }
    }
}

public interface MyInterface3<T> {
    mut prop b3: Int64 {
        get() {
            3
        }
        set(value) {
            p3 = value
        }
    }
}

enum myEnum<T> {
    A
}

extend<T> myEnum<T> <: MyInterface1<Int64> & MyInterface2<Int64> & MyInterface3<Int64> {}

main() {
    var en1: MyInterface1<Int64> = myEnum<MyInterface1<Int64>>.A
    var en2: MyInterface2<Int64> = myEnum<MyInterface1<Int64>>.A
    var en3: MyInterface3<Int64> = myEnum<MyInterface1<Int64>>.A
    var en4: myEnum<MyInterface1<Int64>> = myEnum<MyInterface1<Int64>>.A
    en1.b1 = 1
    en2.b2 = 2
    en3.b3 = 3

    if (en1.b1 == 1 && p1 == 1 && en2.b2 == 2 && p2 == 2 && en3.b3 == 3 && p3 == 3) {
        en4.b1 = 4
        en4.b2 = 4
        en4.b3 = 4
        if (en4.b1 == 1 && p1 == 4 && en4.b2 == 2 && p2 == 4 && en4.b3 == 3 && p3 == 4) {
            return 0
        }
    }
    return 1
}
