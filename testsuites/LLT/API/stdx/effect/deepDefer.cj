/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan je
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
import stdx.effect.*
import std.convert.*

class Get <: Command<String> {}
class Set <: Command<String> {}

main(args: Array<String>) {
    let number = Box<Int64>(100)
    try {
        try {
            println(perform Get())
        } handle (_: Set) {
            resume with "ja"
        }
        12
    } handle(_: Get){
        resume with "je"
    }
    0
}
