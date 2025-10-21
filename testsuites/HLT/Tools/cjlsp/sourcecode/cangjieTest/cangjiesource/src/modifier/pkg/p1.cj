/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.modifier.pkg

public class Rectange {
    public var aa: Int64= 1
    protected func test1() {}
    private func test2() {}
    func test3() {}
    public static let NUM:Int64 = 1
    protected static func teststatic() {}
    private static var num1 = 1
    static var num2 = 2
}

func t1() {
    var a1 = Rectange()
    a1.test1()
    var a2 = Rectange.NUM

}
