/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg3

import pkg1.*
import pkg2.*

public func call<T>(): Int64 {
    var s1: faterInterface<Rune> = myStruct1<Bool>()
    var s2: MyInterface = myStruct1<Bool>()
    var s3: myStruct1<Bool> = myStruct1<Bool>()
    var s4: myStruct2<Bool> = myStruct2<Bool>()
    var s5: myStruct3<Bool> = myStruct3<Bool>()

    if (s1.foo2(r'1') == r'a' && s1.foo3() == r'a' && s2.foo2(r'1') == r'a' && s2.foo3() == r'a' && s3.foo2(r'1') == r'a' &&
        s4.foo2(r'1') == r'b' && s5.foo2(r'1') == r'c' && s3.x == r'a' && s4.x == r'b' && s5.x == r'c') {
        return 0
    } else {
        return 1
    }
}
