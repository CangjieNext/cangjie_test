/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

unsafe main() {
    if (TestClass.f1() == 1 && TestClass.f4() == 3
        && TestClass.f6() == 5 && TestClass.f7() == 7
        && TestClass.f9() == 9 && TestClass.f13() == 13
        && TestClass.f14() == 14
        && TestClass.g1<Int64, Int64, Son>(1, 2, Son()) == "12"
        && TestClass.g2<Int64, String, Son>(1, "a", Son()) == "1"
        && TestClass.p1(1, b: 2, c: 3) == 6
        && TestClass.p2(Son(), b: Son()) is Son && TestClass.p3(Father(), b: Father()) is Father
        && TestStruct.f1() == 1 && TestStruct.f4() == 3
        && TestStruct.f6() == 5 && TestStruct.f7() == 7
        && TestStruct.f9() == 9 && TestStruct.f13() == 13
        && TestStruct.f14() == 14
        && TestStruct.g1<Int64, Int64, Son>(1, 2, Son()) == "12"
        && TestStruct.g2<Int64, String, Son>(1, "a", Son()) == "1"
        && TestStruct.p1(1, b: 2, c: 3) == 6
        && TestStruct.p2(Son(), b: Son()) is Son && TestStruct.p3(Father(), b: Father()) is Father) {
        return 0
    } else {
        return 1
    }
}
