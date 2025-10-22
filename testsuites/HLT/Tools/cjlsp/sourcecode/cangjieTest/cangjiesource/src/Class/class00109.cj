/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Class

// 成员变量的定义调用
class A9 {
    var a: Int64 = 1
}
class B9 {
    var b: Int64 = 2
}

open class C9 {
    var c = 5
    var f = 10
}

class Data9 <: C9 {
    static var a = A9()
    var b = B9()
    var c = 3 // 子类成员变量遮盖父类的成员变量
    var d = 4
}

func test7() {
    var data = Data9()
    var a = Data9.a.a // 成员变量跳转
    var b = data.b.b // 成员变量跳转
    let b2 = Data9().b.b // 成员变量跳转
    let c = Data9().c // 成员变量跳转
    let d = data.d // 成员变量跳转
    var f = data.f // 子类调用继承自父类的成员变量,点击跳转到父类
}
