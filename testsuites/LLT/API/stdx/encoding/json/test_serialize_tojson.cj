/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan "\\n" "dd\\rca" "sd\\fsx"
import stdx.encoding.json.*
import stdx.serialization.serialization.*

main() {
    let s = "\n".serialize().toJson().toString()
    let a = "dd\rca".serialize().toJson().toString()
    let b = "sd\fsx".serialize().toJson().toString()
    print(s + " ")
    print(a + " ")
    print(b)
    0
}
