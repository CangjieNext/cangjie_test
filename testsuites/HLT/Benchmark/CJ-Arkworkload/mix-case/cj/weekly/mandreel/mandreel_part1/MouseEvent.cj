/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


class MouseEvent{
    var clientX: Float64 = 0.0
    var clientY: Float64 = 0.0
    var movementX: Float64 = 0.0
    var webkitMovementX: Float64 = 0.0
    var mozMovementX: Float64 = 0.0
    var movementY: Float64 = 0.0
    var webkitMovementY: Float64 = 0.0
    var mozMovementY: Float64 = 0.0
    var keyCode: Float64 = 0.0
    var which: Float64 = 0.0
    var wheelDelta: Float64 = 0.0
    var returnValue: Bool = false
    func preventDefault() : Unit{
        
    }
}
