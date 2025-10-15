// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %f -o %output %dumpCHIRDebug %enableO2
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output
// (Linux and CJNATIVE and DEBUG_OPTION) EXEC: sed -n -r '/Func @_CN7default18CanvasRendererBase16createShapeImageHv/,/^}$/p' baserd_CHIR/0_AST_CHIR.chir | compare %f

public open class BaseElement {
    public var buildElementParentingInComp: (BaseElement, Int64) -> Unit = {_, _ => ()}
}

public open class BaseRenderer {
    public open func buildItem(_: Int64): Unit {}
    public func buildElementParenting(_: BaseElement, parent: Int64) {
        buildItem(parent)
    }
}

public class CanvasRendererBase <: BaseRenderer {
    public func buildItem(_: Int64) {
        println("CanvasRendererBase::buildItem")
    }

    public func createShapeImage() {
        let a = BaseElement()
        a.buildElementParentingInComp = this.buildElementParenting
        a
    }
}

main() {
    let a = CanvasRendererBase()
    let element = a.createShapeImage()
    element.buildElementParentingInComp(element, 0)
    ()
}
// ASSERT: scan Void = Apply(ThisType: Class-_CN7default11BaseElementE&, Class-_CN7default11BaseElementE&::@_CN7default11BaseElement6<init>Hv : (Class-_CN7default11BaseElementE&) -> Void,
