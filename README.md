# Parity

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

`Parity` — the two-element even/odd classification of integers, modelling the Z₂ group under addition and the parity of products, with zero dependencies.

---

## Quick Start

`Parity` is the equivalence class of an integer under modulo 2: `.even` or `.odd`. Rather than recomputing `value % 2` at every site and threading a bare `Bool` whose meaning is ambiguous, you capture the classification once in a named type that knows its own algebra — addition (even + even = even, odd + odd = even) and multiplication (odd × odd = odd, else even) — so parity-tracking algorithms read in the vocabulary of the mathematics.

```swift
import Parity
import Parity_Standard_Library_Integration

// Classify integers.
let a = Parity(42)   // even
let b = Parity(7)    // odd

// The Z₂ group: parity of a sum, without touching the operands' values.
print(a.adding(b))        // odd   (even + odd = odd)
print(b.adding(b))        // even  (odd + odd = even)

// Parity of a product.
print(b.multiplying(b))   // odd   (odd × odd = odd)
print(a.multiplying(b))   // even  (even × anything = even)

// The opposite parity, by method or prefix operator.
print(a.opposite)         // odd
print(!b)                 // even
```

`Parity` is `Hashable` and `Sendable`. The `Parity Standard Library Integration` product adds the `BinaryInteger` classification initializer, `CaseIterable`, and `Codable` (outside Embedded). Because it is a closed two-case enum, a `switch` over it is exhaustive without a `default`.

To carry a payload alongside its parity, the `Parity Pair` product of [swift-parity-pair](https://github.com/swift-molecules/swift-parity-pair) pairs the two as `Parity.Value<Payload>`.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-molecules/swift-parity.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Parity", package: "swift-parity"),
    ]
)
```

---

## Architecture

Three library products. No package dependencies.

| Product | Target | Purpose |
|---------|--------|---------|
| `Parity` | `Sources/Parity/` | The `Parity` enum (`.even` / `.odd`) and the Z₂ `adding` / `multiplying` / `opposite` algebra with prefix `!`. |
| `Parity Standard Library Integration` | `Sources/Parity Standard Library Integration/` | The `BinaryInteger` classification initializer and the `CaseIterable` and `Codable` conformances. |
| `Parity Apple Foundation Integration` | `Sources/Parity Apple Foundation Integration/` | The only module allowed to import Foundation. |

Foundation-free outside the Apple Foundation Integration module.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
