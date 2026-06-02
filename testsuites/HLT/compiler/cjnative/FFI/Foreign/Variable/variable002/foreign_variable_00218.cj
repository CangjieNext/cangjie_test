/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

foreign let a: List<Int32>
foreign var b: List<Int32> = [1]
foreign {
    var c: List<Int32>
    let d: List<Int32> = [1]
}
// ASSERT: scan sema_native_var_error
// ASSERT: scan sema_undeclared_type_name
