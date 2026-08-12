/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms
import std.time.*
import std.collection.*
import std.math.*

let isDebug : Bool = false
func DeBugLog(msg : String , file: String, line: Int64, fn: String){
    if (isDebug) {
        let prefix = "${msg}"
        print(prefix)
    }
}

class OrderedCollection<T> where T <: Object {
    var elms: ArrayList<T> = ArrayList<T>()

    func add(elm: T) {
        this.elms.add(elm)
    }
    func at(index: Int64): T {
        return this.elms[index]
    }
    func size(): Int64 {
        return this.elms.size
    }
    func removeFirst(): T {
        return this.elms.remove(at: this.elms.size - 1)
    }

    func remove(elm: T) {
        var index = 0
        var skipped = 0
        for (i in 0..this.elms.size) {
            let value = this.elms[i]
            if (!refEq(value, elm)) {
                this.elms[index] = value
                index += 1
            } else {
                skipped += 1
            }
        }

        for (_ in 0..skipped) {
            this.elms.remove(at: this.elms.size - 1)
        }
    }
}

/**
 * Strengths are used to measure the relative importance of constraints.
 * New strengths may be inserted in the strength hierarchy without
 * disrupting current constraints.  Strengths cannot be created outside
 * this class, so pointer comparison can be used for value comparison.
 */
class Strength {
    var strengthValue: Int64
    var name: String
    static let REQUIRED        = Strength(0, "required")
    static let STONG_PREFERRED = Strength(1, "strongPreferred")
    static let PREFERRED       = Strength(2, "preferred")
    static let STRONG_DEFAULT  = Strength(3, "strongDefault")
    static let NORMAL          = Strength(4, "normal")
    static let WEAK_DEFAULT    = Strength(5, "weakDefault")
    static let WEAKEST         = Strength(6, "weakest")

    init(strengthValue: Int64, name: String) {
        this.strengthValue = strengthValue
        this.name = name
    }

    static func stronger(s1: Strength, s2: Strength): Bool {
        return s1.strengthValue < s2.strengthValue
    }

    static func weaker(s1: Strength, s2: Strength): Bool {
        return s1.strengthValue > s2.strengthValue
    }

    static func weakestOf(s1: Strength, s2: Strength): Strength {
        if (weaker(s1, s2)) {
            return s1
        } else {
            return s2
        }
    }
    static func strongest(s1: Strength, s2: Strength): Strength {
        if (stronger(s1, s2)) {
            return s1
        } else {
            return s2
        }
    }

    func nextWeaker(): ?Strength {
        match (this.strengthValue) {
            case 0 => Strength.WEAKEST
            case 1 => Strength.WEAK_DEFAULT
            case 2 => Strength.NORMAL
            case 3 => Strength.STRONG_DEFAULT
            case 4 => Strength.PREFERRED
            case 5 => Strength.REQUIRED
            case _ => Option<Strength>.None
        }
    }
}

/**
 ** An abstract class representing a system-maintainable relationship
 ** (or "constraint") between a set of variables. A constraint supplies
 ** a strength instance variable; concrete subclasses provide a means
 ** of storing the constrained variables and other information required
 ** to represent a constraint.
 **/
open abstract class Constraint {
    var strength: Strength

    public func addToGraph(): Unit
    public func chooseMethod(mark: Int64): Unit
    public func isSatisfied(): Bool
    public func markInputs(mark: Int64): Unit
    public func output(): ?Variable
    public func removeFromGraph(): Unit
    public func markUnsatisfied(): Unit
    public func execute(): Unit
    public func inputsKnown(mark: Int64): Bool
    public func recalculate(): Unit

    init(strength: Strength) {
        this.strength = strength
    }

    /**
     * Activate this constraint and attempt to satisfy it.
     */
    func addConstraint() {
        this.addToGraph()
        Planner.planner.incrementalAdd(this)
    }

    /**
     ** Attempt to find a way to enforce this constraint. If successful,
     ** record the solution, perhaps modifying the current dataflow
     ** graph. Answer the constraint that this constraint overrides, if
     ** there is one, or nil, if there isn't.
     ** Assume: I am not already satisfied.
     **/
    func satisfy(mark: Int64): ?Constraint {
        this.chooseMethod(mark)
        if (!this.isSatisfied()) {
            if (refEq(this.strength, Strength.REQUIRED)) {
                println("Could not satisfy a required constraint!")
            }
            return Option<Constraint>.None
        }
        this.markInputs(mark)
        let out = this.output()
        let overridden: ?Constraint = out.getOrThrow().determinedBy
        if (overridden.isSome()) {
            overridden.getOrThrow().markUnsatisfied()
        }
        out.getOrThrow().determinedBy = this
        if (!Planner.planner.addPropagate(this, mark)) {
            print("Cycle encountered")
        }
        out.getOrThrow().mark = mark
        return overridden
    }

    func destroyConstraint() {
        if (this.isSatisfied()) {
            Planner.planner.incrementalRemove(this)
        } else {
            this.removeFromGraph()
        }
    }

    /**
     * Normal constraints are not input constraints.  An input constraint
     * is one that depends on external state, such as the mouse, the
     * keybord, a clock, or some arbitraty piece of imperative code.
     */
    public open func isInput(): Bool {
        return false
    }
}

open abstract class UnaryConstraint <: Constraint {
    var myOutput: ?Variable
    var satisfied: Bool = false
    
    /**
     * Abstract superclass for constraints having a single possible output
     * variable.
     */
    init(v: Variable, strength: Strength) {
        super(strength)
        this.myOutput = v
        // this.addConstraint()
    }

    /**
     * Adds this constraint to the constraint graph
     */
    public override func addToGraph() {
        this.myOutput.getOrThrow().addConstraint(this)
        this.satisfied = false
    }

    /**
     * Decides if this constraint can be satisfied and records that
     * decision.
     */
    public override func chooseMethod(mark: Int64) {
        this.satisfied = (this.myOutput.getOrThrow().mark != mark) && Strength.stronger(this.strength, this.myOutput.getOrThrow().walkStrength)
    }

    /**
     * Returns true if this constraint is satisfied in the current solution.
     */
    public override func isSatisfied(): Bool {
        return this.satisfied
    }

    public override func markInputs(mark: Int64) {
        
    }

    /**
     * Returns the current output variable.
     */
    public override func output(): ?Variable {
        return this.myOutput
    }

    /**
     * Calculate the walkabout strength, the stay flag, and, if it is
     * 'stay', the value for the current output of this constraint. Assume
     * this constraint is satisfied.
     */
    public override func recalculate() {
        if (this.myOutput.isNone()) {
            return 
        }
        this.myOutput.getOrThrow().walkStrength = this.strength
        this.myOutput.getOrThrow().stay = !this.isInput()
        if (this.myOutput.getOrThrow().stay) {
            this.execute()
        }
    }

    /**
     * Records that this constraint is unsatisfied
     */
    public override func markUnsatisfied() {
        this.satisfied = false
    }

    public override func inputsKnown(mark: Int64): Bool {
        return true
    }

    public override func removeFromGraph() {
        if (myOutput.isSome()) {
            myOutput.getOrThrow().removeConstraint(this)
        }
        this.satisfied = false
    }

    public open override func execute(): Unit {}
}

/**
 * Variables that should, with some level of preference, stay the same.
 * Planners may exploit the fact that instances, if satisfied, will not
 * change their output during plan execution.  This is called "stay
 * optimization".
 */
class StayConstraint <: UnaryConstraint {
    init(v: Variable, str: Strength) {
        super(v, str)
        this.addConstraint()
    }

    public override func execute(): Unit {}
}

/**
 * A unary input constraint used to mark a variable that the client
 * wishes to change.
 */
class EditConstraint <: UnaryConstraint {
    init(v: Variable, str: Strength) {
        super(v, str)
        this.addConstraint()
    }

    /**
     * Edits indicate that a variable is to be changed by imperative code.
     */
    public override func isInput(): Bool {
        return true
    }

    public override func execute(): Unit {}
}

enum Direction {
    NONE(Int64) | FORWARD(Int64) | BACKWARD(Int64)
}

/**
 * Abstract superclass for constraints having two possible output
 * variables.
 */
open abstract class BinaryConstraint <: Constraint {

    var v1: ?Variable
    var v2: ?Variable
    var direction: Direction = Direction.NONE(0)

    init(var1: ?Variable, var2: ?Variable, strength: Strength) {
        super(strength)
        this.v1 = var1
        this.v2 = var2
        // this.direction = Direction.NONE(0)
        // this.addConstraint()
    }

    /**
     * Decides if this constraint can be satisfied and which way it
     * should flow based on the relative strength of the variables related,
     * and record that decision.
     */
    public override func chooseMethod(mark: Int64) {
        if (v1.isNone() && v2.isNone()) {
            this.direction = Direction.NONE(0)
            return 
        }

        if (this.v1.getOrThrow().mark == mark) {
            if (this.v2.getOrThrow().mark != mark && Strength.stronger(this.strength, this.v2.getOrThrow().walkStrength)) {
                this.direction = Direction.FORWARD(1)
            } else {
                this.direction = Direction.NONE(0)
            }
        }
        if (this.v2.getOrThrow().mark == mark) {
            if (this.v1.getOrThrow().mark != mark && Strength.stronger(this.strength, this.v1.getOrThrow().walkStrength)) {
                this.direction = Direction.BACKWARD(-1)
            } else {
                this.direction = Direction.NONE(0)
            }
        }
        if (Strength.weaker(this.v1.getOrThrow().walkStrength, this.v2.getOrThrow().walkStrength)) {
            if (Strength.stronger(this.strength, this.v1.getOrThrow().walkStrength)) {
                this.direction = Direction.BACKWARD(-1)
            } else {
                this.direction = Direction.NONE(0)
            }
        } else {
            if (Strength.stronger(this.strength, this.v2.getOrThrow().walkStrength)) {
                this.direction = Direction.FORWARD(1)
            } else {
                this.direction = Direction.BACKWARD(-1)
            }
        }
    }

    /***
     ** Add this constraint to the constraint graph
     **/
    public override func addToGraph() {
        this.v1.getOrThrow().addConstraint(this)
        this.v2.getOrThrow().addConstraint(this)
        this.direction = Direction.NONE(0)
    }

    /**
     * Answer true if this constraint is satisfied in the current solution.
     */
    public override func isSatisfied(): Bool {
        match (this.direction) {
            case Direction.NONE(0) => return false
            case _ => return true
        }
    }

    /**
     * Mark the input variable with the given mark.
     */
    public open override func markInputs(mark: Int64) {
        this.input().getOrThrow().mark = mark
    }

    /**
     * Returns the current output variable
     */
    func input(): ?Variable {
        match (this.direction) {
            case Direction.FORWARD(1) => return this.v1
            case _ => return this.v2
        }
    }

    /**
     * Returns the current input variable
     */
    public override func output(): ?Variable {
        match (this.direction) {
            case Direction.FORWARD(1) => return this.v2
            case _ => return this.v1
        }
    }

    /**
     * Calculate the walkabout strength, the stay flag, and, if it is
     * 'stay', the value for the current output of this
     * constraint. Assume this constraint is satisfied.
     */
    public open override func recalculate() {
        let ihn = this.input()
        let out = this.output()
        out.getOrThrow().walkStrength = Strength.weakestOf(this.strength, ihn.getOrThrow().walkStrength)
        out.getOrThrow().stay = ihn.getOrThrow().stay
        if (out.getOrThrow().stay) {
            this.execute()
        }
    }

    /**
     * Record the fact that this constraint is unsatisfied.
     */
    public override func markUnsatisfied() {
        this.direction = Direction.NONE(0)
    }
    public override func inputsKnown(mark: Int64): Bool {
        let i = this.input()
        return i.getOrThrow().mark == mark || i.getOrThrow().stay || i.getOrThrow().determinedBy.isNone()
    }
    public open override func removeFromGraph() {
        if (this.v1.isSome()) {
            this.v1.getOrThrow().removeConstraint(this)
        }
        if (this.v2.isSome()) {
            this.v2.getOrThrow().removeConstraint(this)
        }

        // this.v2.removeConstraint(this)
        this.direction = Direction.NONE(0)
    }
}

/**
 * Relates two variables by the linear scaling relationship: "v2 =
 * (v1 * scale) + offset". Either v1 or v2 may be changed to maintain
 * this relationship but the scale factor and offset are considered
 * read-only.
 */
class ScaleConstraint <: BinaryConstraint {
    var scale: Variable
    var offset: Variable
    init(src: Variable, scale: Variable, offset: Variable, dest: Variable, strength: Strength) {
        super(src, dest, strength)
        this.scale = scale
        this.offset = offset

        this.direction = Direction.NONE(0)
        this.addScaAndOffToGraph()
        this.addConstraint()
    }
    func addScaAndOffToGraph() {
        this.scale.addConstraint(this)
        this.offset.addConstraint(this)
    }
    public override func removeFromGraph() {
        this.scale.removeConstraint(this)
        this.offset.removeConstraint(this)
    }
    public override func markInputs(mark: Int64) {
        this.scale.mark = mark
        this.offset.mark = mark
    }

    /**
     * Enforce this constraint. Assume that it is satisfied.
     */
    public override func execute() {
        match (this.direction) {
            case Direction.FORWARD(1) => this.v2.getOrThrow().value = this.v1.getOrThrow().value * this.scale.value + this.offset.value
            case _ => this.v1.getOrThrow().value = (this.v2.getOrThrow().value - this.offset.value) / this.scale.value
        }
    }

    /**
     ** Calculate the walkabout strength, the stay flag, and, if it is
     ** 'stay', the value for the current output of this constraint. Assume
     ** this constraint is satisfied.
     **/
    public override func recalculate() {
        let ihn = this.input()
        let out = this.output()
        out.getOrThrow().walkStrength = Strength.weakestOf(this.strength, ihn.getOrThrow().walkStrength)
        out.getOrThrow().stay = ihn.getOrThrow().stay && this.scale.stay && this.offset.stay
        if (out.getOrThrow().stay) {
            this.execute()
        }
    }
}

/**
 * Constrains two variables to have the same value.
 */
class EqualityConstraint <: BinaryConstraint {
    init(var1: Variable, var2: Variable, strength: Strength) {
        super(var1, var2, strength)
        this.addConstraint()
    }
    public override func execute() {
        this.output().getOrThrow().value = this.input().getOrThrow().value
    }
}

/**
 ** A constrained variable. In addition to its value, it maintain the
 ** structure of the constraint graph, the current dataflow graph, and
 ** various parameters of interest to the DeltaBlue incremental
 ** constraint solver.
 **/
class Variable {
    var value: Int64 = 0
    var constraints: OrderedCollection<Constraint> = OrderedCollection<Constraint>()
    var determinedBy: ?Constraint = Option<Constraint>.None
    var mark: Int64 = 0
    var walkStrength: Strength = Strength.WEAKEST
    var stay: Bool = true
    var name: String
    init(name: String, initialValue: ?Int64) {
        this.name = name
        this.value = initialValue ?? 0

    }

    /**
     ** Add the given constraint to the set of all constraints that refer
     ** this variable.
     **/
    func addConstraint(c: Constraint) {
        this.constraints.add(c)
    }

    /**
     * Removes all traces of c from this variable.
     */
    func removeConstraint(c: Constraint) {
        this.constraints.remove(c)
        if (refEq(this.determinedBy.getOrThrow(), c)) {
            this.determinedBy = Option<Constraint>.None
        }
    }
}

class Planner {
    static var planner = Planner()
    var currentMark: Int64 = 0

    /**
     ** Attempt to satisfy the given constraint and, if successful,
     ** incrementally update the dataflow graph.  Details: If satifying
     ** the constraint is successful, it may override a weaker constraint
     ** on its output. The algorithm attempts to resatisfy that
     ** constraint using some other method. This process is repeated
     ** until either a) it reaches a variable that was not previously
     ** determined by any constraint or b) it reaches a constraint that
     ** is too weak to be satisfied using any of its methods. The
     ** variables of constraints that have been processed are marked with
     ** a unique mark value so that we know where we've been. This allows
     ** the algorithm to avoid getting into an infinite loop even if the
     ** constraint graph has an inadvertent cycle.
     **/
    func incrementalAdd(c: Constraint) {
        let mark: Int64 = this.newMark()
        var overridden: ?Constraint = c.satisfy(mark)
        while (overridden.isSome()) {
            overridden = overridden.getOrThrow().satisfy(mark)
        }
    }

    /**
     ** Entry point for retracting a constraint. Remove the given
     ** constraint and incrementally update the dataflow graph.
     ** Details: Retracting the given constraint may allow some currently
     ** unsatisfiable downstream constraint to be satisfied. We therefore collect
     ** a list of unsatisfied downstream constraints and attempt to
     ** satisfy each one in turn. This list is traversed by constraint
     ** strength, strongest first, as a heuristic for avoiding
     ** unnecessarily adding and then overriding weak constraints.
     ** Assume: c is satisfied.
     **/
    func incrementalRemove(c: Constraint) {
        let out = c.output()
        c.markUnsatisfied()
        c.removeFromGraph()
        let unsatisfied = this.removePropagateFrom(out)
        var strength: Strength = Strength.REQUIRED
        do {
            for (i in 0..unsatisfied.size()) {
                let u = unsatisfied.at(i)
                if (refEq(u.strength, strength)) {
                    this.incrementalAdd(u)
                }
            }
            strength = strength.nextWeaker().getOrThrow()
        } while (!refEq(strength, Strength.WEAKEST))
    }

    /**
     ** Select a previously unused mark value.
     **/
    func newMark(): Int64 {
        this.currentMark += 1
        return this.currentMark
    }
    
    /**
     ** Extract a plan for resatisfaction starting from the given source
     ** constraints, usually a set of input constraints. This method
     ** assumes that stay optimization is desired; the plan will contain
     ** only constraints whose output variables are not stay. Constraints
     ** that do no computation, such as stay and edit constraints, are
     ** not included in the plan.
     ** Details: The outputs of a constraint are marked when it is added
     ** to the plan under construction. A constraint may be appended to
     ** the plan when all its input variables are known. A variable is
     ** known if either a) the variable is marked (indicating that has
     ** been computed by a constraint appearing earlier in the plan), b)
     ** the variable is 'stay' (i.e. it is a constant at plan execution
     ** time), or c) the variable is not determined by any
     ** constraint. The last provision is for past states of history
     ** variables, which are not stay but which are also not computed by
     ** any constraint.
     ** Assume: sources are all satisfied.
     **/
    func makePlan(sources: OrderedCollection<Constraint>): Plan {
        let mark = this.newMark()
        let plan = Plan()
        var todo = sources
        while (todo.size() > 0) {
            let c: ?Constraint = todo.removeFirst()
            if (c.getOrThrow().output().getOrThrow().mark != mark && c.getOrThrow().inputsKnown(mark)) {
                plan.addConstraint(c.getOrThrow())
                c.getOrThrow().output().getOrThrow().mark = mark
                this.addConstraintsConsumingTo(c.getOrThrow().output(), todo)
            }
        }
        return plan
    }

    /**
     ** Extract a plan for resatisfying starting from the output of the
     ** given constraints, usually a set of input constraints.
     **/
    func extractPlanFromConstraints(constraints: OrderedCollection<Constraint>): Plan {
        let sources: OrderedCollection<Constraint> = OrderedCollection()
        for (i in 0..constraints.size()) {
            let c: Constraint = constraints.at(i)
            if (c.isInput() && c.isSatisfied()) {
                sources.add(c)
            }
        }
        return this.makePlan(sources)
    }

    /**
     ** Recompute the walkabout strengths and stay flags of all variables
     ** downstream of the given constraint and recompute the actual
     ** values of all variables whose stay flag is true. If a cycle is
     ** detected, remove the given constraint and answer
     ** false. Otherwise, answer true.
     ** Details: Cycles are detected when a marked variable is
     ** encountered downstream of the given constraint. The sender is
     ** assumed to have marked the inputs of the given constraint with
     ** the given mark. Thus, encountering a marked node downstream of
     ** the output constraint means that there is a path from the
     ** constraint's output to one of its inputs.
     **/
    func addPropagate(c: Constraint, mark: Int64): Bool {
        var todo: OrderedCollection<Constraint> = OrderedCollection()
        todo.add(c)
        while (todo.size() > 0) {
            let d: ?Constraint = todo.removeFirst()
            if (d.getOrThrow().output().getOrThrow().mark == mark) {
                this.incrementalRemove(c)
                return false
            }
            d.getOrThrow().recalculate()
            this.addConstraintsConsumingTo(d.getOrThrow().output(), todo)
        }
        return true
    }

    func addConstraintsConsumingTo(v: ?Variable, coll: OrderedCollection<Constraint>) {
        let determining: ?Constraint = v.getOrThrow().determinedBy
        let cc: OrderedCollection<Constraint> = v.getOrThrow().constraints
        for (i in 0..cc.size()) {
            let c: Constraint = cc.at(i)
            if (!refEq(c, determining.getOrThrow()) && c.isSatisfied()) {
                coll.add(c)
            }
        }
    }

    /**
     * Update the walkabout strengths and stay flags of all variables
     * downstream of the given constraint. Answer a collection of
     * unsatisfied constraints sorted in order of decreasing strength.
     */
    func removePropagateFrom(out: ?Variable): OrderedCollection<Constraint> {
        out.getOrThrow().determinedBy = Option<Constraint>.None
        out.getOrThrow().walkStrength = Strength.WEAKEST
        out.getOrThrow().stay = true
        let unsatisfied: OrderedCollection<Constraint> = OrderedCollection()
        let todo: OrderedCollection<Variable> = OrderedCollection()
        todo.add(out.getOrThrow())
        while (todo.size() > 0) {
            let v: ?Variable = todo.removeFirst()
            for (i in 0..v.getOrThrow().constraints.size()) {
                let c: Constraint = v.getOrThrow().constraints.at(i)
                if (!c.isSatisfied()) {
                    unsatisfied.add(c)
                }
            }
            let determining = v.getOrThrow().determinedBy
            for (i in 0..v.getOrThrow().constraints.size()) {
                let next = v.getOrThrow().constraints.at(i)
                if (determining.isSome() && !refEq(next, determining.getOrThrow()) && next.isSatisfied()) {
                    next.recalculate()
                    todo.add(next.output().getOrThrow())
                }
            }
        }
        return unsatisfied
    }

}

/**
 * A Plan is an ordered list of constraints to be executed in sequence
 * to resatisfy all currently satisfiable constraints in the face of
 * one or more changing inputs.
 */
class Plan {
    var v: OrderedCollection<Constraint>
    init() {
        this.v = OrderedCollection()
    }
    func addConstraint(c: Constraint) {
        this.v.add(c)
    }
    func size(): Int64 {
        return this.v.size()
    }
    func constraintAt(index: Int64): ?Constraint {
        return this.v.at(index)
    }

    func execute() {
        for (i in 0..this.size()) {
            let c: Constraint = this.constraintAt(i).getOrThrow()
            c.execute()
        }
    }
}

func change(v: Variable, newValue: Int64) {
    let edit: EditConstraint = EditConstraint(v, Strength.PREFERRED)
    let edits: OrderedCollection<Constraint> = OrderedCollection()
    edits.add(edit)
    let plan: Plan = Planner.planner.extractPlanFromConstraints(edits)
    for (_ in 0..10) {
        v.value = newValue
        plan.execute()
    }
    edit.destroyConstraint()
}

/**
 ** This is the standard DeltaBlue benchmark. A long chain of equality
 ** constraints is constructed with a stay constraint on one end. An
 ** edit constraint is then added to the opposite end and the time is
 ** measured for adding and removing this constraint, and extracting
 ** and executing a constraint satisfaction plan. There are two cases.
 ** In case 1, the added constraint is stronger than the stay
 ** constraint and values must propagate down the entire length of the
 ** chain. In case 2, the added constraint is weaker than the stay
 ** constraint so it cannot be accomodated. The cost in this case is,
 ** of course, very low. Typical situations lie somewhere between these
 ** two extremes.
 **/
func chainTest(n: Int64) {
    Planner.planner = Planner()
    var prev: ?Variable = Option<Variable>.None
    var first: ?Variable = Option<Variable>.None
    var last: ?Variable = Option<Variable>.None
    for (i in 0..=n) {
        let name: String = "v${i}"
        let v: Variable = Variable(name, Option<Int64>.None)
        if (prev.isSome()) {
            _ = EqualityConstraint(prev.getOrThrow(), v, Strength.REQUIRED)
        }
        if (i == 0) {
            first = v
        }
        if (i == n) {
            last = v
        }
        prev = v
    }
    _ = StayConstraint(last.getOrThrow(), Strength.STRONG_DEFAULT)
    let edit: EditConstraint = EditConstraint(first.getOrThrow(), Strength.PREFERRED)
    let edits: OrderedCollection<Constraint> = OrderedCollection()
    edits.add(edit)
    let plan: Plan = Planner.planner.extractPlanFromConstraints(edits)
    for (i in 0..100) {
        first.getOrThrow().value = i
        plan.execute()
        if (last.getOrThrow().value != i) {
            // throw BenchmarkError.WrongResult("Chain test failed.")
            throw Exception()
        }
    }
}

/**
 * This test constructs a two sets of variables related to each
 * other by a simple linear transformation (scale and offset). The
 * time is measured to change a variable on either side of the
 * mapping and to change the scale and offset factors.
 */
func projectionTest(n: Int64) {
    Planner.planner = Planner()
    let scale: Variable = Variable("scale", 10)
    let offset: Variable = Variable("offset", 1000)
    var src: Variable = Variable("", 0)
    var dst: Variable = Variable("", 0);
    let dests: OrderedCollection<Variable> = OrderedCollection()
    for (i in 0..n) {
        src = Variable("src${i}", i)
        dst = Variable("dst${i}", i)
        dests.add(dst)
        _ = StayConstraint(src, Strength.NORMAL)
        _ = ScaleConstraint(src, scale, offset, dst, Strength.REQUIRED)
    }
    change(src, 17)
    if (dst.value != 1170) {
    }
    change(dst, 1050)
    if (src.value != 5) {
    }
    change(scale, 5)
    for (i in 0..n - 1) {
        if (dests.at(i).value != (i * 5 + 1000)) {
        }
    }
    change(offset, 2000)
    for (i in 0..n - 1) {
        if (dests.at(i).value != (i * 5 + 2000)) {
        }
    }
}

func deltaBlue() {
    chainTest(100)
    projectionTest(100)
}

class Benchmark {
    /// @Benchmark
    func runIteration() {
        for (_ in 0..20) {
            deltaBlue()
        }
    }
}
class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

func run() {
    let start = Timer().getTime()
    let deltaBlue = Benchmark()
    for (_ in 1..=20) {
        deltaBlue.runIteration()
    }
    let end = Timer().getTime()
    let duration = end - start
    println("deltablue: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
}

main() {
    run()
}
