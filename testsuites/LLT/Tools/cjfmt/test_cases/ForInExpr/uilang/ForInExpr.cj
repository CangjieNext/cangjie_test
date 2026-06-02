// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Int64 {
let intList: List<Int32> = [0, 1, 2, 3, 4]
for (item in intList) {
print(item) // output: 01234
}
let intRange = 0..5
for (i in 0..3 where i < 2) {
        println(i)
    }
for (i in 1..11  : 2) {}
return 0
}