/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    if ((global_func_03() + global_var_06 + global_var_07 + global_var_08 + global_func_01() + global_func_02() & 1) == 0) {
        return 0
    }
    return 1
}


