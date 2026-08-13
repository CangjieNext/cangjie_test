// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

public class AsyncError {
    public AsyncError(public let code: Int32) {}
}

public type AsyncCallback<T> = (Option<AsyncError>, Option<T>) -> Unit

public type ShowDialogCallBack = AsyncCallback<Int32>

public type ShowActionMenuCallBack = AsyncCallback<Int32>

public class ButtonInfo {
    public let text: String
    public let color: UInt32
    public let primary: Bool

    public init(text: String, color: UInt32, primary!: Bool = false) {
        this.text = text
        this.color = color
        this.primary = primary
    }
}

public open class ActionMenuOptions {
    let buttonsSize: UInt32

    public ActionMenuOptions(
        public let title!: String = '',
        public let buttons!: Array<ButtonInfo>,
        public let showInSubWindow!: Bool = false,
        public let isModal!: Bool = true
    ) {
        this.buttonsSize = UInt32(buttons.size)
    }
}

public class PromptAction {
    private static let defaultCallback = {_: Option<AsyncError>, _: Option<Int32> =>}

    public static func showDialog(title!: String = "", message!: String = "", buttons!: Array<ButtonInfo>,
        callback!: ShowDialogCallBack = defaultCallback) {
        unsafe {
            let ctitle = LibC.mallocCString(title)
            let cmessage = LibC.mallocCString(message)
            let wrapper = {
                code: Int32, index: Int32 => match (code) {
                    case 0 => callback(Option<AsyncError>.None, Option<Int32>.Some(index))
                    case _ => callback(Option<AsyncError>.Some(AsyncError(code)), Option<Int32>.None)
                }
            }
        }
    }
    public static func showActionMenu(option: ActionMenuOptions, callback!: ShowActionMenuCallBack = defaultCallback) {
        unsafe {
            let wrapper = {
                code: Int32, index: Int32 => match (code) {
                    case 0 => callback(Option<AsyncError>.None, Option<Int32>.Some(index))
                    case _ => callback(Option<AsyncError>.Some(AsyncError(code)), Option<Int32>.None)
                }
            }
        }
    }
}
