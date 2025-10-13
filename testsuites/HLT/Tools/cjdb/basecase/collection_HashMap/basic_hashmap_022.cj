import std.collection.*

class Data {
    public Data(var a: HashMap<Int32, Bool>) {
        this.a = a
    }
}

main() {
    var value: Data = Data(HashMap<Int32, Bool>([(1, true), (2, false)]))
    0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
