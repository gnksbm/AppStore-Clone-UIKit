import UIKit

import DesignSystem

import RxSwift

public final class GameViewController: BaseViewController {
    private let viewModel: GameViewModel
    
    public init(viewModel: GameViewModel) {
        self.viewModel = viewModel
        super.init()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

#if DEBUG
import SwiftUI
import FeatureDependency
struct GameViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview { 
            GameViewController(
                viewModel: GameViewModel()
            )
        }
    }
}
#endif
