/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

main() {
    if (Generics_C<Father, Son>().foo1() == 1
        && Generics_S<Father, Son>().foo2() == 2) {
        return 0
    } else {
        return 1
    }
}
