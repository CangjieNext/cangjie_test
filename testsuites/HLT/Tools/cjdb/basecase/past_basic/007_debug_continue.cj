/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



main() {   //设置断点：4-10 9和10行设置断点后，显示失败图标
    var indexcontinue: Int64 = 0
    while (indexcontinue < 50) {
        indexcontinue++
        if ((indexcontinue % 4 == 0) && (indexcontinue % 6 == 0)) {
            continue //在indexcontinue=12/24/36/48时进入continue
        }
    }
    return indexcontinue
}








