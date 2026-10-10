// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package my_iface
public interface IGreeter {
    func greet(): String
}
public class EnglishGreeter <: IGreeter {
    public func greet(): String {
        return "Hello"
    }
}
public func useGreeter(g: IGreeter): String {
    return g.greet()
}
public func deadIfaceFunc(): String {
    return "dead"
}
