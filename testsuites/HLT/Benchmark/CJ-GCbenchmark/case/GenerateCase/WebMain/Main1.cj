/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public open class Main1 {
public static func f0(): Unit {
	Main0.Main0_globalVar_3.getOrThrow().java_lang_Module_loader = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_2.getOrThrow().java_lang_ClassLoader_unnamedModule = turnClass(Main0.Main0_globalVar_3)
	jdk_internal_loader_ClassLoaders.jdk_internal_loader_ClassLoaders_APP_LOADER = turnClass(Main0.Main0_globalVar_2)
	jdk_internal_module_ModuleLoaderMap_Mapper.jdk_internal_module_ModuleLoaderMap_Mapper_APP_CLASSLOADER = turnClass(Main0.Main0_globalVar_2)
	java_lang_ClassLoader.java_lang_ClassLoader_scl = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_4.getOrThrow().java_lang_Thread_contextClassLoader = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_5.getOrThrow().java_lang_Thread_contextClassLoader = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_6.getOrThrow().java_lang_Thread_contextClassLoader = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_1.getOrThrow().java_lang_Class_classLoader = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_1.getOrThrow().java_lang_Class_module = turnClass(Main0.Main0_globalVar_3)
	Main0.Main0_globalVar_7.getOrThrow().java_lang_Thread_contextClassLoader = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_8.getOrThrow().java_lang_Thread_contextClassLoader = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_9.getOrThrow().java_lang_Thread_contextClassLoader = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_11.getOrThrow().java_lang_Class_classLoader = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_11.getOrThrow().java_lang_Class_module = turnClass(Main0.Main0_globalVar_3)
}

public static func f(): Unit {
	f0()
}

}

