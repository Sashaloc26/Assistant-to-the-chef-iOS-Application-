import UIKit

class SearchButton: UIButton {
    
    // Конструкторы
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    // Настройка внешнего вида кнопки
    private func setupButton() {
        setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        tintColor = .white
    }
}
