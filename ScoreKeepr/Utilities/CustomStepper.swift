//
//  CustomStepper.swift
//  ScoreKeepr
//
//  Created by Garrison Blair on 29/06/2023.
//

import SwiftUI

struct CustomStepper<Label, Value>: View where Label: View, Value: Strideable {
    @Binding private var value: Value
    private let bounds: ClosedRange<Value>
    private let step: Value.Stride
    private let onIncrement: (() -> Void)?
    private let onDecrement: (() -> Void)?
    private let label: () -> Label

    @State private var previousValue: Value

    public init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value>,
        step: Value.Stride = 1,
        onIncrement: (() -> Void)? = nil,
        onDecrement: (() -> Void)? = nil,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self._value = value
        self.bounds = bounds
        self.step = step
        self.onIncrement = onIncrement
        self.onDecrement = onDecrement
        self.label = label
        self._previousValue = .init(initialValue: value.wrappedValue)
    }

    var body: some View {
        Stepper(
            value: $value,
            in: bounds,
            step: step,
            onEditingChanged: onEditingChanged,
            label: label
        )
    }

    func onEditingChanged(isEditing: Bool) {
        guard !isEditing else {
            previousValue = value
            return
        }
        if previousValue < value {
            onIncrement?()
        } else if previousValue > value {
            onDecrement?()
        }
    }
}

struct CustomStepper_Previews: PreviewProvider {
    static var previews: some View {
        @State(initialValue: 1) var value
        
        CustomStepper(value: $value, in: 1...10, onIncrement: {value += 1}, onDecrement: {value -= 1}) {
            Text("Value: \(value)")
        }
    }
}
