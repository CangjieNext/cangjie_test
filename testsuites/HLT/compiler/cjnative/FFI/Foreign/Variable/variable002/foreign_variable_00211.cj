/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

foreign let a: Float64
foreign var b: Float64 = 1.0
foreign {
    var c: Float64
    let d: Float64 = 1.0
}
// ASSERT: scan sema_native_var_error
