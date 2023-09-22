# Mymemo

## 구현 화면
<img width="279" alt="profilepage" src="https://github.com/luttoli/Mymemo/assets/107012166/e823c8de-33e4-4231-8e55-abaeab66c1d2">

* userName 세로 위치는 status bar 절대 위치
```
let statusBarHeight = self.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
make.bottom.equalTo(self.safeAreaLayoutGuide.snp.top).offset(statusBarHeight)
```
    
* Nav gallery 3등분: 빈 버튼 두개 추가해서 distribution = .fillEqually를 사용했습니다.
```
lazy var gridButton1: UIButton = {
    let gridButton1 = UIButton()
    return gridButton1
}()

lazy var gridButton2: UIButton = {
    let gridButton2 = UIButton()
    return gridButton2
}()
```
 - Nav gallery border line도 UIView를 사용해서 StackView로 위치 잡았는데 구현 목표가 맞을지 궁금합니다.
(지금 이렇게 정리하다 보니 button의 bottom line만 줬어도 가능했을거 같기도 합니다.)

## MVVM패턴 적용해보기
<img width="765" alt="profileMvvm" src="https://github.com/luttoli/Mymemo/assets/107012166/b97ee967-d00f-41b8-b81a-dbb460070a84">

Model은 userProfile에서 사용될 데이터로 구성
ViewModel은 각 데이터가 어떤것과 맵핑되어야하는지 연결
ProfileDesignViewController에 View 영역을 나눔 (userProfileView, MiddleBarView, PictureControllerView): 처음에 ProfileDesignViewController에서 모든 화면의 UI를 작성했더니 너무 정신없어서 단. PictureControllerView을 따로 분리해서 작성했더니 CollectionView 영역은 잡히나, Cell이 그려지지 않는 문제가 있었는데 해결하지 못함.

## 뒤로가기 불가

* 화면 전환은 꼭 present를 사용해주세요. : Home 화면에서 해당 페이지로 넘어가는 버튼을 눌렀을 때 present, fullScreen을 사용했다.
```
@objc func profileButtonClicked() {
    let goProfile = ProfileDesignViewController()
    goProfile.modalPresentationStyle = .fullScreen
    present(goProfile, animated: true, completion: nil)
}
```

- 페이지 작업을 다 하고보니 해당 화면에서 뒤로가기가 불가능했다. 그래서 화면을 내리면 이전페이지로 이동할 수 있게 구현했다.

```
func goBackGesture() {
    let swipeDownGesture = UIPanGestureRecognizer(target: self, action: #selector(swipeDown))
    self.view.addGestureRecognizer(swipeDownGesture)
}

@objc func swipeDown(_ recognizer: UIPanGestureRecognizer) {
    let translation = recognizer.translation(in: view)

    switch recognizer.state {
    case .changed:
        if translation.y > 0 {
            view.transform = CGAffineTransform(translationX: 0, y: translation.y)
        }
    case .ended:
        if translation.y > view.frame.size.height * 0.2 {
            dismiss(animated: true, completion: nil)
        } else {
            UIView.animate(withDuration: 0.3) {
                self.view.transform = .identity
            }
        }
    default:
        break
    }
}
```
여기서 화면을 내릴 때 이전 페이지가 검은색으로 노출되는 것을 해결하지 못했다.
