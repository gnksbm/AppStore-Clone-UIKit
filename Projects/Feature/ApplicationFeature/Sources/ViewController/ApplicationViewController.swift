import UIKit

import DesignSystem

import RxSwift

public final class ApplicationViewController: BaseViewController {
    private let viewModel: ApplicationViewModel
    
    public init(viewModel: ApplicationViewModel) {
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
struct ApplicationViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            ApplicationViewController(
                viewModel: ApplicationViewModel()
            )
        }
    }
}
#endif
