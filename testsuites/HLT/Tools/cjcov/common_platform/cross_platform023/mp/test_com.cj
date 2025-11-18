/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common class C {
    public func f1(){
        var a = 1
    }
    public static func f2() {
        var b = 2
    }
}

common extend C {
    public common func f(a: Int64): Int64 {
        a
    }
}
