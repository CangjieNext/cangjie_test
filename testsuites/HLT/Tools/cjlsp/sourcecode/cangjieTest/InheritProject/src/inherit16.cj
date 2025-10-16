/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
public open class AO {
    public mut open prop i1: Int64 {
        get() { 0 }
        set(v) {}
    }
    static mut prop i2: Int64 {
        get() { 0 }
        set(v) {}
    }
}

class BO <: AO {
    public override mut prop i1: Int64 {
        get() { 1 }
    }
    redef static mut prop i2: Int64 {
        get() { 1 }
    }
}

class BO2 <: AO {
    public override mut prop i1: Int64 {
        set(v) {}
    }
    redef static mut prop i2: Int64 {
        set(v) {}
    }
}


func test41(){
    var a = AO().i1
    var b = BO().i1
}
