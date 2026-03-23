// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package ohos_app_cangjie_entry

import ohos.ark_interop.*

func consume(cb: (JSContext, JSCallInfo) -> JSValue): JSValue {
    return cb(JSContext(), JSCallInfo())
}

main() {
    let cb = {ctx: JSContext, info: JSCallInfo =>
        let ret = JSValue()
        ret
    }
    consume(cb)
    0
}
