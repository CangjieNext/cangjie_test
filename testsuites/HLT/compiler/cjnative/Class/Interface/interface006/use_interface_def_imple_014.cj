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

public interface faterInterface<T> {
    mut func foo1(): Rune
    mut func foo2(a: Rune): Rune {
        foo1()
    }
}

public interface MyInterface <: faterInterface<Rune> {}

struct myStruct1 <: MyInterface {
    var x: Rune = r'1'
    public mut func foo1(): Rune {
        x = r'a'
        return x
    }
}

struct myStruct2 <: MyInterface {
    var x: Rune = r'2'
    public mut func foo1(): Rune {
        x = r'b'
        return x
    }
}

struct myStruct3 <: MyInterface {
    var x: Rune = r'3'
    public mut func foo1(): Rune {
        x = r'c'
        return x
    }
}

main() {
    var s1: faterInterface<Rune> = myStruct1()
    var s2: MyInterface = myStruct1()
    var s3: myStruct1 = myStruct1()
    var s4: myStruct2 = myStruct2()
    var s5: myStruct3 = myStruct3()

    if (s1.foo2(r'1') == r'a' && s2.foo2(r'1') == r'a' && s3.foo2(r'1') == r'a' && s4.foo2(r'1') == r'b' &&
        s5.foo2(r'1') == r'c' && s3.x == r'a' && s4.x == r'b' && s5.x == r'c') {
        return 0
    } else {
        return 1
    }
}
