/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ./dependency/module_global.pkg
// (CJNATIVE) EXEC: %compiler %cmp_opt %compile_lib_opt module_global.pkg/global_funcs_vars.cj --output-type=dylib -o module_global.%dylib_suffix

// (CJNATIVE) EXEC: %compiler %cmp_opt %f -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.reflect.*

@Test
class GlobalFunctionVariableTest {
    let pkgInfo = PackageInfo.load("module_global")

    @TestCase
    func testGlobalFunctionInfo(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let funcs = pkg.functions
        @Expect(funcs.size > 0)
        
        let globalFunc = pkg.getFunction("globalTestFunc1", Array<TypeInfo>())
        @Assert(globalFunc.name, "globalTestFunc1")
        
        let params = globalFunc.parameters
        @Assert(params.size, 0)
        
        let returnType = globalFunc.returnType
        @Assert(returnType.qualifiedName, "Int64")
        
        let result = globalFunc.apply(Array<Any>())
        @Assert((result as Int64).getOrThrow(), 42)
    }
    
    @TestCase
    func testGlobalFunctionInfoWithParams(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let globalFunc = pkg.getFunction("globalTestFunc2", [TypeInfo.of<Int64>(), TypeInfo.of<String>()])
        @Assert(globalFunc.name, "globalTestFunc2")
        
        let params = globalFunc.parameters
        @Assert(params.size, 2)
        
        @Assert(params[0].name, "a")
        @Assert(params[0].typeInfo.qualifiedName, "Int64")
        
        @Assert(params[1].name, "b")
        @Assert(params[1].typeInfo.qualifiedName, "String")
        
        let returnType = globalFunc.returnType
        @Assert(returnType.qualifiedName, "String")
        
        let result = globalFunc.apply([100, "test"])
        @Assert((result as String).getOrThrow(), "100test")
    }
    
    @TestCase
    func testGlobalVariableInfo(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let vars = pkg.variables
        @Expect(vars.size > 0)
        
        let globalVar = pkg.getVariable("globalTestVar1")
        @Assert(globalVar.name, "globalTestVar1")
        
        let typeInfo = globalVar.typeInfo
        @Assert(typeInfo.qualifiedName, "Int64")
        
        let value = globalVar.getValue()
        @Assert((value as Int64).getOrThrow(), 123)
        
        @Expect(globalVar.isMutable())
        
        globalVar.setValue(456)
        let newValue = globalVar.getValue()
        @Assert((newValue as Int64).getOrThrow(), 456)
        
        globalVar.setValue(123)
    }
    
    @TestCase
    func testImmutableGlobalVariable(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let globalVar = pkg.getVariable("globalTestVarImmutable")
        @Assert(globalVar.name, "globalTestVarImmutable")
        
        @Expect(!globalVar.isMutable())
        
        let value = globalVar.getValue()
        @Assert((value as String).getOrThrow(), "immutable")
        
        try {
            globalVar.setValue("new value")
            @Assert(false)
        } catch (e: IllegalSetException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testGlobalFunctionGenericParams(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let funcs = pkg.getFunctions("globalGenericFunc")
        @Assert(funcs.size, 1)
        
        let globalFunc = funcs[0]
        
        let genericParams = globalFunc.genericParams
        @Assert(genericParams.size, 1)
        
        let genericParam = genericParams.toArray()[0]
        @Assert(genericParam.name, "T")
    }
    
    @TestCase
    func testGetFunctionsMultiple(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let funcs = pkg.getFunctions("overloadedGlobalFunc")
        @Assert(funcs.size, 2)
        
        let func1 = pkg.getFunction("overloadedGlobalFunc", [TypeInfo.of<Int64>()])
        let func2 = pkg.getFunction("overloadedGlobalFunc", [TypeInfo.of<String>()])
        
        let result1 = func1.apply([100])
        @Assert((result1 as Int64).getOrThrow(), 100)
        
        let result2 = func2.apply(["hello"])
        @Assert((result2 as Int64).getOrThrow(), 5)
    }
    
    @TestCase
    func testGlobalFunctionInfoHashCode(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let func1 = pkg.getFunction("globalTestFunc1", Array<TypeInfo>())
        let func2 = pkg.getFunction("globalTestFunc1", Array<TypeInfo>())
        
        @Assert(func1.hashCode(), func2.hashCode())
    }
    
    @TestCase
    func testGlobalVariableInfoHashCode(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let var1 = pkg.getVariable("globalTestVar1")
        let var2 = pkg.getVariable("globalTestVar1")
        
        @Assert(var1.hashCode(), var2.hashCode())
    }
    
    @TestCase
    func testGlobalFunctionInfoToString(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let funcInfo = pkg.getFunction("globalTestFunc1", Array<TypeInfo>())
        let str = funcInfo.toString()
        
        @Expect(str.contains("globalTestFunc1"))
    }
    
    @TestCase
    func testGlobalVariableInfoToString(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let varInfo = pkg.getVariable("globalTestVar1")
        let str = varInfo.toString()
        
        @Expect(str.contains("globalTestVar1"))
    }
    
    @TestCase
    func testGlobalFunctionNotFound(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        try {
            pkg.getFunction("nonexistentFunc", Array<TypeInfo>())
            @Assert(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testGlobalVariableNotFound(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        try {
            pkg.getVariable("nonexistentVar")
            @Assert(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testGlobalVariableAnnotations(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let globalVar = pkg.getVariable("globalTestVar1")
        let annotations = globalVar.annotations
        
        @Assert(annotations.size, 0)
    }
    
    @TestCase
    func testGlobalFunctionAnnotations(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let globalFunc = pkg.getFunction("globalTestFunc1", Array<TypeInfo>())
        let annotations = globalFunc.annotations
        
        @Assert(annotations.size, 0)
    }
    
    @TestCase
    func testGlobalFunctionApplyWithTypeMismatch(): Unit {
        let pkg = PackageInfo.get("module_global.pkg")
        
        let globalFunc = pkg.getFunction("globalTestFunc2", [TypeInfo.of<Int64>(), TypeInfo.of<String>()])
        
        try {
            globalFunc.apply([100])
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true)
        }
    }
}