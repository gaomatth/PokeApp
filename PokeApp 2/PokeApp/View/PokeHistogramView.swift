//
//  HistogramView.swift
//  HapticButton
//
//  Created by Matthew Gao on 4/10/21.
//

import SwiftUI

struct PokeHistogramView: View {
    @Binding var pokeHistogram: [Bool]
    private let defaultHeight: CGFloat = 5
    private let peakHeight: CGFloat = 30
    
    var body: some View {
        HStack(spacing: 1){
            ForEach(0..<50) { idx in
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: defaultHeight, height: pokeHistogram[idx] ? peakHeight : defaultHeight)
                }
        }
    }
    
    func convertBool (pokeRecord: [CGFloat]) -> [Bool] {
        var pokeHistogram = [Bool](repeating: false, count: 50)
        
        for i in pokeRecord {
            let intervalIdx = Int(floor(i * 10))
            pokeHistogram[intervalIdx] = true
        }
        
        return pokeHistogram
    }
}
