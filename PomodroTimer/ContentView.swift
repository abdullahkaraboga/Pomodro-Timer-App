import SwiftUI

struct ContentView : View{
    @EnvironmentObject var pomodroModel : PomodroModel
    
    var body: some View{
        
        Home().environmentObject(pomodroModel)    }
}

struct ContentView_Previews: PreviewProvider{
    
    static var previews: some View{
        ContentView()
    }
}
