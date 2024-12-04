//
//  CategoryView.swift
//  Doggy Depot
//
//  Category View to show items in each category
//

import SwiftUI
import ParseSwift

// Parse Item struct to represent each product
struct Item: ParseObject {
    var originalData: Data?

    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?

    var name: String?
    var category: String?
    var image: ParseFile? // File for uploaded image
    var price: Double?
    var description: String?
}

struct CategoryView: View {
    var category: String
    @State private var items: [Item] = []
    @State private var isLoading = true

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading \(category) Items...")
                    .padding()
            } else {
                if items.isEmpty {
                    Text("No items available for \(category)")
                        .padding()
                } else {
                    List(items, id: \.objectId) { item in
                        HStack {
                            // Access the `image` field
                            if let imageFile = item.image, let imageUrl = imageFile.url {
                                AsyncImage(url: imageUrl) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 60, height: 60)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                    case .failure:
                                        Text("Image failed to load")
                                            .frame(width: 60, height: 60)
                                            .background(Color.gray.opacity(0.2))
                                            .cornerRadius(8)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            } else {
                                Text("No image available")
                                    .frame(width: 60, height: 60)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                            }

                            VStack(alignment: .leading) {
                                Text(item.name ?? "Unknown")
                                    .font(.headline)
                                Text("$\(item.price ?? 0.0, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            NavigationLink(
                                destination: DescriptionView(
                                    objectId: item.objectId ?? "",
                                    itemName: item.name ?? "Unknown",
                                    category: item.category ?? "Unknown",
                                    imageUrl: item.image?.url?.absoluteString ?? "" // Pass image URL string if needed
                                )
                            ) {
                                Text("View")
                                    .font(.body)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
        .onAppear(perform: loadItems)
        .navigationTitle("\(category) Items")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func loadItems() {
        isLoading = true
        fetchItems(category: category) { items, error in
            if let items = items {
                self.items = items
            } else if let error = error {
                print("Error fetching items for \(category): \(error.localizedDescription)")
            }
            self.isLoading = false
        }
    }

    private func fetchItems(category: String, completion: @escaping ([Item]?, Error?) -> Void) {
        let query = Item.query("category" == category)
        query.find { result in
            switch result {
            case .success(let items):
                completion(items, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
