/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.property.pkg

public class C1 {
    public var a: Int64 = 0
    public mut prop b: Int64 {
        get() {
            print("get")
            return a
        }
        set(value) {
            print("set")
            a = value
        }
    }
}

func test() {
    var x = C1()
    var y = x.b + 1
    x.b = y
    return 0
}
