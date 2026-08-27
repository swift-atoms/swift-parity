import Parity

extension Parity {

    @inlinable
    public init<T: BinaryInteger>(_ value: T) {
        self = value.isMultiple(of: 2) ? .even : .odd
    }
}
