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

    if (c0.a1 == 10 && c0.a2 == 20
    && c0.f1 == 10 && c0.f2 == 20
    && c0.g1 == 10 && c0.h2() == 10) {
        return 0        
    } else {
        return 1
    }

}


