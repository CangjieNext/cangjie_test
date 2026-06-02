// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pab
// EXEC: %compiler %pkg_opt pab/pa %compile_lib_opt -o libpab.pa.%middle 
// EXEC: %compiler %pkg_opt pab/pb libpab.pa.%middle %compile_lib_opt -o libpab.pb.%middle 
// DEPENDENCE: ../pcd
// EXEC: %compiler %pkg_opt pcd/pc %compile_lib_opt -o libpcd.pc.%middle 
// EXEC: %compiler %pkg_opt pcd/pd libpcd.pc.%middle %compile_lib_opt -o libpcd.pd.%middle 
// DEPENDENCE: .
// (CJNATIVE) EXEC: %compiler %pkg_opt pe libpab.pb.%middle libpab.pa.%middle libpcd.pd.%middle libpcd.pc.%middle 
// (not CJNATIVE) EXEC: %compiler %pkg_opt pe libpab.pa.%middle libpab.pb.%middle libpcd.pc.%middle libpcd.pd.%middle 
// EXEC: %run %main

package pe

import pab.pb.*
import pcd.pc.*
import pcd.pd.*

main() {
    let a = [1, 2, 3]
    let v = a.f()
}
