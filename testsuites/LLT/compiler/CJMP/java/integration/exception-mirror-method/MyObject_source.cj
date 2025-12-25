package cj

import interoplib.interop.*
import java.lang.JObject

@JavaMirror["com.java.lib.MyObject"]
open class MyObject <: JObject {
    public init(throwing: Bool) {
        this({ =>
            let tmp2: CPointer<CPointer<JNINativeInterface_>> = Java_CFFI_get_env()
            return Java_CFFI_newJavaObject(tmp2, Java_CFFI_ClassInit(Java_CFFI_get_env(), "com/java/lib/MyObject"), Java_CFFI_MethodIDConstr(Java_CFFI_get_env(), Java_CFFI_ClassInit(Java_CFFI_get_env(), "com/java/lib/MyObject"), "<init>", Java_CFFI_parseMethodSignature("(Z)V")), [Java_CFFI_JavaEntity(throwing)], Java_CFFI_JavaCallNestInit(1))
        }())

    }

    public func throwing(): MyObject {
        let tmp3: Java_CFFI_JavaEntity = Java_CFFI_callVirtualMethod(Java_CFFI_get_env(), this.javaref, Java_CFFI_MethodIDConstr(Java_CFFI_get_env(), Java_CFFI_ClassInit(Java_CFFI_get_env(), "com/java/lib/MyObject"), "throwing", Java_CFFI_parseMethodSignature("()Lcom/java/lib/MyObject;")), [], Java_CFFI_JavaCallNestInit(0))
        return MyObject(tmp3)
    }

    public init(ref: Java_CFFI_JavaEntity) {
        super(ref)

    }

    private var hasInited: Bool = false

    private func ~init() {
        return Java_CFFI_deleteGlobalReference(Java_CFFI_get_env(), this.javaref)
    }

}

