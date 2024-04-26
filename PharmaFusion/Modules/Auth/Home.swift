import SwiftUI


struct ContentView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    searchBar
                    categoriesView
                    filtersView
                    productsView
                }
                .navigationTitle("Home Page")
            }
        }
    }
}

extension ContentView {
    var searchBar: some View {
        TextField("Search products...", text: $searchText)
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
    }

    var categoriesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(["categories"], id: \.self) { category in
                    Text(category)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
    }

    var filtersView: some View {
        HStack {
            Text("Filters")
                .font(.headline)
            Spacer()
            Button("Sort") {}
                .buttonStyle(.bordered)
        }
        .padding()
    }

    var productsView: some View {
        VStack {
            ForEach(0..<10) { item in
                HStack {
                    Image(systemName: "bag")
                        .frame(width: 50, height: 50)
                        .background(Color.gray)
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text("Product \(item + 1)")
                            .font(.headline)
                        Text("Description here")
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding()
                Divider()
            }
        }
        .padding(.horizontal)
    }
}
