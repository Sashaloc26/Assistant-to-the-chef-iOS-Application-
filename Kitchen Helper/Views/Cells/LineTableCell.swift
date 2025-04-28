import UIKit
import SnapKit
class LineTableCell: UITableViewCell {
    
    private let lineView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        makeConstraints()
    }
    
    func setup() {
        lineView.backgroundColor = .lightGray
        contentView.addSubview(lineView)
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func makeConstraints(){
        lineView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
