/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



main() { //设置断点： 4-10 9和10行设置断点后，显示失败图标
    var indexbreak: Int64 = 0
    while (indexbreak < 50) {
        indexbreak++ //indexbreak自++,当=12时，进入if的break语句
        if ((indexbreak % 4 == 0) && (indexbreak % 6 == 0)) {
            break
        }
    }
    return indexbreak
}







