/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

unsafe main() {
    if (
        TestStruct.f1()==0
        && foo1() == 4
        && foo2() == 4
        && TestStruct.foo_public(1, 2) == 4
        && global_func_01()
    ) {
        return 0        
    } else {
        return 1
    }

}

