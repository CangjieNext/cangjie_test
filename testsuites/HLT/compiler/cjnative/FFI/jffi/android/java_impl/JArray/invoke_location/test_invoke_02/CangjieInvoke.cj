/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// (Android) DEPENDENCE: com MainInstrumentedTest.java 
// (Android) EXEC: python3 %java_interop_setup
// (Android) EXEC: %javac com/*.java %java_interop_template/app/src/main/java/com/example/myapplication/Logger.java
// (Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f logger.cj --output-javagen-dir=%java_interop_template/app/src/main/java/UNNAMED
// (Android) EXEC: python3 %java_interop_runner --test-entry=MainInstrumentedTest.java --java-source-root=com

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaMirror["com.AbstractMirror"]
public open class AbstractMirror {
    public mut prop aBoolean: JArray<Bool>

    public mut prop aInt: JArray<Int32>

    public mut static prop arrayInt: JArray<Int32>

    public init(arg0: JArray<Int32>) 

    public init() 
}

@JavaMirror["com.ImplAbstractMirror"]
public open class ImplAbstractMirror <: AbstractMirror {
    public init(arg0: JArray<Int32>) 

    public open func getAInt(): JArray<Int32>

    public open func setAInt(arg0: JArray<Int32>): Unit

    public static func getArrayInt(): JArray<Int32>

    public static func setArrayInt(arg0: JArray<Int32>): Unit

    public init() 
}

@JavaImpl
public class TestClass <: ImplAbstractMirror {
    public init(aInt: JArray<Int32>) {
        super(aInt)
        Logger.println("original-1 instance aInt[9]: ${AbstractMirror(aInt).aInt[9]}")
        let arr1 = JArray<Int32>(100)
        for (i in 0i32..30i32) {
            arr1[i] = 10 * i
        }

        Logger.println("original-1 static arrayInt[9]: ${AbstractMirror.arrayInt[9]}")
        TestClass.setArrayInt(arr1)
        Logger.println("changed-1 instance aInt[9]: ${AbstractMirror.arrayInt[9]}")
    }
}

@JavaImpl
public class Impl <: JObject {
    public init() {
        let arr = JArray<Int32>(10)
        for (i in 0i32..10i32) {
            arr[i] = 2 * i
        }
        TestClass(arr)
    }
}
