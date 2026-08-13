// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

public class AsyncError {
    public AsyncError(public let code: Int32) {}
}

public type AsyncCallback<T> = (Option<AsyncError>, Array<T>) -> Unit

public type ShowDialogCallBack = AsyncCallback<Int32>

public class PromptAction {
    private static let defaultCallback = {_: Option<AsyncError>, _: Array<Int32> =>}

    public static func showDialog(title!: String = "", message!: String = "",
        callback!: ShowDialogCallBack = defaultCallback) {
        unsafe {
            let ctitle = LibC.mallocCString(title)
            let cmessage = LibC.mallocCString(message)
            let wrapper = {
                code: Int32, index: Int32 => match (code) {
                    case 0 => callback(Option<AsyncError>.None, Array<Int32>(3, repeat:index))
                    case _ => callback(Option<AsyncError>.Some(AsyncError(code)), Array<Int32>())
                }
            }
        }
    }
}
