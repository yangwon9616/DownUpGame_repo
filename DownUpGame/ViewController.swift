//
//  ViewController.swift
//  DownUpGame
//
//  Created by 조양원 on 2021/06/28.
//


import UIKit

class ViewController: UIViewController {
    
    
    
    var randomValue: Int = 0
    var tryCount: Int = 0
  


    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    func reset(){
        print("reset!")
        randomValue = Int.random(in: 0...100)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "100"
        sliderValueLabel.text = "50"
    }
 
    
    /*
     변수가 되어야 하는 것
     - 미니멈값
     - 맥시멈값
     - 랜덤정답값: randomValue - if 처음 앱을 키거나, 리셋 버튼을 눌렀을 경우 랜덤으로 설정됨
     - 시도횟수: tryCount - if HIT 버튼을 눌렀을 때 1회씩 증가. 누른 횟수 < 6일 경우 계속 쌓임. else if 누른 횟수 == 6일 경우 fail 팝업 발생
     - 슬라이더가 위치한 값 -
     - 트라이했을 때 슬라이더의위치값 - 중앙에 나오는 값을 소수점 없이 반올림 처리하여 보여준다
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        let integerValue = Int(slider.value)
        sliderValueLabel.text = String(integerValue)
    }

    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
            self.reset()
        }
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        
        
        
        if randomValue == hitValue {
           // print("YOU HIT!")
            showAlert(message: "YOU HIT!!!")
            reset()
        }   else if tryCount >= 6 {
            showAlert(message: "YOU SUCK!!!")
            reset()
        }   else if randomValue > hitValue {
            print("TALLER")
            minimumValueLabel.text = String(hitValue)
            slider.minimumValue = Float(hitValue)
            slider.value = slider.minimumValue
        }   else if randomValue < hitValue {
            print("SMALLER")
            maximumValueLabel.text = String(hitValue)
            slider.maximumValue = Float(hitValue)
            slider.value = slider.maximumValue
        }
        
        /*
         필요한 것 정리
         - 터치업 힛 버튼 5회일 경우 리셋 팝업
         - 정답일 경우 맞았다는 콩그레츄레이션 알림
         - 인포메이션 화면 추가
         */
 
 
    }
     
    
    
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }
}


 
 

