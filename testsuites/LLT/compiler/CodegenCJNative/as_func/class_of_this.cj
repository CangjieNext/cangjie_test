// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A {
    public operator func ()() {
        print("operator func () of class A\n")
    }

    public func test() {
        this()
    }
}

func run() {
    let a = A()
    a.test()
    return 0
}

main(): Int64 {
    let res = run()
    return res
}

/* SCAN
error: invalid calling 'this' outside the constructor
  ==> class_of_this.cj:18:9:
   | 
18 |         this()
   |         ^ 
   | 

1 error generated, 1 error printed.
*/
