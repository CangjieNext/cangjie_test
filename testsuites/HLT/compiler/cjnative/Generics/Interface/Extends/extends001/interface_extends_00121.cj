/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A<X> {
    operator func !(a: A<X>): Bool {
        return false
    }
}

main() {
    return 1
}
// ASSERT: scan sema_operator_overload_invalid_num_parameter
