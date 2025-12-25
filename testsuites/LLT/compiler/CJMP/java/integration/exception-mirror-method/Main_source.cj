package cj

import interoplib.interop.*
import java.lang.*

func getTypeForTypeParameter<T>(): CString

func getTypeForTypeParameter<T>(): CString

@JavaImpl
public class Main <: JObject {
    @ForeignName["main"]
    static public func entryPoint(args: JArray<JString>): Unit {
        print("Main()
", true)
        let obj: MyObject = MyObject(false).throwing()
        return ()
    }

    public init() {
        super({ =>
            let tmp4: CPointer<CPointer<JNINativeInterface_>> = Java_CFFI_get_env()
            return Java_CFFI_newGlobalReference(tmp4, Java_CFFI_newJavaObject(tmp4, Java_CFFI_ClassInit(Java_CFFI_get_env(), "cj/Main"), Java_CFFI_MethodIDConstr(Java_CFFI_get_env(), Java_CFFI_ClassInit(Java_CFFI_get_env(), "cj/Main"), "<init>", Java_CFFI_parseMethodSignature("(Lcangjie/lang/internal/$$NativeConstructorMarker;)V")), [Java_CFFI_JavaEntityJobjectNull()], Java_CFFI_JavaCallNestInit(1)), true)
        }())
        Java_CFFI_putToRegistry(Java_CFFI_get_env(), this.javaref, this)

    }

    public init(obj: Java_CFFI_JavaEntity) {
        super(obj)

    }

}

@C
public func Java_cj_Main_mainCN9java_1lang6JArrayICN9java_1lang7JStringEE(env: CPointer<CPointer<JNINativeInterface_>>, _: CPointer<Unit>, args: CPointer<Unit>) {
    return withExceptionHandling<Unit>(env, { =>
        let tmp1: Unit = Main.entryPoint(JArray<JString>(Java_CFFI_JavaEntityJobject(args)))
        return tmp1
    })
}

@C
public func Java_cj_Main_deleteCJObject(env: CPointer<CPointer<JNINativeInterface_>>, obj: CPointer<Unit>, self: Int64) {
    return withExceptionHandling<Unit>(env, { =>
        return Java_CFFI_deleteCJObject<Main>(env, self, { objToDelete: Main =>
            return objToDelete.javaref
        })
    })
}

@C
public func Java_cj_Main_initCJObject(env: CPointer<CPointer<JNINativeInterface_>>, obj: CPointer<Unit>) {
    return withExceptionHandling<Int64>(env, { =>
        return Java_CFFI_put_to_registry_1(Main(Java_CFFI_newGlobalReference(env, Java_CFFI_JavaEntityJobject(obj), true)))
    })
}

