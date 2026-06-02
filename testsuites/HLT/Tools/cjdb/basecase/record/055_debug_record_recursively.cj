/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */





struct R2 {
    public let other: Box<R2>
}
class Box<T> {
    public var value: T
        public init(value: T) {
        this.value = value
    }
}
struct R5 {
    public let other: E1
}
enum E1 {
    A(R5)
}





