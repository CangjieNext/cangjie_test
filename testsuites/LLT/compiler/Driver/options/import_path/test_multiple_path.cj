// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./folder01 ./folder02
// EXEC:%compiler %pkg_opt folder01/module01/src %compile_lib_opt -o folder01/module01/libmodule01.%lib_extension
// EXEC:%compiler %pkg_opt folder02/module02/src %compile_lib_opt -o folder02/module02/libmodule02.%lib_extension
//  EXEC:%compiler %f -L folder01/module01 -L folder02/module02 -l module01 -l module02 %import_path_opt ./folder01/module01 %import_path_opt ./folder02/module02 -o %output
// (not CJNATIVE) EXEC:%compiler %f folder01/module01/libmodule01.%lib_extension folder02/module02/libmodule02.%lib_extension %import_path_opt ./folder01/module01 %import_path_opt ./folder02/module02 -o %output
// EXEC:%run %run_opt %output %run_args | compare %f

internal import pkg.*
internal import pkg02.*

main() {
    println(GetHelloCangjie())
    println(FortyTwo())
}
/* SCAN
Hello cangjie!
42
*/
