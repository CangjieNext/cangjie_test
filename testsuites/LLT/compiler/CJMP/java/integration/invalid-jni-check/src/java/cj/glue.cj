// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjworld.cjworld

import interoplib.interop.*

@C
public func Java_com_java_lib_A_initCJObject(env: JNIEnv_ptr, obj: jobject): jlong {
    withExceptionHandling(env) {
        let a = A(Java_CFFI_newGlobalReference(env, Java_CFFI_JavaEntity(JOBJECT, obj), true))
        Java_CFFI_put_to_registry_1(a)
    }
}

@C
public func Java_com_java_lib_A_deleteCJObject(env: JNIEnv_ptr, clazz: jclass, self: jlong): Unit {
    withExceptionHandling(env) {
        Java_CFFI_deleteCJObject<A>(env, self) { v => v.obj }
    }
}

@C
public func Java_com_java_lib_A_gooImpl(env: JNIEnv_ptr, _: jclass, self: jlong): Unit {
    withExceptionHandling(env) {
        let v = Java_CFFI_getFromRegistry<A>(env, self)
        v.goo(env)
    }
}

public open class A {
    let obj: Java_CFFI_JavaEntity

    init(obj: Java_CFFI_JavaEntity) {
        this.obj = obj
    }

    public func goo(env: JNIEnv_ptr): Unit {
        print("Hello from A goo()\n")

        let clazz = Java_CFFI_Class(env, "Lcom/java/lib/JavaClass;")
        let signature = Java_CFFI_parseMethodSignature("()V")
        let id = Java_CFFI_MethodID.constr(env, clazz, "foo", signature)
        Java_CFFI_callVirtualMethod(env, obj, id, [], Java_CFFI_JavaCallNest(0))
    }
}
