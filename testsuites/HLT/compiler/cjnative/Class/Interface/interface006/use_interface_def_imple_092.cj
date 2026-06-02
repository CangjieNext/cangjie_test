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

public interface faterInterface1<T> {
    static func foo1(): Bool
    static func b1(): Bool {
        foo1()
    }
}

public interface MyInterface1<T> <: faterInterface1<T> {
    static func b1(): Bool {
        foo1()
    }
}

public interface faterInterface2<T> {
    static func foo3(): Bool
    static func b2(): Bool {
        foo3()
    }
}

public interface MyInterface2<T> <: faterInterface2<T> {
    static func b2(): Bool {
        foo3()
    }
}

public interface faterInterface3<T> {
    static func foo5(): Bool
    static func b3(): Bool {
        foo5()
    }
}

public interface MyInterface3<T> <: faterInterface3<T> {
    static func b3(): Bool {
        foo5()
    }
}

extend String <: MyInterface1<Bool> & MyInterface2<Bool> & MyInterface3<Bool> {
    public static func foo(): Bool {
        true
    }
    public static func foo1(): Bool {
        foo3()
    }
    public static func foo3(): Bool {
        foo5()
    }
    public static func foo5(): Bool {
        foo()
    }
}

main() {
    if (String.b1() && String.b2() && String.b3()) {
        return 0
    }
    return 1
}
