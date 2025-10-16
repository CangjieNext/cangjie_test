/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



main() { //设置断点：5/6/7
    var i8Number: Int8 = 127
    var i16Number: Int16 = 0
    i16Number = Int16(i8Number) // ok: i16Number = 127
    i8Number = Int8(i16Number) // ok: i8Number = 127

    var var1: Int64 = 9
    return var1
}






