/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    if (Rectangle.a1 == 20 && Rectangle.a9 == 20 && Rectangle.a11 == 20 && f() == 0) {
        return 0
    }

    return 1
}


