/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

foreign let a: Option<Int32>
foreign var b: Option<Int32> = None<Int32>
foreign {
    var c: Option<Int32>
    let d: Option<Int32> = None<Int32>
}
// ASSERT: scan sema_native_var_error
