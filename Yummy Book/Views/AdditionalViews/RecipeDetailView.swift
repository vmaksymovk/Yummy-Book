import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding()
                
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
                HStack {
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        // Share recipe action
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                            .padding()
                    }
                }
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        HStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                                .foregroundColor(.green)
                            Text(ingredient)
                                .padding(.leading, 5)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)

                Text("Steps")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(recipe.steps, id: \.self) { step in
                        HStack(alignment: .top) {
                            Text("\(recipe.steps.firstIndex(of: step)! + 1).")
                                .bold()
                                .padding(.top, 2)
                            Text(step)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RecipeDetailView(recipe: Recipe(id: "", name: "Pizza", imageName: "pizza", ingredients: ["Dough", "Tomato Sauce", "Mozzarella Cheese", "Basil"], steps: ["Prepare the dough", "Spread the tomato sauce", "Add the mozzarella cheese", "Bake the pizza", "Garnish with basil"]))
}
