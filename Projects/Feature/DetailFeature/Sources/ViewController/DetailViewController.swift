import UIKit

import RxSwift

public final class DetailViewController: UIViewController {
    private let viewModel: DetailViewModel
    
    public init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
struct DetailViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            DetailViewController(
                viewModel: DetailViewModel()
            )
        }
    }
}
#endif
