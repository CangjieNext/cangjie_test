/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

class C1 <: S1 {}
class C2 <: S2 {}
main() {
    if (I<S2, S1, Int64>.g(C2(), C1()) == 1) {
        return 0        
    } else {
        return 1
    }
}
