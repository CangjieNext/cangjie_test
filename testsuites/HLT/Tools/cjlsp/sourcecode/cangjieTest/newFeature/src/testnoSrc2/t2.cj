/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testnoSrc2

public func fb():Unit{}

public interface IIA{
    func f1():Unit
    static func f2():Unit
}

public class SA <: IIA{
    public SA(z:Int64){}
    public func f1():Unit {}
    public static func f2():Unit{}
}


