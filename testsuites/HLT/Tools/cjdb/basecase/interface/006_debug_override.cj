/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class C1 {
    public open func f(): Unit {
        return
    }
}

class C2 <: C1 {
    public override func f(): Unit {
        return
    }
}

main() {
    var myC1 = C1()
    var myC2 = C2()

    // Assign the object of the superclass C1 to the variable of the C1 type
    var a: C1 = myC1
    // Assign the object of the superclass C2 to the variable of the C1 type
    var b: C1 = myC2

    // Invokes f of C1 based on the object type of at runtime
    var c = a.f()
    // Invokes f of C2 based on the object type of at runtime
    var d = b.f()
    return 1
}



