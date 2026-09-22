/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func withInlineComments(a: Int64): Int64 {
    let r=a /* mid */ + /* pre */ 1 // tail
    /* if (a) { } else { } */
    // let fake=fakeCall(1, 2)
    let s=2 /**/ +3
    return r+s
}

/*
 * block comment with code:
 * while (x-->0) { y+++1 }
 */
main() {
    println(withInlineComments(1))
}
