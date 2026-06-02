/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public struct myStruct<T> <: MyInterface {
    var x = 10
    mut func f() {
        x = 20
    }
    public mut func foo1() {
        f()
    }
    public func foo4() {
        x
    }
}

public func call<T>(): Int64 {
    var s2: MyInterface = myStruct<MyInterface>()
    var s3: myStruct<MyInterface> = myStruct<MyInterface>()
    if (s2.foo2(()) == () && s2.foo4() == 20 && s2.foo3() == "success" && s3.foo3() == "success" && s3.foo2(()) == () &&
        s3.x == 20) {
        return 0
    } else {
        return 1
    }
}
