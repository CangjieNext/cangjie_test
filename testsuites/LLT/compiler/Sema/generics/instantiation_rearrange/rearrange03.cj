// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output

public interface I_Buddy {
    mut func foo_Buddy(): Int64
    static func boo_Buddy<T>(): Int64
}

public interface I <: I_Buddy {
    mut func foo() {
        1
    }
    static func boo<T>() {
        1
    }

    mut func foo_Buddy(): Int64 {
        return foo()
    }

    static func boo_Buddy<T>(): Int64 {
        return boo<T>()
    }
}

public class S <: I {
    public func foo() {
        0
    }
    public static func boo<T>() {
        0
    }
}

public func test<M>(mOrig: M) where M <: I_Buddy {
    var m = mOrig 
    m.foo_Buddy()
    M.boo_Buddy<Int64>()
}

main(): Unit {
    test(S())
}