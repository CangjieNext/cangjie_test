/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1.cj
// (not iOS) EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.%middle
// (not iOS) EXEC: %compiler %cmp_opt %f pkg1.%middle -o %output
// (not iOS) RUN-EXEC: %run %run_opt %output %run_args

package pkg2

import pkg1.*

class Data <: Base {
    public func get(): Int32 {
        return 2
    }
}

main() {
    return Base().get() + Data().get() - 3
}
