/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
@CallingConv[CDECL]
@C
func cptrc(a: CPointer<Int8>): CPointer<Int8> {
    var b: CPointer<Int8> = a
    unsafe { b.write(0,49) }
    return b
}

@C
@CallingConv[CDECL]
foreign {
    func get_cptrc(cb: CFunc<(CPointer<Int8>)->CPointer<Int8>>): CPointer<Int8>
    func printf(fmt: CString): Int32
    func free(cp: CPointer<Int8>): Unit
}

unsafe func test16():Int64 {
    var res: CPointer<Int8> = get_cptrc(cptrc)
    if (res.read() == 49) {
        free(res)
        return 0
    } else {
        return 1
    }
}
