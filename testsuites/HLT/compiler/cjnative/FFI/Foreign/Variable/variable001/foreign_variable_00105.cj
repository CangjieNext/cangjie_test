/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

foreign let a: Int64 = 1
foreign var b: Int64 = 2
foreign {
    let c: Int64 = 3
    var d: Int64 = 4
}

main() {
    a = 2
    b = 3
    c = 4
    d = 5
}
// ASSERT: scan sema_native_var_error
// ASSERT: scan sema_cannot_assign_to_immutable
