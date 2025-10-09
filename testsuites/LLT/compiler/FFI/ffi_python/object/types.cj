// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Cangjie: Hello, Python!
// ASSERT: scan True
// ASSERT: scan 12
// ASSERT: scan 12.0
// ASSERT: scan 12.0
// ASSERT: scan ele1
// ASSERT: scan true
// ASSERT: scan 5
// ASSERT: scan ele1
// ASSERT: scan ['ele1', 'ele2', 'ele3', 'ele4', 'ele5']
// ASSERT: scan ['ele4']
// ASSERT: scan map
// ASSERT: scan {'key1': 'map', 'key2': 'map'}
// ASSERT: scan [('key1', 'map'), ('key2', 'map')]
// ASSERT: scan ['key1', 'key2']
// ASSERT: scan ['map', 'map']
// ASSERT: scan {}
// ASSERT: scan 3
// ASSERT: scan True

internal import std.collection.HashSet
internal import std.collection.HashMap
internal import ffi_python.*

/**
 * Test function, print the string with python print function.
 */
main(): Int64 {
    /* Initialize python environment */
    Python.load()
    /* Get build-in function print */
    var prt = Python["print"]
 
    /* string type interop. */
    var valStr = PyString("Cangjie: Hello, Python!")
    prt(valStr)
    /* Bool type interop */
    var valBool = PyBool(true)
    if (valBool.toCjObj()) {
        prt(valBool)
    }
    /* int type interop. */
    var pyInt = PyLong(12)
    prt(pyInt)
    /* float type interop. */
    var pyFloat = PyFloat(12.0)
    prt(pyFloat)
    var charFloat64 = pyFloat.toCjObj()
    prt(charFloat64)

    /*
     * tuple type interop.
     * TODO: mapping with Rune tuple.
     * one element.
     */
    var pyTupOne = PyTuple(pyInt)
    /* two elements. */
    var pyTupTwo = PyTuple(pyInt,pyFloat)
    /* three elements. */
    var pyTupThree = PyTuple(pyInt,pyFloat,pyInt)
    /* Lots of elements. */
    var pyTup = PyTuple([PyString("ele1"), PyString("ele2")])
 
    prt(pyTup[0])
    var ret = if (pyTup.size() == 2) { PyString("true") } else { PyString("false") }
    prt(ret)
    /* list type interop. */
    var a = PyList(Array<PyString>(3, repeat: PyString("")))
    a[0] = PyString("ele1")
    a[1] = PyString("ele2")
    a[2] = PyString("ele3")
    a.insert(3,PyString("ele4"))
    a.append(PyString("ele5"))
    prt(PyLong(a.size()))
    prt(a[0])
    prt(a)
    var slice = a.slice(3,4)
    prt(slice)

    /* dictionary type interop. */
    var pyDic = PyDict(HashMap<PyObj, PyObj>())
    pyDic.setItem(PyString("key"), PyString("map"))
    pyDic.setItem(PyString("key1"), PyString("map"))
    pyDic.setItem(PyString("key2"), PyString("map"))
    var val1 = pyDic.getItem(PyString("key"))
    prt(val1)
    pyDic.del(PyString("key"))
    prt(pyDic)
    prt(pyDic.items())
    prt(pyDic.keys())
    prt(pyDic.values())
    var pyDic2 = PyDict(HashMap<PyObj, PyObj>())
    pyDic2.setItem(PyString("key2"), PyString("map2"))
    pyDic2.setItem(PyString("key3"), PyString("map3"))
    pyDic2.setItem(PyString("key4"), PyString("map4"))
    pyDic.empty()
    prt(pyDic)

    var pySet = PySet(HashSet<PyObj>([PyString("key2"), PyString("key3"), PyString("key4")]))
    prt(PyLong(pySet.size()))
    prt(PyBool(pySet.contains(PyString("key2"))))
    pySet.add(PyString("key"))
    prt(pySet)
 
    Python.unload()
    Python.load()
    Python.load()
    /* unload python lib and clean environment */
    Python.unload()
    return 0
}