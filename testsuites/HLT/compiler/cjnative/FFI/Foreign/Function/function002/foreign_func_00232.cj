/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A {}

foreign func foo(a: A): A

foreign func bar(a: A): A
// ASSERT: scan sema_invalid_cfunc_arg_type
// ASSERT: scan sema_invalid_cfunc_return_type
