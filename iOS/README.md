# iOS

## CALayer
UIView에 속하며 UIView를 지원해주는 역할을 함. 각 뷰마다 루트 layer는 하나씩 존재하고 이 루트 layer는 각각 SubLayer들을 가짐.<br>
뷰 위에 컨텐츠와 애니메이션을 그리는 행위는 CALayer가 담당하게 됨<br>
UIView는 CALayer를 감싸고 있음. 그렇기 때문에 UIView의 bounds가 변경되면 UIView는 자신의 루트 layer의 bounds를 변경함 But, SubLayer들은 자동으로 맞춰지지 않음<br>
![CALayer_Image](./Images/CALayer.png)<br>
