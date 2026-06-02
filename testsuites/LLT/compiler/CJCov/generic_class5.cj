// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %output 2>&1 |compare %f

class Data<T> {
    var a: T
    init(x: T) {
        a = this.foo(x)
    }
    func foo(x: T): T {
        return x
    }
}

func run(): Int64 {
    var data: Data<Int32> = Data<Int32>(3)
    var res3: Int32 = data.a
    if (res3 == 3) {
        return 0
    }
    var d: Int32 = 2
    var data2 = Data(d)
    if (data2.foo(d) == Data(d).a) {
        return 0
    }
    var p = Data(4).foo(1)
    var q = Data(3).foo(1)
    if (p == q && p == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}

/* SCAN
error: 'foo' is not allowed to be accessed before all member variables are initialized
  ==> generic_class5.cj:12:13:
   | 
12 |         a = this.foo(x)
   |             ^ 
   | 

1 error generated, 1 error printed.
*/
