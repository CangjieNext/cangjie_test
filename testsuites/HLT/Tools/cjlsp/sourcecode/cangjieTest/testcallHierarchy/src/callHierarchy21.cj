/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

public open class A6<T>{
    public static func name_1<T>():Unit {}
}

class B6 <: A6<Bool> {
    public static redef func name_1<T>():Unit {}
}

func test6() {
    var b = B6.name_1<Int64>()
}
