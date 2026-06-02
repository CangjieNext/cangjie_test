/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

foreign var a = 1
foreign let b = 1
foreign {
    var c = 1
    let d = 1
}

var a = 2
var b = 2
var c = 2
var d = 2
// ASSERT: scan sema_native_var_error
// ASSERT: scan sema_redefinition
