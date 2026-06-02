/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    if (
        C1().f_c1() == 1 && C2().f_c2() == 2
        && C3<Int64, Int64>().f_c3() == 3 
        && C4().f_c1() == 1 && C4().f_c4() == 4
        && C5<Int64, I1>().f_c5() == 5 
        && S1().f_s1() == 1 && S2<Int64, C1>().f_s2() == 2
        && global_func_01()
    ) {
        return 0
    } else {
        return 1
    }
}

