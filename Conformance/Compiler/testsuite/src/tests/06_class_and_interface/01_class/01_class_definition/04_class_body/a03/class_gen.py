# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import string
import random

def gen_ident():
    letter_pool = list(string.digits)
    letter_pool += ('_')
    letter_pool += (list(string.ascii_letters))
    name = ""
    length = random.randint(2, 7)
    # first letter
    name = name + letter_pool[random.randint(11, len(letter_pool) - 1)]
    for x in range(length - 1):
        name = name + random.choice(letter_pool)
    return name

def gen_type():
    types = ["Int8", "Int16", "Int32", "Int64", "Float32", "Float64", "Bool", "String", "Rune", "Object", "(Int32, Int32)"]
    ret_type = random.choice(types)
    return ret_type

def generate_func_decl(isAbstract, isStatic, isGeneric, isMod):
    mod_list = ["public", "private", "protected"] # there are much more modifiers, but juggling different restrictions in too much
    func_name = gen_ident()
    num_param = random.randint(0, 2)
    func_signature = "("
    for x in range(num_param):
        if func_signature[-1] != '(':
            func_signature += ", "
        func_signature += gen_ident() + ": " + gen_type()
    func_signature += ")"
    func_mod = ""
    if isMod:
        func_mod += random.choice(mod_list) + " "
    if isStatic: 
        func_mod += "static "

    gen_param = ""
    if isGeneric:
        gen_param = "<" + gen_ident() + ">"
    func_decl = func_mod + "func " + func_name + gen_param + func_signature
    if isAbstract == False:
        func_decl += " {}"
    return func_decl

def generate_var_decl(isInit, isMut, isStatic, isMod, typeStr):
    mod_list = ["public", "private", "protected"] # there are much more modifiers, but juggling different restrictions in too much
    init_list = ["1", "0", "-1", "\"\"", "\'a\'", "false", "true"]
    var_decl = ""
    var_mod = ""
    var_name = gen_ident()
    if isMod:
        var_mod += random.choice(mod_list) + " "
    if isStatic:
        var_mod += "static "
    var_decl += var_mod
    if isMut:
        var_decl += "var "
    else:
        var_decl += "let "
    var_decl += var_name
    if isInit:
        var_decl += " = " +  random.choice(init_list)
    else:
        var_decl += ": " + typeStr
    return var_decl

def generate_init():
    init_decl = "init() {}"
    return init_decl

def generate_primary_constructor(name, overload):
    const_decl = name + "("
    if overload:
        const_decl += gen_ident() + ": " + gen_type()
    const_decl += ") {}"
    return const_decl

def generate_static_init():
    static_init_def = "//static init() {}"
    return static_init_def

def generate_operator(binary, class_name):
    binary_ops = ["+", "-", "/", "*", "%"]
    unary_ops = ["()", "!", "-"]
    ret_options = ["this", "1", "0", "false"]
    op_def = "operator func "
    if binary:
        op_def += random.choice(binary_ops) + "(" + gen_ident() + ": " + class_name + ")"
    else:
        op_def += random.choice(unary_ops) + "()"
    op_def += " {\n    return "
    op_def += random.choice(ret_options)
    op_def += "\n  }"
    return op_def

def generate_prop(isMut, isStatic):
    types_options = ["Int64", "Float64", "String", "Rune","Bool"]
    get_options = ["1", ".5", "\"1\"", "\'a\'", "false"]
    prop_def = ""
    if isStatic:
        prop_def = "static "
    #if isMut:
    #    prop_def += "mut "
    #prop_def += "prop " + gen_ident() + ": "
    prop_def += "prop"
    if isMut:
        prop_def += " var "
    else:
        prop_def += " let "
    prop_def += gen_ident() + ": "
    idx = random.randint(0, len(types_options) - 1)
    prop_def += types_options[idx] + " {\n"
    prop_def += "    get() {\n      " + get_options[idx] + "\n    }\n"
    if isMut:
        prop_def += "    set(v) {}\n"
    prop_def += "  }"
    return prop_def

def generate_macro():
    macros = ["macro_f", "macro_l", "macro_v"]
    macro_decl = "@" + random.choice(macros) + "[" + gen_ident() + "](1)"
    return macro_decl

def generate_class(name, C, I, S, V, F, O, M, P):
    class_def = "class " + name + " {\n"
    if C:
        class_def += "  " + generate_primary_constructor(name, I) + "\n"
    if I:
        class_def += "  " + generate_init() + "\n"
    if S:
        class_def += "  " + generate_static_init() + "\n"
    if V:
        isStatic = bool(random.getrandbits(1))
        isVar = bool(random.getrandbits(1))
        isMod = bool(random.getrandbits(1))
        class_def += "  " + generate_var_decl(True, isVar, isStatic, isMod, "") + "\n"
    if F:
        isStatic = bool(random.getrandbits(1))
        isMod = bool(random.getrandbits(1))
        isGeneric = bool(random.getrandbits(1))
        class_def += "  " + generate_func_decl(False, isStatic, isGeneric, isMod) + "\n"
    if O:
        isBinary = bool(random.getrandbits(1))
        class_def += "  " + generate_operator(isBinary, name) + "\n"
    if M:
        class_def += "  " + generate_macro() + "\n"
    if P:
        isStatic = bool(random.getrandbits(1))
        isMut = bool(random.getrandbits(1))
        class_def += "  " + generate_prop(isMut, isStatic) + "\n"
    class_def += "}"
    return class_def

def go_over(letters):
    l = len(letters)
    placeholder = '_'


    for x in range(2**l):
        name = ""
        isC = False
        isI = False
        isS = False
        isV = False
        isF = False
        isO = False
        isM = False
        isP = False

        for bit in range(l):
            if x & (1 << bit):
                name = name + letters[bit]
                if letters[bit] == "C":
                    isC = True
                if letters[bit] == "I":
                    isI = True
                if letters[bit] == "S":
                    isS = True
                if letters[bit] == "V":
                    isV = True
                if letters[bit] == "F":
                    isF = True
                if letters[bit] == "O":
                    isO = True
                if letters[bit] == "M":
                    isM = True
                if letters[bit] == "P":
                    isP = True
            else:
                name = name + "_"
        fullname = generate_class(name, isC, isI, isS, isV, isF, isO, isM, isP)
        print(fullname)

go_over(["C", "I", "S", "V", "F", "O", "M", "P"])
