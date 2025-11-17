/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

//静态嵌套类，暂不支持
//class C1 {
//    public class C2 {}
//    class C3 {} // public is the default modifier
//}

open class C1 {
    public func f(): This {  // its type is `() -> C1`
        this
    }
}

class C2 <: C1 {
    // member function f is inherited from C1, and its type is `() -> C2` now
}




main() {
    var obj1: C2 = C2()
    var obj2: C1 = C2()

    var x = obj1.f() // During compilation, the type of x is C2
    var y = obj2.f() // During compilation, the type of y is C1
    return 0
}



