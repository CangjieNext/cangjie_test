// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface Increasable {
    func increase(): Unit
}

struct R <: Increasable {
    var item = 0
}

extend R {
    public func increase(): Unit {
        this.item += 1
    }
}

main(){}