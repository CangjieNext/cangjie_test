/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
type mytype = Int32

foreign let a: mytype
foreign var b: mytype = 1
foreign {
    var c: mytype
    let d: mytype = 1
}
// ASSERT: scan sema_native_var_error
