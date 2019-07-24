
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //이미지 파일 이름을 저장할 배열을 생성
    var images : [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //이미지 파일 이름들을 배열에 추가
        //car00.jpg ~ car24.jpg
        for i in 0...24{
            let imageName : String = String(format:"car%02i.jpg",i)
            images.append(imageName)
        }
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}


extension ViewController :
UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //셀의 개수를 설정하는 메소드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)
        -> Int {
            //셀의 개수를 설정
            return images.count
    }
    //셀 구성하기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for:
                indexPath) as! CustomCell
            cell.imageView.image = UIImage(named: images[indexPath.row])
            return cell
    }
    // 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWithd = collectionView.frame.width / 3 - 1
        return CGSize(width: collectionViewCellWithd, height: collectionViewCellWithd)
    }
    
    //위아래 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    //옆 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //셀이 선택되고 난 후 호출되는 메소드
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //셀의 인덱스에 해당하는 Cell을 찾아옵니다.
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.yellow.cgColor
        cell?.layer.borderWidth = 3.0
    }
    
    //셀을 누르고 있을 때 호출되는 메소드
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        //셀의 인덱스에 해당하는 Cell을 찾아옵니다.
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.red.cgColor
        cell?.layer.borderWidth = 3.0
    }
    
}
