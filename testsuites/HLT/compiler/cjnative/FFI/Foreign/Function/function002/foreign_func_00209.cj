/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

foreign func foo(a: Float16): Float16

foreign func bar(a: Float16): Float16

main() {}
// ASSERT: scan sema_invalid_cfunc_arg_type
// ASSERT: scan sema_invalid_cfunc_return_type
