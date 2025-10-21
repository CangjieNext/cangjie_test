/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Any

open class C8<T>{}
class C8_1 <:C8<Int32> {}
class C8_2<U> <:C8<U> {}

func testA8(){
    var x:Any = C8_1()
    x=C8_2<Int32>()
    x=C8<Int64>()
}
