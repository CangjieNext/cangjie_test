struct A<T> {}

type AA<T, K> = A<T, K>

main() {}

/* SCAN-IN
error: type argument's number does not match type parameter's number
 ==> inc.cj:3:17:
  | 
3 | type AA<T, K> = A<T, K>
  |                 ^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
