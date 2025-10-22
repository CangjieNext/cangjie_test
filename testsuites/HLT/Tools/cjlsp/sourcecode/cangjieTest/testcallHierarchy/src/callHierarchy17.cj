/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

struct A_1{
    public operator func +(b:B_1):Int32{return 1}
}

struct B_1{
    public operator func +(b:B_1):Int32{return 2}
}

func f11():Int64{
    var a = A_1()
    var b = B_1()
    a + b 
    return 0
}
