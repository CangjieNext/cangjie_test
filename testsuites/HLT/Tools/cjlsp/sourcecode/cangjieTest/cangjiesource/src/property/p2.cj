/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.property

class C2{
    prop a:Int64{
        get() {
            return 0
        }
    }
    mut prop b:Int64 {
        get(){
            return 0
        }
        set(v) {}
    }
}

func test2() {
    var x = C2()
    x.b = 2
    let y = C2()

}

