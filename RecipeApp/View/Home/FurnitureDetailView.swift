

import SwiftUI

struct FurnitureDetailView: View {
    // MARK: - PROPERTIES
    var woodWorks: WoodWorks
    @State private var showAlertAddFavorite: Bool = false
   // @State private var showAlertIngredient: Bool = false
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @EnvironmentObject var furnitureViewModel: FurnitureViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack (alignment: .center, spacing: 0) {
                // IMAGE
                ZStack(alignment: .bottom) {
                    ImageLoaderView(imageUrl: woodWorks.image)
                        .scaledToFit()
                    HStack {
                        Spacer()
                        Button(action: {
                            if self.furnitureViewModel.favorite {
                                self.favoriteViewModel.removeProductFromFavorites(woodWorks: self.woodWorks)
                                self.furnitureViewModel.setFavorite(flag: false)
                            } else {
                                self.favoriteViewModel.addProductToFavorites(woodWorks: self.woodWorks)
                                self.furnitureViewModel.setFavorite(flag: true)
                                self.showAlertAddFavorite.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    self.showAlertAddFavorite.toggle()
                                }
                            }

                        }) {
                            Image(systemName: furnitureViewModel.favorite ? "bookmark.fill" : "bookmark")
                                .font(.system(size:30, weight: .light))
                                .foregroundColor(Color.white)
                                .shadow(color: Color.gray, radius: 2, x: 0, y: 0)
                                .padding(20)
                        }
                        .alert(isPresented: $showAlertAddFavorite) {
                            Alert(
                                title: Text("Successful"),
                                message: Text("Product added to favorites list."),
                                dismissButton: .default(Text("Ok")))
                        }
                    }
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                    )
                    
                }
                
                
                Group {
                    // TITLE
                    Text(woodWorks.title)
                        .font(.system(.title, design: .default))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
            
                    // HEADING
                    FurnitureRatingView(woodWorks: woodWorks)
                    
                    // COOKING
                    ProductAnalyticsView(woodWorks: woodWorks)
                    
                    // INGREDIENTS
                    ProductDescriptionView(woodWorks: woodWorks)

                    // NUTRITIONAL VALUES
                    ProductDetailsView(woodWorks: woodWorks)
                                       
                    // INSTRUCTIONS
                    InstructionsView(overview: woodWorks.overview, woodWorks: woodWorks)
                    
                    // Comment
                    if woodWorks.comments.count > 0 {
                        VStack(alignment: .leading, spacing: 10) {
                        
                            HStack {
                                Spacer()
                                Text("Comment")
                                    .modifier(BoxTitleModifier())
                                Spacer()
                            }
                            
                            Text(woodWorks.comments)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                         .modifier(BoxBackgroundModifier())
                    }
                }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 12)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct FurnitureDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureDetailView(woodWorks: sampleWorks[0])
            .environmentObject(FavoriteViewModel())
            .environmentObject(ShoppingListViewModel())
            .environmentObject(FurnitureViewModel(woodWorks: sampleWorks[0]))
    }
}
