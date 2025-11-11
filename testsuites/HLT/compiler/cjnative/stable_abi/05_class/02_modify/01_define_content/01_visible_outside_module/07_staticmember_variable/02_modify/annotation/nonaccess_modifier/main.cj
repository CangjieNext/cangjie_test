/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    let c0 = CC()

    if (CC.f1() == 1 && c0.f2() == 2
    && c0.f3() == 3) {
        return 0
    } else {
        return 1
    }

}


