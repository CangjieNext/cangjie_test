/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*

class Style {
    var visibility: ?String = Option<String>.None
    var width: ?String = Option<String>.None
    var height: ?String = Option<String>.None
}

open public class MandreelBase {
    var style: Style = Style()
    var width: Float64 = 0.0;
    var height: Float64 = 0.0;
    var offsetLeft: Float32 = 0.0
    var offsetTop: Float32 = 0.0
    var parentNode: ?MandreelElement = Option<MandreelElement>.None;
    var clientWidth: Float64 = 0.0
    var clientHeight: Float64 = 0.0
    var contentWindow: ?MandreelBase = Option<MandreelBase>.None
    
    func receiveMessage(message: String) : Int64 {
       return 0
    }
    
    public open func getContext(str: String) : ImandreelCtxCanvas {
        return ImandreelCtxCanvas()
    }

}

class MandreelElement <: MandreelBase {
    var element_type: String
    var type_: ?String = Option<String>.None
    var text: ?String = Option<String>.None
    var src: String = ""
    var async: Bool = true
    var volume: Int64 = 0
       
    init(element_type: String) {
        super()
        this.element_type = element_type
    }
    
    func insertBefore(type_:?MandreelElement,name:?MandreelElement) : Unit {
        
    }
    
    func removeChild(type_:?MandreelElement) : Unit {
        
    }

}

class MandreelCanvas <: MandreelBase {
    
    public override func getContext(str: String) : ImandreelCtxCanvas {
        return ImandreelCtxCanvas()
    }
}

class MandreelCanvasDiv <: MandreelBase {
    
}

