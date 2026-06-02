// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan safe

open class A {
    protected open func print() {
        print("A")
    }
}

class B <: A {
    protected override func print() {
        print("B")
    };
    func bExclude() {}
}

class C <: A {
    protected override func print() {
        print("C")
    }
}

main() {
    let b: Array<B> = [B(), B()]
    let a = b as Array<C>
    match (a) {
        case Some(v) =>
            v[1] = C()
            takeB(b)
            print("oops")
        case None => print("safe")
    }
    ()
}

func takeB(b: Array<B>) {
    for (bb in b) {
        bb.print()
    }
}
