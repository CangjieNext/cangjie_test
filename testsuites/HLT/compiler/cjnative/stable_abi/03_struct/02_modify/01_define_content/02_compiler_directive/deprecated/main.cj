/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    if (S1().getX() == 0 && S7().getX() == 0 && S3().getX() == 0 && S12().getX() == 0 && f() == 0) {
        return 0
    }
    return 1
}


