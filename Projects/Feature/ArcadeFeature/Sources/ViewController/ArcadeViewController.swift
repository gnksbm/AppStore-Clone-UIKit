import UIKit

import DesignSystem

import RxSwift

public final class ArcadeViewController: BaseViewController {
    private let viewModel: ArcadeViewModel
    
    public init(viewModel: ArcadeViewModel) {
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
struct ArcadeViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            ArcadeViewController(
                viewModel: ArcadeViewModel()
            )
        }
    }
}
#endif
