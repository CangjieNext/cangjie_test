/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    if (global_func_04<A, A>() + global_func_05<A, A>() + global_func_06() == 0
    && global_func_07()) {
        return 0
    }
    return 1
}


