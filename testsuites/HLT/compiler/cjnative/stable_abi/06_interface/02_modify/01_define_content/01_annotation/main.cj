/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

class A <: I1 {}
class B {}
extend B <: I2 {}

main() {
    var str1 = "interface I1"
    var str2 = "interface I2"
    if (I1.typename() == str1 && I2.typename() == str2 &&
        A.typename() == str1 && B.typename() == str2) {
        0
    } else {
        1
    }
}
