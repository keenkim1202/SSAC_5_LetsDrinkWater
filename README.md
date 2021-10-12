# LetsDrinkWater
사용자가 마신 물의 양을 저장하고 지금까지 마신 물의 양을 보여주는 앱입니다.

# Assigment (~10/11 오후 1시)
- [x] 참조이미지와 같이 화면 구성하기
- [x] DrinkWaterVC에서는 물 마신 양을 측정합니다.
- [x] DrinkWaterVC 우측 상단 BarButtonItem을 클릭하면 ProfileVC로 화면이 전환됩니다.
- [x] DrinkWaterVC 좌측 상단에는 현재 마신 물의 양, 목표달성 정도(%)를 보여줍니다.
- [x] DrinkWaterVC의 가운데 중앙에는 목표달성 정도에 따른 이미지 변화를 보여주고, 마실 물의 양(ml)을 입력할 수 있습니다.
- [x] '물마시기'버튼을 통해 마신 물을 기록합니다.
- [x] ProfileVC에 입력한 nickname,height, weight를 바탕으로 DrinkWaterVC 하단에 섭취 권장량을 보여줍니다.

# 추가 구현 사항 
- [x] profileVC에 textField가 반복적으로 사용되므로, profile 목록을 추가하게 될 경우를 염두해 같은 형식(textField로 이루어진 cell) 재사용할 수 있도록 tableView로 작성하였습니다. cell과 Item목록, UserDefaults만 추가해주면 됩니다.
- [x] 앱을 처음 사용 시, 화면 중앙 아래에 '⚠️ 프로필을 설정해주세요 :>' 라는 문구가 출력됩니다. 프로필 화면에서 프로필을 완성 시 nickname과 권장 섭취량이 출력됩니다.

|참조 이미지||구현 앱 UI|
|:---:|:---:|:--:|
|<img width="100%" src="https://user-images.githubusercontent.com/59866819/136822101-b8c0e5bd-f771-468e-b478-8388ec2b5d5d.png" />|<img width="120" src="https://user-images.githubusercontent.com/59866819/135194858-4405d3a0-0de3-4ca6-a594-3b08e0ae951b.png" />|<img width="30%" src="https://user-images.githubusercontent.com/59866819/136821577-f0e40ed7-a1c9-4131-8e39-40a205372e0c.png" /><img width="30%" src="https://user-images.githubusercontent.com/59866819/136821583-d4147543-44f4-4f27-b3e1-93cb30e9df88.png" />|

# 실행 영상
https://user-images.githubusercontent.com/59866819/136825357-6dae3532-fb73-4ad0-b264-343b37945445.mp4
