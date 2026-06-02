/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f -o %output


interface I<T> {} 
class A<T> {}

extend<T> C<T> <: I<T>{ 
  class A{} 
}

main(): Int64{
  return 0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
