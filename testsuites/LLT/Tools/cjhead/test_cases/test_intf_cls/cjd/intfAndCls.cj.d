package test.interfaceDecl



/**
 * interface Flyable
 */
public interface Flyable {
    func fly(): Unit
}

/**
 * class Bird
 */
public class Bird <: Flyable {
    public func fly(): Unit
}

/**
 * class Bat
 */
public class Bat <: Flyable {
    public func fly(): Unit
}

/**
 * class Airplane
 */
public class Airplane <: Flyable {
    public func fly(): Unit
}

/**
 * func fly
 */
public func fly(item: Flyable): Unit