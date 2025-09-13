import SwiftUI

struct ContentView: View {
    @State private var cards: [String] = ["Berlin Wall", "Abbey Road", "Brandenburg Gate"]
    @State private var unlocked: [String] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cards, id: \.self) { card in
                    NavigationLink(destination: CardDetailView(card: card, unlocked: unlocked.contains(card))) {
                        HStack {
                            Text(card)
                            Spacer()
                            if unlocked.contains(card) {
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
            }
            .navigationTitle("GeoCards")
            .toolbar {
                Button("Unlock Random") {
                    if let random = cards.randomElement(), !unlocked.contains(random) {
                        unlocked.append(random)
                    }
                }
            }
        }
    }
}

struct CardDetailView: View {
    let card: String
    let unlocked: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text(card)
                .font(.largeTitle)
                .bold()
            if unlocked {
                Text("✅ You’ve unlocked this card!")
                    .foregroundColor(.green)
            } else {
                Text("🔒 Locked")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
