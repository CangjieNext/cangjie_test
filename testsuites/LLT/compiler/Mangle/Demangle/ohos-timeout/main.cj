// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) DEPENDENCE: base.cj
// (CJNATIVE) EXEC: %compiler %cmp_opt %compile_lib_opt base.cj -o libohos.base.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt libohos.base.%middle %f -o %output 
// (CJNATIVE) EXEC-1: %output 
// (CJNATIVE) TIMEOUT: 90

package ohos.component

import ohos.base.*

public struct Position {}

public enum Placement {
    X
}

public struct Action {}

public struct StateChangeEvent {}

public struct PopupMessageOptions {}

public enum ArrowPointPosition {
    X
}

public enum ShadowStyle {
    X
}

public enum BlurStyle {
    X
}

public class TransitionEffect {}

public struct DismissPopupAction {}

public struct PopupOptions {
    public PopupOptions(
        public var message!: String,
        public var placementOnTop!: Bool = false,
        public var primaryButton!: Action = Action(),
        public var secondaryButton!: Action = {=> throw Exception()}(),
        public var onStateChange!: Option<(StateChangeEvent) -> Unit> = Option.None,
        public var messageOptions!: PopupMessageOptions = PopupMessageOptions(),
        public var arrowOffset!: Length = Length(),
        public var showInSubWindow!: Bool = false,
        public var mask!: Color = Color(),
        public var targetSpace!: Length = Length(),
        public var placement!: ?Placement = Option.None,
        public var offset!: Position = Position(),
        public var enableArrow!: Bool = true,
        public var popupColor!: Color = Color(),
        public var autoCancel!: Bool = true,
        public var width!: Length = Length(),
        public var arrowPointPosition!: Option<ArrowPointPosition> = None,
        public var arrowWidth!: Length = Length(),
        public var arrowHeight!: Length = Length(),
        public var radius!: Length = Length(),
        public var shadow!: ShadowStyle = ShadowStyle.X,
        public var backgroundBlurStyle!: BlurStyle = BlurStyle.X,
        public var transition!: Option<TransitionEffect> = Option.None,
        public var onWillDismiss!: Option<(DismissPopupAction) -> Unit> = None,
        public var followTransformOfTarget!: Bool = false
    ) {}
}

main() {
    let p = PopupOptions(message: "x");
    0
}
