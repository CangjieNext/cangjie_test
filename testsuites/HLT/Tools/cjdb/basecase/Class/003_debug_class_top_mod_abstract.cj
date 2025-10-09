/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

abstract class Base {
    public func get() : Int32 {
        return 1
    }
}

class Data <: Base {

}



main(): Int64 {
    var value = Data()
    var getnum = value.get()
    if (value.get() != 1) {
        return 1
    }

    return 0
}
