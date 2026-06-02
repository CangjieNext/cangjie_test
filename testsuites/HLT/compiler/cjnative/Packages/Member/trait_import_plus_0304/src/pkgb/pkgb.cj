/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgb
import pkga.*

append String with Color {
    func addcolor(a: String,b:Int64): String {
        return a+b.toString()
    }
}

public func boo():Int64{
    var b: String = "b"
    var v1: String = "abc"
    var v2: Int64 = 123
    if (pkga.a.addcolor(v2) != "a123"){
        return 1
    }
    if (addcolor(pkga.a,v2) != "a123"){
        return 1
    }
    if (b.addcolor(v2) != "b123"){
        return 1
    }
    if (addcolor(v1,v2) != "abc123"){
        return 1
    }
    return 0
}

