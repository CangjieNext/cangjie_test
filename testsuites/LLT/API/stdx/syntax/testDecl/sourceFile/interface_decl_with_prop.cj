@Deprecated["aaa"]
public interface I1<T> <: S1<T> where T <: I2<T> {
    static mut prop p1: Int64
    func foo(): Int64
}