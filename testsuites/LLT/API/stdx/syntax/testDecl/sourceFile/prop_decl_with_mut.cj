public interface I1 <: S1 {
    public static mut prop p1: Int64 {
        get() {0}
        set(v) {}
    }
    public static prop p2: R {
        get() { R() }
    }
}