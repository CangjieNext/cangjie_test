// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./folder02 ./folder03
// EXEC:%compiler %pkg_opt folder02/module02/src --output-type=staticlib -o folder02/module02/libmodule02.a
// EXEC:%compiler %pkg_opt folder03/module02/src --output-type=staticlib -o folder03/module02/libmodule02.a
// (Linux) EXEC:CANGJIE_PATH=./folder02:$CANGJIE_PATH %compiler %f -L folder02/module02 -l module02 %import_path_opt ./folder03/module02 %noColor -o %output  2>&1 | compare %f
// (Windows) EXEC: (set CANGJIE_PATH=.\folder02;%CANGJIE_PATH%) && %compiler %f -L folder02/module02 -l module02 %import_path_opt ./folder03/module02 -o %output %noColor 2>&1 | compare %f

internal import pkg02.*

main() {
    println(FortyTwo())
}

/* SCAN
error: undeclared identifier 'FortyTwo'
  ==> test_order_error.cj:16:13:
   | 
16 |     println(FortyTwo())
   |             ^ 
   | 

1 error generated, 1 error printed.
*/
