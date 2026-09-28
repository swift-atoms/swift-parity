import Parity
import Testing

@Suite
struct `Parity Pair Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Parity Pair Tests`.Unit {

    @Test
    func `Parity Value typealias resolves through Pair`() {
        let value: Parity.Value<Int> = Pair(.even, 4)
        #expect(value.first == .even)
        #expect(value.second == 4)
    }

    @Test
    func `Parity Value preserves noncopyable Pair payloads`() {
        struct Payload: ~Copyable {
            let rawValue: Int
        }

        let value: Parity.Value<Payload> = Pair(.odd, Payload(rawValue: 7))
        #expect(value.first == .odd)
        #expect(value.second.rawValue == 7)
    }
}
