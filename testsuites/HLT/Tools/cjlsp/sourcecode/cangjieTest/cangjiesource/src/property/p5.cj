/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.property

open class C9 {
    public open mut prop i: Int64 {
        get() {
            return 0
        }
        set(v) {}
    }
}

class C9_1 <: C9 {
    mut prop ii: Int64 {
        get() {
            return 2
        }
        set(v) {}
    }
}


func test5(){
    var a = C9_1().ii
    
}
