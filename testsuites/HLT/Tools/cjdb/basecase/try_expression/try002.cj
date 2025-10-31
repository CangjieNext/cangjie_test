/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A <: Exception {}

class B <: Exception {}

class C {}

extend C {
    public static func foo(): Int64 {
        throw A();
        1
    }
    public func bar(): Int64 {
        foo()
    }
}

main() {
    try {
        C().bar();
        ()
    } catch (a: A) {
        print("sucess")
    }
    return 0
}
