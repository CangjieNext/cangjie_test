package cjworld

import objc.lang.*
import std.core.*

@ObjCMirror
open class NSObject <: Object & ObjCId & ObjCId {
    let $obj: CPointer<Unit>
    func $getObj(): CPointer<Unit> {
        return this.$obj
    }
    func $getObjCClass(): CPointer<Unit> {
        return getClass("NSObject")
    }
    init($obj: CPointer<Unit>): NSObject {
        this.$obj = $obj

        return ()
    }
    var $hasInited: Bool = false
    ~init() {
        return objCRelease(this.$obj)
    }
}

@ObjCMirror
open class M <: NSObject & ObjCId {
    @ForeignName["init",]
    public init(): M {
        this(
            CFunc<CFunc<(CPointer<Unit>, CPointer<Unit>) -> CPointer<Unit>>>(objCMsgSend())(alloc("M"),
                registerName("init")))

        return ()
    }

    @ForeignName["className",]
    public static func className(): Unit {
        withAutoreleasePool<Unit>({
            => return unsafe {
                CFunc<CFunc<(CPointer<Unit>, CPointer<Unit>) -> Unit>>(objCMsgSend())($getObjCClass(),
                    registerName("className"))
            }
        })

        return ()
    }
    func $getObjCClass(): CPointer<Unit> {
        return getClass("M")
    }
    init($obj: CPointer<Unit>): M {
        super($obj)

        return ()
    }
    var $hasInited: Bool = false
    ~init() {
        return objCRelease(this.$obj)
    }
}
