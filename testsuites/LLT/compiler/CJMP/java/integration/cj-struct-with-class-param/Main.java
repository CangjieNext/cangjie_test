/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package java_entry;
import UNNAMED.CangjieStruct;
import UNNAMED.AnotherCangjieStruct;
import UNNAMED.AnotherCangjieClass;
public class Main {
public static void main(String[] args) {
final CangjieStruct instance = new CangjieStruct(new AnotherCangjieStruct(), (short) 1, new AnotherCangjieClass());
System.out.println("result = true");
}

}
