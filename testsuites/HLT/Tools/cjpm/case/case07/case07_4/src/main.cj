/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

func foo(): Int64 {
    var count = 0
    while (count < 10) {
        if (count == 5) {
            print("Count reached 5, breaking out of loop.")
            break
        } else {
            if (count == 7) {
                print("Count is 7, but continuing the loop.")
            } else {
                print("Continuing with count.")
            }
        }
        count = count + 1
    }
    return 0
}

main() {
    foo()
    0
}
