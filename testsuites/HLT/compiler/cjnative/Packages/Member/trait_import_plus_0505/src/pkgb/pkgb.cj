/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgb
import pkga.*


public trait Color<T> {
    func addcolor(a: This,b:T):T
}

public func boo():Int64{
    var b0: Int64 = 2
    var b: pkga.Fruit<Int64> = pkga.Fruit<Int64>(b0)
    var v1: Int64 = 2
    var v2: Int64 = 2
//    }
    if (addcolor(pkga.a,v2) != 2){
        return 1
    }
    if (addcolor(b,v2) != 2){
        return 1
    }
//    }
    return 0
}

