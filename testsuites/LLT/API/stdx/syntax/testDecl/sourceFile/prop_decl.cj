class A {
    prop a: Unit {
        get() {
            ()
        }
    }

    mut prop b: Int64 {
        get() {
            1
        }
        set(v) {
            println(v)
        }
    }

    prop c: ?Int64 {
        get() {
            ()
        }
    }

    prop d: (Int64) {
        get() {
            ()
        }
    }

    prop e: (Int64) -> Int64 {
        get() {
            ()
        }
    }

    prop f: T.A {
        get() {
            ()
        }
    }

    prop g: A {
        get() {
            ()
        }
    }

    prop h: VArray<Int64, $3> {
        get() {
            ()
        }
    }
}