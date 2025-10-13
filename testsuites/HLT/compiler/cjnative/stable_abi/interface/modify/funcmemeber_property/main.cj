/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

unsafe main() {
    if (I1.f7() == 7 && I1.f9() == 9 && I1.f13() == 13
        && I1.f14() == 14 && I1.g1<Int64, Int64, Son>(1, 2, Son()) == "12"
        && I1.g2<Int64, String, Son>(1, "a", Son()) == "1"
        && I1.p1(1, b: 2) == 3
        && I1.p2(Son(), b: Son()) is Son && I1.p3(Father(), b: Father()) is Father
        && I1.prop_v1 == 1 && I1.prop_v3 == 3 && I1.prop_v5 == 5
        && I1.prop_v6 == 6) {
        return 0
    } else {
        return 1
    }
}
