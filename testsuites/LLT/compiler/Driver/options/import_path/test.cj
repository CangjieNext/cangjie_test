// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./folder01
// EXEC:%compiler %pkg_opt folder01/module01/src %compile_lib_opt -o folder01/module01/libpkg.%lib_extension
//  EXEC:%compiler %f -L folder01/module01 -l pkg %import_path_opt ./folder01/module01 -o %output
// (not CJNATIVE) EXEC:%compiler %f folder01/module01/libpkg.%lib_extension %import_path_opt ./folder01/module01 -o %output
// EXEC:%pwd_to_ld_path %run %output | compare %f

internal import pkg.*

main() {
    println(GetHelloCangjie())
}
/* SCAN
Hello cangjie!
*/
