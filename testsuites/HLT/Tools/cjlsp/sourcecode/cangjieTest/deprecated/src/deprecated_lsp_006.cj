/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

@Deprecated
foreign func rand(): Int32

@C
@Deprecated
func foos(): Unit {
    println("foo")
}

@Deprecated
var foo1: CFunc<() -> Unit> = {
    => println("foo1")
}

func testcase006(): Int64 {
    unsafe {
        rand()
        foos()
        foo1
    }
    0
}


@Deprecated
func f(): Unit {
    
}

func testsssDeprecated() {
    var sc: Clazz
    f()
}
