interface I {
    func f(): Unit {print("I")}
}
interface D {
    func f1(): Unit {print("D")}
}
class C {}
extend C <: I & D {
    public func f(): Unit {}
    public func f1(): Unit {}
}
main() {
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
