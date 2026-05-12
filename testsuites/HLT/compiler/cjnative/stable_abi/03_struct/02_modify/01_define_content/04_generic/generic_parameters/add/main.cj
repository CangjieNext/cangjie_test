/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    var a: Pair<String, Int64> = Pair<String, Int64>("hello", 0)

    if (a.first() != "hello" || a.second() !=0) {
        return 1
    }

    return 0
}


