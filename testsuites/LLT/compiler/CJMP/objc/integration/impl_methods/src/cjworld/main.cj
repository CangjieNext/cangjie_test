package cjworld

import std.unittest.*
import std.unittest.testmacro.*

import objc.lang.*

func makeBox(value: Int64) {
    let box = Box()
    box.value = value
    return box
}

@Test
class ObjCMethodTests {
    @TestCase
    func primitives() {
        let factory = Factory()
        let base = factory.base()
        @Expect(base.arg0(), true)
        @Expect(base.primitive1(2), 5)
        @Expect(base.primitive2(2, 3.0), 10)
        @Expect(base.primitive3(2, 3.0, true), 6)

        let derived = factory.derived()
        @Expect(derived.arg0(), false)
        @Expect(derived.primitive1(2), 4)
        @Expect(derived.primitive2(2, 3.0), 33)
        @Expect(derived.primitive3(2, 3.0, true), 9)
        
        let dab = factory.derivedAsBase()
        @Expect(derived.arg0(), false)
        @Expect(derived.primitive1(2), 4)
        @Expect(derived.primitive2(2, 3.0), 33)
        @Expect(derived.primitive3(2, 3.0, true), 9)
    }

    @TestCase
    func mirrors() {
        let factory = Factory()
        let base = factory.base()
        @Expect(base.mirror1(makeBox(2)), 2)
        @Expect(base.mirror2(makeBox(2), makeBox(4)), 6)
        @Expect(base.mirror3(makeBox(2), makeBox(4), makeBox(6)), 12)

        let derived = factory.derived()
        @Expect(derived.mirror1(makeBox(2)), -2)
        @Expect(derived.mirror2(makeBox(2), makeBox(4)), -6)
        @Expect(derived.mirror3(makeBox(2), makeBox(4), makeBox(6)), -12)

        let dab = factory.derivedAsBase()
        @Expect(derived.mirror1(makeBox(2)), -2)
        @Expect(derived.mirror2(makeBox(2), makeBox(4)), -6)
        @Expect(derived.mirror3(makeBox(2), makeBox(4), makeBox(6)), -12)
    }

    @TestCase
    func impls() {
        let factory = Factory()
        let base = factory.base()
        @Expect(base.impl1(factory.boxWith(2)), 2)
        @Expect(base.impl2(factory.boxWith(2), factory.boxWith(4)), 6)
        @Expect(base.impl3(factory.boxWith(2), factory.boxWith(4), factory.boxWith(6)), 7)

        let derived = factory.derived()
        @Expect(derived.impl1(factory.boxWith(2)), -2)
        @Expect(derived.impl2(factory.boxWith(2), factory.boxWith(4)), -6)
        @Expect(derived.impl3(factory.boxWith(2), factory.boxWith(4), factory.boxWith(6)), -7)

        let dab = factory.derivedAsBase()
        @Expect(derived.impl1(factory.boxWith(2)), -2)
        @Expect(derived.impl2(factory.boxWith(2), factory.boxWith(4)), -6)
        @Expect(derived.impl3(factory.boxWith(2), factory.boxWith(4), factory.boxWith(6)), -7)
    }

    @TestCase
    func statics() {
        @Expect(Derived.static1(makeBox(2)), -2)
        @Expect(Derived.static2(makeBox(2), makeBox(4)), -6)
        @Expect(Derived.static3(makeBox(2), makeBox(4), makeBox(6)), -12)
    }

    @TestCase
    func returns() {
        let factory = Factory()
        let base = factory.base()
        @Expect(base.returnMirror(makeBox(2)).value, 777)
        @Expect(base.returnImpl(factory.boxWith(3)).value, 2)

        let derived = factory.derived()
        @Expect(derived.returnMirror(makeBox(2)).value, 2)
        @Expect(derived.returnImpl(factory.boxWith(3)).value, 3)

        let dab = factory.derivedAsBase()
        @Expect(dab.returnMirror(makeBox(2)).value, 2)
        @Expect(dab.returnImpl(factory.boxWith(3)).value, 3)
    }
}

@C
func cangjieMain(): Int64 {
    try {
        let result =
            TestGroup.builder(@sourcePackage()).
                add(ObjCMethodTests().asTestSuite()).
                build().
                runTests()
        result.reportTo(ConsoleReporter())
        return result.failedCount + result.errorCount
    } catch (e: Exception) {
        eprintln(e.message)
        return 1
    }
    return 0
}
