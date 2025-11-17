/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

unsafe main() {
    if (
        TestClass.f1(1) == 1 && TestClass.f4() == 3
        && TestClass.f6() == 5 && TestClass.f9() == 9 &&
        TestClass.f13() == 13 && TestClass.f14() == 14
        && TestClass.p1(Son(),Father()) is Father
        && TestClass.p4() is Father
        && TestClass.p6() is Father
        && global_func_01()
    ) {
        return 0
    } else {
        return 1
    }
}


