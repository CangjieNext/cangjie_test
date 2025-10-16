// LEVEL: 0
// DEPENDENCE: p1
// EXEC-PIPE-0:%compiler p1/test0.cj %compile_lib_opt -o test0.%middle
// EXEC-PIPE-1:%compiler test0.%middle test1.cj -o %output 2>&1 | compare %f

internal import test0.*

@A
class B {}

@A
interface C {}

@A
struct D {}

@A
enum E {x}

main() {}

/* SCAN
[31merror[0m: '@A' not applicable to type
 [36m==>[0m test1.cj:8:1:
  [36m| [0m
[36m8[0m [36m| [0m@A[0m
  [36m| [0m[31m^^ [0m
  [36m| [0m

[31merror[0m: '@A' not applicable to type
  [36m==>[0m test1.cj:11:1:
   [36m| [0m
[36m11[0m [36m| [0m@A[0m
   [36m| [0m[31m^^ [0m
   [36m| [0m

[31merror[0m: '@A' not applicable to type
  [36m==>[0m test1.cj:14:1:
   [36m| [0m
[36m14[0m [36m| [0m@A[0m
   [36m| [0m[31m^^ [0m
   [36m| [0m

[31merror[0m: '@A' not applicable to type
  [36m==>[0m test1.cj:17:1:
   [36m| [0m
[36m17[0m [36m| [0m@A[0m
   [36m| [0m[31m^^ [0m
   [36m| [0m

4 errors generated, 4 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
