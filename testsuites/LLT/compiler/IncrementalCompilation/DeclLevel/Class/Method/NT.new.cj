

class A {
    private static 
    func a() { 1 }
    public static 
    func b() { a() }
    func c(a:Int32, b:Int32)
    { a+b }

    
}

struct B {
    func a() {
        A.b()
    }
}

main() { B().a() }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
