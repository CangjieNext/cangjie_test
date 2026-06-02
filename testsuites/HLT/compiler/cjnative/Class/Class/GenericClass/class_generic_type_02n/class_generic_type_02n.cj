/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkgs
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs/pkgs.cj -o pkgs.%middle
// ERRCHECK: %compiler %cmp_opt pkgs.%middle %f -o %output

import pkgs.Data<T>

func run(): Int64 {
var i: Int32 = 4
let data: Data<Int32> = Data<Int32>(i)
var res: Int64 = data.count
return 0
}

main(): Int64 {
return run()
}
// ASSERT: scan parse_expected_character
