
package upstream

public interface InterfaceStaticFuncShape {
    static func sfBare(): Int64
    static func sfGeneric<T>(x: T): T
}
