/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Main1 {
public static void f0(){
Main0.globalVar_3.loader = Main0.globalVar_2;
Main0.globalVar_2.unnamedModule = Main0.globalVar_3;
jdk_internal_loader_ClassLoaders.APP_LOADER = Main0.globalVar_2;
jdk_internal_module_ModuleLoaderMap$Mapper.APP_CLASSLOADER = Main0.globalVar_2;
java_lang_ClassLoader.scl = Main0.globalVar_2;
Main0.globalVar_4.contextClassLoader = Main0.globalVar_2;
Main0.globalVar_5.contextClassLoader = Main0.globalVar_2;
Main0.globalVar_6.contextClassLoader = Main0.globalVar_2;
Main0.globalVar_1.classLoader = Main0.globalVar_2;
Main0.globalVar_1.module = Main0.globalVar_3;
Main0.globalVar_7.contextClassLoader = Main0.globalVar_2;
Main0.globalVar_8.contextClassLoader = Main0.globalVar_2;
Main0.globalVar_9.contextClassLoader = Main0.globalVar_2;
Main0.globalVar_11.classLoader = Main0.globalVar_2;
Main0.globalVar_11.module = Main0.globalVar_3;
}
public static void f(){
f0();
}
}
