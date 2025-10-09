/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


interface ToString {
    func toString() : String
}

struct String <: ToString { // Implement `ToString` interface directly.
    public func toString() : String {
        return this
    }
}

interface Hashable {
    func hashCode() : Int64
}

extend String <: Hashable { // Implement `Hashable` interface using extend.
    public func hashCode() : Int64 {
        return 0 // Not real implementation.
    }
}
main() {
    let r1 = String()

    return 0
}



