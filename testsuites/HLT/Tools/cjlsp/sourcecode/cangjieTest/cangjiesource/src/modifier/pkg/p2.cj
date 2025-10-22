/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.modifier.pkg

public struct Rect {
    public var aa: Int64= 1
    private func test2() {}
    func test3() {}
    public static let NUM:Int64 = 1
    private static var num1 = 1
    static var num2 = 2
}

func t2() {
    var c1 = Rect()
    c1.aa
    var c2 = Rect.NUM

}
