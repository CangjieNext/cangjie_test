// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./folder02 ./folder03
// EXEC:%compiler %pkg_opt folder02/module02/src %compile_lib_opt -o folder02/module02/libmodule02.%lib_extension
// EXEC:%compiler %pkg_opt folder03/module02/src %compile_lib_opt -o folder03/module02/libmodule02.%lib_extension
// (CJNATIVE and not Windows) EXEC:CANGJIE_PATH=./folder03:$CANGJIE_PATH %compiler %f -L folder02/module02 -l module02 %import_path_opt ./folder02/module02 -o %output
// (CJNATIVE and Windows) EXEC: set CANGJIE_PATH=.\folder03;%CANGJIE_PATH%&&%compiler %f -L folder02/module02 -l module02 %import_path_opt ./folder02/module02 -o %output
// (not CJNATIVE) EXEC:CANGJIE_PATH=./folder03:$CANGJIE_PATH %compiler %f folder02/module02/libmodule02.%lib_extension %import_path_opt ./folder02/module02 -o %output
// EXEC:%run %run_opt %output %run_args | compare %f

internal import pkg02.*

main() {
    println(FortyTwo())
}
/* SCAN
42
*/
