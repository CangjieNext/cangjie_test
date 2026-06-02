/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1

import std.reflect.*

open interface Description {
    public open func getDes() {}
}

class TestA <: Description {
    public func getDes(): Unit {
        println("I am TestA")
    }
}

class TestB <: Description {
    public func getDes(): Unit {
        println("I am TestB")
    }
}

class GenericTest1<T> <: Description where T <: Description {
    public func getDes(): Unit {
        println("I am GenericTest1")
        try {
            match ((ClassTypeInfo.of<T>() as ClassTypeInfo).getOrThrow().construct()) {
                case v: Description => v.getDes()
                case _ => ()
            }
        } catch (e: Exception) {}
    }
}

class GenericTest2<T1, T2> {
    public func getDes(): Unit {
        println("I am GenericTest2")
        try {
            let info1 = (ClassTypeInfo.of<T1>() as ClassTypeInfo).getOrThrow()
            let t1 = (info1.getInstanceFunction("getDes")).apply(info1.construct())
        } catch (e: Exception) {}
        try {
            let info2 = (ClassTypeInfo.of<T2>() as ClassTypeInfo).getOrThrow()
            let t2 = (info2.getInstanceFunction("getDes")).apply(info2.construct())
        } catch (e: Exception) {}
    }
}

main() {
    GenericTest1<TestA>().getDes()
    GenericTest2<TestA, TestB>().getDes()
}

/* SCAN

 */
