#if Finite
import Parity
import Finite
import Algebra
import Cardinal
import Ordinal
import Testing

@Suite
struct `Cyclic Group - Z2 over Parity` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Cyclic Group - Z2 over Parity`.Unit {
    @Test
    func `identity is even`() {
        let group = Algebra.Group<Parity>.cyclic
        #expect(group.identity == .even)
    }

    @Test
    func `addition modulo 2`() {
        let group = Algebra.Group<Parity>.cyclic
        #expect(group(.even, .even) == .even)
        #expect(group(.even, .odd) == .odd)
        #expect(group(.odd, .even) == .odd)
        #expect(group(.odd, .odd) == .even)
    }
}

extension `Cyclic Group - Z2 over Parity`.`Edge Case` {
    @Test
    func `every element is self-inverse`() {
        let group = Algebra.Group<Parity>.cyclic
        #expect(group.inverting(.even) == .even)
        #expect(group.inverting(.odd) == .odd)
    }
}

@Suite
struct `Classification Finite Conformances` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Classification Finite Conformances`.Unit {
    @Test
    func `parity count and ordinals`() {
        #expect(Parity.count == Cardinal(UInt(2)))
        #expect(Parity.even.ordinal == Ordinal(UInt(0)))
        #expect(Parity.odd.ordinal == Ordinal(UInt(1)))
    }
}

#endif
