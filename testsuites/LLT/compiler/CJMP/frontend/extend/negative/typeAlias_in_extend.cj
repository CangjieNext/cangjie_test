// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt --experimental --output-type=chir %f 2>&1 | compare %f

class Foo<T, U> {}

extend<T, U> Foo<T, U> {
    type Point1D = T 
}

main() {
}

/*SCAN
error: unexpected type alias declaration in extend body
  ==> typeAlias_in_extend.cj:12:5:
   | 
11 | extend<T, U> Foo<T, U> {
   | ~~~~~~ in extend
12 |     type Point1D = T 
   |     ^^^^ unexpected type alias declaration
   | 

1 error generated, 1 error printed.
*/