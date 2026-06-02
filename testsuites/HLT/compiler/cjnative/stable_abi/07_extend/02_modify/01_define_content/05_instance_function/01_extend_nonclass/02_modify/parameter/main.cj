/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

unsafe main() {
    let ts = TestStruct()

    if (
        ts.f1() == 1 && ts.f4() == 3
        && ts.f6() == 5
        && ts.f8() == 8 && ts.f13() == 13 && ts.f14() == 14
        && ts.g1<Int64, Int64, Son>(1, 2, Son()) == "12"
        && ts.g2<Int64, String, Son>(1, "a", Son()) == "1"
        && ts.p1(1, b: 2, c: 3) == 6
        && ts.p2(Son(), b: Son()) is Son && ts.p3(Father(), b: Father()) is Father
        && global_func_01()
    ) {
        return 0
    } else {
        return 1
    }

}


