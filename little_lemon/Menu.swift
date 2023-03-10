//
//  Menu.swift
//  little_lemon
//
//  Created by Trần Lê Hoàng Lâm on 09/03/2023.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var showAlert = false
    @State var searchText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            Header()
            HeroSection()
            MenuBreakdownComponent()
            FetchedObjects(
                /*
                 FetchedObjects is a struct created to replace @FetchReques to allow using predicates with search boxes.
                 */
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id:\.self) { dish in
                            DisplayDish(dish)
                                .onTapGesture {
                                    showAlert.toggle()
                                }
                        }
                    }
                    .listStyle(.inset)
                    .padding(.leading, -6)
                }
        }
        .alert("Order placed, thanks!", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
        .onAppear(perform: getMenuData)
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        
        let menuAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let menuURL = URL(string: menuAddress)!
        
        let task = URLSession.shared.dataTask(with: menuURL) { data, response, error in
            if let data = data {
                let fullMenu = try! JSONDecoder().decode(MenuList.self, from: data)
                fullMenu.menu.forEach { menuItem in
                    let newDish = Dish(context: viewContext)
                    newDish.title = menuItem.title
                    newDish.descriptionDish = menuItem.decriptionDish
                    newDish.price = Float(menuItem.price)!
                    newDish.imgUrl = menuItem.imgUrl
                    newDish.category = menuItem.category
                }
                try? viewContext.save()
            }
        }

        task.resume()
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return 
            [
                NSSortDescriptor(
                    key: "title",
                    ascending: true,
                    selector: #selector(NSString.localizedStandardCompare(_:))
                )
            ]
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
